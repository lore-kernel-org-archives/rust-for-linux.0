Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2045.outbound.protection.outlook.com [40.107.247.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A9BDDA8
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 07:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="I9K/hyUK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAjL3G8QRScfjS0lcrYhYNt51HzYV+CC1QiTCyZR/DRb9fslbEC+Y9Uu2HIz/LkmrK16fSrhMQMm2YHug+6EJlu7U8j5pMZMUrtleiohP6ntA9TfXOecVCik5nrhMA+DiF/4ZwCUdgYRFLn371vswGm+zX1dwIQI6exM8DlJlT2Ws1oa8c/hA1CaXyIJJYLIXhrFhy1Q7p696NOequ6S4u+iyJptQxBcCmUUsV5xxzPftTql/saIOskUAcjL1HtzbVOYxBq7/+YXUkYhYj5FuvbrHsBegoKLMvCsOdNLC6XRaP7NSQY5+Q2zWJj0IqAlGlQSYjuqOMdDJYHjsHO5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dza3feSCMxNRjp1i0pf3JqIDt5NoLqY08Aa3Ouohyo8=;
 b=i3DwUOwEYtTj6qatLDS4GaHGYxhOWMJdm/bGnMJK5NG0faOr/MVd381689MamPKCu8vIxm0m6pDYm3TzeCZ2x1NGQuzSa8G5XE9llqpNzrmvS4Ojwy35XzPLChLP3lluoKroDwLSUtuYr+ec5YZtdxI2yQBhhChHgVd4TeleKHRCKS7eWU0TBu2ymnIcB4HqJP57KaXzZaB01gYW2M1EIugMKce9MJzAhGCdOcpDN/CH8vIlaAuk3Mt80sDCexC68Dj43e6KoCR4Te0sRtGIR+achJWg8fS//czMdIwvzc7sN9855jTW5kqbLGVYMV30c8khIGtuP3oCeUH9vB2+kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.203) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dza3feSCMxNRjp1i0pf3JqIDt5NoLqY08Aa3Ouohyo8=;
 b=I9K/hyUKIKure1wvZXqFunlKdOetI4DU8uQntH93Rcco7e0+Z36e2zYLGMpOWGdak9nYVI4DoZ8+72xb+mWN1gO2+4lVdfLlUPYUia4BpXywifI3sXRx/tt8JPwwVPrpDM7za8rikU+koJWLOp03zmyCP04KbIgGnN/UDlNWCZo9Q/YrngwGPv7AYpbrXCIKohaRSqN20RjQRLinaWZ88DQKuzg7NTgcLUAd1WmXMu7tPTGhgw1BNqJRQkxEU/c3cmBOjoqv27ke0oGDzOgsWvW/xHpGXbTJgQImkQoOzEtYhbe0XgIAdLvSnm9YWwdPI+8Wqk0NHG8tn4xJyes5YA==
Received: from AM0PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:208:ac::19)
 by DB9PR10MB5858.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:395::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Thu, 11 Jan
 2024 07:29:16 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:208:ac:cafe::b5) by AM0PR07CA0006.outlook.office365.com
 (2603:10a6:208:ac::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17 via Frontend
 Transport; Thu, 11 Jan 2024 07:29:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.203)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.203 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.203; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.203) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Thu, 11 Jan 2024 07:29:15 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Jan
 2024 08:29:14 +0100
Received: from [10.34.222.178] (10.139.217.196) by SI-EXCAS2000.de.bosch.com
 (10.139.217.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 11 Jan
 2024 08:29:14 +0100
Message-ID: <4b2265c7-3ef3-4bca-8237-3752d2915c0a@de.bosch.com>
Date: Thu, 11 Jan 2024 08:29:06 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] rust: error: Convert 0 being an error to Result
To: Greg KH <gregkh@linuxfoundation.org>
CC: <rust-for-linux@vger.kernel.org>
References: <20240111064415.908487-1-dirk.behme@de.bosch.com>
 <2024011114-tartar-jimmy-9e0d@gregkh>
