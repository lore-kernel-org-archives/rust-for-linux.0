Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BB414A8E
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Nov 2023 08:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="ey5vDi6f"
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2045.outbound.protection.outlook.com [40.107.13.45])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455881A5
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Nov 2023 00:53:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhM4MTOUm8ZITOBf9KkPMrI+ac+BCjAbOC3QVENr4Q8uRqrHILZd4vYkTIyI84hszCjoqDiWx8JWudPDkpOTD45jIicLWLw2nowN96qhuTciIOViPPIHWo26QdsBL4xY5Kk43hHdoyEgjra4wqiSafxeKAW0D/8Q/EMHnixWWjLDSEobAuN8kV29VtVNJrsUMUwPSmR52lmdu4cHzvYfQPktZgiQJvtxOnvzQsx3bMniMTeD77woachKk8Lr/iQ7xV0v0i76bNuiV4LwiV2RR3pxy1l1Iz0n8oS+odjbxLJ4Okr/f11fCEMX5vt5yy+GRTX+EwSybNRJBm+adW0BOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDD2E2jK676x0xWNlhx5k0loGzy2cLWvxANg11pCH6U=;
 b=IGD4L+Q7bV2DFhl19+1yLXnW35RNZvVPLDHWOyMhtPHg/iJUSU3SicHq12yuFHMNTV1qCNmr8F5xwI2Lx5Nos0HvhX+B5FnZFqdWS290kFwg8rQmdu4qxU0jB6vBwpym2lJE623AMJDZ697OFn6dHYa4ednWHL+3jNLFMAncNgs/7B7R5Q7mE1Dt8wZOVu/TvvWlp7eb2Idibc93mX/AMfhaZ/C9Q7kPwjG0freNZSmiIvXHFe5LNP9+6FwNJNy0/UFMZsAMhWsHMI2gCIUAa0LOX5CZbPqoeg+fzYhdsnbWV6Gz+hytOvUTxb3rFtLT3XkA0fb+bZiDxY7rogO3hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.200) smtp.rcpttodomain=umich.edu smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDD2E2jK676x0xWNlhx5k0loGzy2cLWvxANg11pCH6U=;
 b=ey5vDi6f9enH8tu3ArDRt431g5wT3hWy3dxKVNvIXOAPpOvSUdUAfckrABkpkKxJxAvhm4fPLUonMbCv+g2FMDeDAuzdl7jiA3tIffnYYID8R3Tlfe6zNmYpDF/Cm3GihocJXMHQn5YS/ZH/r7OtNO8BOYPDXfTDe+5DgswJiEyXYFtCIik5n66AzPXquXTSyaFzNja8Y93sz6IfTGSjnZV5bBIQwZkwSlvdwCQYXHm0QzfRloS8nlvgu0vkI9D6QRe3WcgcRLEdd+5wnaYGL7suKkRKNZH63TkHkqLwx71evBRQv49aSnUv24oVkBXB2b/hNUZEuuYYm7WY4raNOw==
Received: from DUZPR01CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::12) by GV2PR10MB6957.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:d6::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Tue, 14 Nov
 2023 08:53:43 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::bc) by DUZPR01CA0010.outlook.office365.com
 (2603:10a6:10:3c3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Tue, 14 Nov 2023 08:53:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.200)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.200 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.200; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.200) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.14 via Frontend Transport; Tue, 14 Nov 2023 08:53:42 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 14 Nov
 2023 09:53:41 +0100
