Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E4BC4338F
	for <rust-for-linux@archiver.kernel.org>; Tue, 10 Aug 2021 08:56:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D47E60234
	for <rust-for-linux@archiver.kernel.org>; Tue, 10 Aug 2021 08:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhHJI4q (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 10 Aug 2021 04:56:46 -0400
Received: from mout.gmx.net ([212.227.17.22]:57723 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236811AbhHJI4n (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 10 Aug 2021 04:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1628585778;
        bh=wwO12nJA3Y+Hxt+k7N+wmJ2pgDh+j0FXUjzW+1VI9gc=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=TA+08GfdOhn7Yh+fGO2GINJH3YqDqsKmOVKurmln1K7GOyLbtDZJLf5sB8J9nXSM2
         wXpIKLm59PWj03eCVoq1ntK3k4lRqThzBogGi0ySizvoqft0HwBUUTnuclEYCpiPHb
         hgYuwE7LN+hm9rb8TR14+6CkTyMm9HANjSt8fn8I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.64] ([46.223.149.72]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mi2O1-1miZVL39EX-00e774; Tue, 10
 Aug 2021 10:56:18 +0200
Subject: Re: Add to the list of rust for linux
To:     Cesar Guzman <ing.cesarguzman@gmail.com>,
        rust-for-linux@vger.kernel.org
References: <20210810063241.7C774C061796@lindbergh.monkeyblade.net>
 <CAK+vCJBoEWS=aQF-O+b1srhV=YczoGG-3QctLP20DUiL1dx18g@mail.gmail.com>
From:   =?UTF-8?Q?Volker_Wei=c3=9fmann?= <volker.weissmann@gmx.de>
Message-ID: <497778bf-5693-5e58-f367-3fb1543a2e88@gmx.de>
Date:   Tue, 10 Aug 2021 10:56:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAK+vCJBoEWS=aQF-O+b1srhV=YczoGG-3QctLP20DUiL1dx18g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:R7OsTp+rvhPgcR07aHK6Wg8OyNphky7wwta2nLzVXYIxq7Gu7Nx
 k4DmoS6BRtZ6UFZV7D0yYsROAj+C2pXPOx1/Mq/6pKdKijAhRyTkXL1fAtqU+CztJLwmCoo
 hRo6zZQRk/UE/UxwkIhgwkfKCnRypb3xyKgpgA0SyM8N4oyKI6T65rJn+kn7KCIc8WHihn9
 gxEk5AUGwMPweU+wjObdQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kZijoVF23a4=:FmpKF7YYKBI4sctjHnxxDQ
 0c0W1DDrQDSNmX8mpQzTGi1vbWr+ojbTE6NX0x6K9+MMscAyQIfK5lzO6KiFL/Lnb4ARbSsU0
 /Lo6/hHgSgF8HiFRx7TkvRL5uWmk9UMfAnqt2sSf/x6OpTrrGCsQPIbdjQXmMxXMqedudm4bN
 weWnysoVVa17VbnHvW2QBeevZAeEv9aoQmr/GYa8vMHhCjz+GkeRqTC8K7un9V1mg57NNb/b9
 QT0VmOE71aduwJrR74IjbF29UVXM3Em3alJoXN7pGXbUhuKvyi8CKgZ3fVnlUPP27nQDNY/Hv
 q4j/SAUMmUaS2HJecL4AssvfBzSF5HMXXCXBQUjjNbiZoNcr/l/er0znPlC4UAPzsglwhYV42
 /ZO87HS4BA1Dg0WzmRw1LR+DsXvd26BF2JQZ+1wWKnfvp+G0VZn0zjQ0CwzVh7eL6WK2caM8O
 t12vh7PE3KdrElNmQJcfdHd6jj7UEchbQNUqRyYkReN+cp4OlkmB31CwikID2prNK/ysEeQ4X
 7Yljfv/1h3Rk+XmPKsfCL9ysQ15rmjMTX/ckTn3jRjggGebM6rIJ7v/TgqJN2Chxoj29pFXKV
 LrSlCM7jVWGCjdXt4WYOYg+1mo8I5Wo6uvSe7WpZLbdv3sOEIogMk8lmiuVPI/d4NYUL5hEkQ
 +7xD9ebRVex5siJ6aKsOqcHDAy45i8WqFYPntXlyjKpvo3h/l3dEVMKBLbMYfd2jKeHX8K072
 pPofEFHsT+u3SUqbRSk1R7PLc8tiop1jpNj4owjbnlh2iU4dIKJ1l8PBs0fI2VixCvEh619qr
 sngEDaJacgtEPi1Wx93GJ2Wh7airJJZ28dWtX+7TW9pYRXlL33QL2MGNql4/xNh0Uw7AGLeSW
 PRjTXDW1cbyNikBVCVYVc/IYlnvivChsi1YYY0rdKDA5v9R5CI6mLUV2wOIo7/T/tLvGass67
 D+T7A6fkgD+VAW3xeLc/FQWMJpWQiB3JM3/3eO2o5DSGWQRfrX2UBIGeNObWITYTsDbxoGmeD
 hvK7z72oWwD09xjyaR72FZ5oZQ1xQYMQAV6v2j1FMnfWF4Hsn+Ktl6nJ24UUJO23e8bqKvago
 HNla2jE6xOx4dyV1f8kpyR0OzOc9OSOIPGKzPbe3oOiEOszRBE8OXO+YA==
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Send "subscribe rust-for-linux" to majordomo@vger.kernel.org

Source: http://vger.kernel.org/vger-lists.html

On 10.08.21 10:48, Cesar Guzman wrote:
> Hi there!
>
> Can you add me to the list?
>
> Thanks!
>
> Ces