Content-Language: en-US
From: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
In-Reply-To: <2024011114-tartar-jimmy-9e0d@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70E:EE_|DB9PR10MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: 987eec04-670b-4085-5696-08dc127703d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4sNfWUjogiZ2FwwjjOh6BBcCpV1nlfQ+prE5HM9ArpSgnhetTAVgdg3sRmgyG7uVccgfoVjKSYnwhVeKWoGdTqnH1vMV0xMqjIEoJfjqg7zXKR1yxINijOWlL0hyInIP8L5gFY4M+AB7mxgJmJ+xA8KnbU191urb4bhMPhiScyof5Wh06qIsX2cgpNl4K36zavDrAYrRxQ4DNX2a90EdP1wjfoSEeAxlo+iQsZNYDwkjQoor5RcXUdWJ7Ps2x+uDL30f30P3yMDDiT6KXMGv2QVEHU0Pmjo6CyJGhvHBiUiVmcEPP3iHxF7qHHSwsEmm2TG8DejrEMGSnbO+o3WlgSzKte5UI8ufJhUFzikMYvMzr+PA60Qgrz5a0VxHndExqhGcAw9bp+J3k1okF5iaV10VG8bX97SRos+ad1Fg//8723fEI5XRy0m1G7gYqhdYLAdOZZa0kmmS9sxU8Mv2oETod3KbnxjagJznjlpInFCDPHjUDyiFzMAlCI+uMlAi6dkONhV4fhjzhXEf4tCk8kP9yLdH0GkYufRKf+/f7SI2Y4kbjWFT/f0XGTAmNd82DxZrCR5sJ/1Wnnk6gr5+6vm6vPpih8EHfX6uEEGdtgwDRQeEIPddIBh6NRi+rSN6K54xm6q1r1ZSt2baAo1yaKJ4nHZItLOp37qXzTTCZlrrePdQJoVdn+aN5Zqru/7xxdP6H/nrzPfvteO/q8iglh/oxP6lt5IC14iOS0m3RgOltwLNXBC8L6ExWxhQrCj3hg+nlUFVQ28wqj3KzNO/bpu6pzZZRSRR9WGVREt5HP0=
X-Forefront-Antispam-Report:
	CIP:139.15.153.203;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(82310400011)(186009)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(31686004)(47076005)(966005)(41300700001)(2906002)(2616005)(83380400001)(356005)(26005)(82960400001)(81166007)(336012)(426003)(16526019)(36860700001)(478600001)(82740400003)(6666004)(53546011)(16576012)(316002)(6916009)(70206006)(70586007)(8936002)(4326008)(5660300002)(86362001)(8676002)(31696002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 07:29:15.3969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 987eec04-670b-4085-5696-08dc127703d9
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.203];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5858

On 11.01.2024 07:59, Greg KH wrote:
> On Thu, Jan 11, 2024 at 07:44:15AM +0100, Dirk Behme wrote:
>> The existing to_result() takes a (signed) integer from a kernel C function
>> and converts it to an error if it's negative. Additionally, there are
>> kernel C functions returning an unsigned integer where 0 is the error case.
>> For example gen_pool_alloc() and friends. Provide a mechanism to convert
>> this to Result too.
>>
>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>> ---
>>   rust/kernel/error.rs | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> I'm unsure if something like this is acceptable. Therefore the RFC.
>> But I want at least ask ;) In the end this is a slightly modified
>> copy of the existing to_result().
>>
>> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
>> index 376280b6a745a..3306b8f590866 100644
>> --- a/rust/kernel/error.rs
>> +++ b/rust/kernel/error.rs
>> @@ -248,6 +248,16 @@ pub fn to_result(err: core::ffi::c_int) -> Result {
>>       }
>>   }
>>   
>> +/// Converts an unsigned integer as returned by a C kernel function to EINVAL if it's zero,
>> +/// and `Ok(u64)` otherwise.
>> +pub fn to_result_zero(val: core::ffi::c_ulong) -> Result<u64> {
>> +    if val == 0 {
>> +        Err(code::EINVAL)
>> +    } else {
>> +        Ok(val)
>> +    }
>> +}
> 
> How would this be used? 

One (randomly selected) usage example:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/kernel/cpu/mce/genpool.c#n107

node = (void *)gen_pool_alloc(mce_evt_pool, sizeof(*node));
if (!node) {
	pr_warn_ratelimited("MCE records pool full!\n");
	return -ENOMEM;
}

> 0 is normally not an error, why would you
> need/want to turn that into an error value?

Best regards

Dirk