Received: from [10.34.222.178] (10.139.217.196) by FE-EXCAS2001.de.bosch.com
 (10.139.217.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.34; Tue, 14 Nov
 2023 09:53:41 +0100
Message-ID: <c112cee8-402b-d7ff-74d2-62ae0a27f3b0@de.bosch.com>
Date: Tue, 14 Nov 2023 09:53:32 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Usage of experimental/sample bindings?
To: Trevor Gross <tmgross@umich.edu>
CC: <rust-for-linux@vger.kernel.org>
References: <104f983a-57c1-ff94-607b-3a48d2e225f4@de.bosch.com>
 <CALNs47uSVXk60BYHMd0kQ95p7RAuTe6ooQVTSD_eGu1i5caiPQ@mail.gmail.com>
Content-Language: en-US
From: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
In-Reply-To: <CALNs47uSVXk60BYHMd0kQ95p7RAuTe6ooQVTSD_eGu1i5caiPQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|GV2PR10MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a383da4-8253-40b0-c2da-08dbe4ef3464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y52vSzVNM2LxFwxLfKZ9drUyAcscePcStJ9VwU2PqzRzi0v3XOIzVnhaNDCncHkGdLk5Ww6UdYL3x3dvGOiGq/eWNWD3mCHCdFN9ERmxLe4xeHAco7qp6hs7d4ZWbJPwJoOP+VdrNOVstSzQjXcptNzQDHkZuKqFTOpFo7QHpSRYChW5f/M5XW3tsqdQXzyeb+lJt8pe33PSMv0tQcJ2BcFOLn4YuHg/xwjdl0hDEz21MgsHho9fiOi/cTsDvNZCVX8pAaFlN/+4lIfle2bpYPXO03bUckWePGZgPEXamoZhaalQ5t6QysT1ncq57XXnP1wZ+LJIPIzJYzPV1GM2HNYn7bG/LmjidZktF+Z9rNo/xQFa1nQ47SjueO3WkS/dbvxCUqIJI4a3cBcUlk4LBjX42tVQ35OuMjPaE7Hpl/5y6syoCCqlItSS5BJgeslWNj0377l5V7hd5r+13vyuDpb9h9ISgOZT5nr/crfsaPzKjfzS4CcCBn6a4GL74R4ZLnnZDVcoFjFO6j4RaTcoxpiYwoXFyLPrzXHg6rCQAmlMa9xX1FOlRFx4KQV3y9xxiBaejLWxvjbabfFTU46h/EwFQLlL9ZBQUpxHhyHwZU0yz0MM1g98H5Hzh3aFXscseoKi4Csv/JIwygW35xJ2JovSQXdz0nZGwQlol7oanDO4qf77huuU0MIJ1R+xWJNQAm54eBSfQb8QOxSkS7yJFe22unfGHRGrTm4pFcAE5nzH/tA5ZKIkCo8Zk0bllc41Kv/Fp0u1i3CAtcADcpFCbj+cyudMDFgT+jOi1T7Q0gY=
X-Forefront-Antispam-Report:
	CIP:139.15.153.200;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(186009)(1800799009)(82310400011)(64100799003)(451199024)(36840700001)(46966006)(40470700004)(966005)(478600001)(81166007)(6666004)(356005)(426003)(336012)(53546011)(47076005)(6916009)(316002)(16576012)(70206006)(70586007)(31686004)(41300700001)(40480700001)(83380400001)(3480700007)(8676002)(31696002)(4326008)(8936002)(40460700003)(5660300002)(16526019)(82740400003)(2616005)(86362001)(82960400001)(2906002)(26005)(36860700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 08:53:42.9298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a383da4-8253-40b0-c2da-08dbe4ef3464
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.200];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6957

On 14.11.2023 00:10, Trevor Gross wrote:
> On Mon, Nov 13, 2023 at 8:08 AM Behme Dirk (CM/ESO2)
> <dirk.behme@de.bosch.com> wrote:
>> [...]
>> Unfortunately, I found above Rust-for-Linux rust branch with all the
>> nice examples and extensive binding helper stuck at kernel 6.3 level.
>>
>> Taking instead the Rust-for-Linux rust-dev branch [1] which is on kernel
>> 6.6 level I found the bindings_helper.h and the examples being quite
>> limited. What for example results in my example module to fail building [2].
>>
>> Have I missed anything? Is there anywhere a "latest and greatest"
>> bindings collection which can be used for experimenting/learning on
>> recent kernel 6.6/6.7 level? Or what is the idea for such use cases with
>> mainline kernel having only a quite limited number of available bindings?
>>
>> Many thanks :)
>>
>> Dirk
> 
> Hello Dirk,
> 
> The branch named `rust` is indeed no longer relevant, it was mostly
> for a proof of concept before merge into the kernel. Since merge, most
> development happens against either mainline or `rust-next` [1].
> 
> The branch `rust-dev` is also up to date with some more experimental
> features. The RFL site has a better overview [2].
> 
> Is there anything specific you are looking to develop for? There are a
> lot of abstractions that exist or are under development, but just have
> not been merged since there isn't yet an in-tree use case. Some are in
> `rust-dev` and a lot are PRs to the RFL repo - but it is quite dynamic
> at this point, we can point you in the right direction if you are
> looking for something specific. You may also like to drop by Zulip [3]
> for any quick questions.

Ok, I understood that for recent kernels (> 6.3 rust branch) I have to 
pick either from RFL github PRs or maybe from 6.3 rust branch what I need :)

Many thanks for the Zulip [3] link, for example

https://rust-for-linux.zulipchat.com/#narrow/stream/291565-Help/topic/How.20do.20I.20make.20character.20device.3F

answers what I think was my question :)

Many thanks for the quick answer!

Dirk


> - Trevor
> 
> [1]: https://github.com/Rust-for-Linux/linux/tree/rust-next
> [2]: https://rust-for-linux.com/branches
> [3]: https://rust-for-linux.zulipchat.com/

