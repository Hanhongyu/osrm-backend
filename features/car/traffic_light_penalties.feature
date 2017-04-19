@routing @car @traffic_light
Feature: Car - Handle traffic lights

    Background:
        Given the profile "car"

    Scenario: Car - Encounters a traffic light
        Given the node map
            """
            a b c 1 e 2 f
                d
            """

        And the ways
            | nodes | highway |
            | abcd  | primary |
            | cef   | primary |

        And the nodes
            | node | highway       |
            | e    | traffic_light |

        When I route I should get
            | from | to | time |
            | a    | 1  |  16.5s |
            | a    | 2  |  27.6s |
            | a    | d  |  18.6s |
