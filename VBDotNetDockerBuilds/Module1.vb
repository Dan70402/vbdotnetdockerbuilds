Module Module1

    Sub Main()
        Dim index As Integer = 0
        Do
            Console.WriteLine(index.ToString & " ")
            Threading.Thread.Sleep(1000)
            index += 1
        Loop While True
    End Sub

End Module
