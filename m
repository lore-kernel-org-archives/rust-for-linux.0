Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E5C5D720
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Jan 2024 07:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="etsFj0vC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxmZTYbG1Qgby2hBGcwQwjDbdf6YriM61Rg9ylSNevlZkg0bRO44DDZeESKxBP+iBrcUCRVLksZxrmlRckDhDmpnqdTOmg3yEk8lNzxIFeh5ubtrY/PwmvHB7JrTTcpryhZRJLwn4OW9BjWKlYu1r9MnuD7tDj9RNexAWJupRhRCPBiLPdpT22McCVx4OWuUFaWsGeZLUcSgylm3wSkq1ic8c9CGQd+WOzEP7QGXoMy2UP6OiL6FMRrQsENEc9oxxlnYPUeYY8c4TKcqam6ZFhQjKHvdr/iun9y8NyKcn5Ko5BQ3L5klGYPx3byy4Lprh3aEzqmj+WbDdc40JmeJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BdWTdwkGw8+QKQi5Hwcp8jq059nf6Nz/2dNKlPtvGM=;
 b=DgIWwEdaOXIknbzMyEbatME4l2RtGN07IvKhaibgABHOhtIfu/P2nlLto+fG8hCkv5eNQ2NtotJblhEISwPmnvpJ5IUObQTgoCFat9XaLk6RMYfZJOGFMYCPYi80u2qyg4qFH3ZWEYGAVrGwAXNx5VL/EinneT46rn40W/fgqMgsDOp8KfGcTCpiR0PpvZYAOvbuRgRojwwLUtXeodoJgTn462hwDQBiGuU7E7gLoCQC2Rb++JQduMGi6+g/Sw71YVYtX5l9lcJjEpjyNhrNCZIATzLYjItg5vw2wq1epHZxxl4qdKmnHZBT7I3ZxFZUX4Knmr4Qj/Z9QvQtYn/x9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.203) smtp.rcpttodomain=google.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BdWTdwkGw8+QKQi5Hwcp8jq059nf6Nz/2dNKlPtvGM=;
 b=etsFj0vCVmEcte8B6f835qTUMLDAIbLZCh9KqBoDr4JrI4XUpvh1cQ9/UIfHTZ5mce5dAENMfqgW/+L9Z27jIlohZGOsa60fSDGMWQBRtjmONoek7AC9zADR5TGJxOuAwVo18hkUAXlmxvgu/D4syFl3fIbQngr4kxiqdYWzNHebL4Hf0WRXY3UiHswedxIlhUJZ4F6PF/B3zLWoSsbtlk64W6JFyhuEEC6PoWT+ukhPKed6yUk2YsQ9Kwta0LfsbcYb/76hfVUtassLpv+c6VX6Fs/Y1kCQEOZc1GZRSwdvJ4adwt1Gk7d5VSbwQGbMb6cbxXBFDw+zRZ8t7bEDmQ==
Received: from DUZP191CA0038.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::22)
 by PAWPR10MB7245.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2e4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 07:42:13 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::36) by DUZP191CA0038.outlook.office365.com
 (2603:10a6:10:4f8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21 via Frontend
 Transport; Fri, 12 Jan 2024 07:42:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.203)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.203 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.203; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.203) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 07:42:13 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 12 Jan
 2024 08:42:08 +0100
Received: from [10.34.222.178] (10.139.217.196) by SI-EXCAS2001.de.bosch.com
 (10.139.217.202) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 12 Jan
 2024 08:42:08 +0100
Message-ID: <a5a8449a-dcc6-447f-b31e-cb7f9a9ae706@de.bosch.com>
Date: Fri, 12 Jan 2024 08:42:01 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] rust: error: Convert 0 being an error to Result
To: Alice Ryhl <aliceryhl@google.com>
CC: <rust-for-linux@vger.kernel.org>
References: <20240111064415.908487-1-dirk.behme@de.bosch.com>
 <20240111141439.637461-1-aliceryhl@google.com>
Content-Language: en-US
From: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
In-Reply-To: <20240111141439.637461-1-aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61D:EE_|PAWPR10MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 873a63c6-000c-4d43-de90-08dc1341fde8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AWTUpl9iug0Vep9120r5iW7DxsmUExYWOrI63vzpqprq2Nv1R/kdJJIEHmMtAWC7qWDO0S052VZWnGyICDYt+QRluvw6GpNLc0Qz1yD3lgxy/vNHR2f9sWMpdYo02fkpiHQrdyTT8GWx+5j7AfCgV+qSM4aSynspaXMQZwhUgg8K5Mo0vNxneWA4yvxhhUQzddf3gxUoZrfn784pXrJ53wT+n5JcBxxE//qYlDyaMdcFbK6asfA7XHekeK50KPuoWenpoEiaTunD7fo/sNwUjnHzWbbTYdXKgr6+GkYhu+ENGLtrwcSYmkFD2Ra43q1QLPj7mEOjKw9BhhbYQ59LBZp+SjX2dMM4Y9qlg9VaPDOfGWfIBOp70Y0bSp41VvY/tAWB9xwEJijYu22UaDE5P8+dvWMLfgfsjYWl1gEe92EnLiVlaFsQ5zcW51B0vhyfZjFvINfcolzstBOGORsf/U+re1QfH8gh9FCYAFO360Oq+NPVqlRmda3sKNAe3xPjb4ktW+iuOoU5VEkuhC5H32SOiiQ426EXTG6HDaiqdhGTqXSGerFZr57NylQrhxrVjiQRMZuxP/CXNRM2a1SfSmAXUVlCF3A705WQ+HPNIMwPnzFCXwkpYMcqiDZHfLSJYfa2WbYSjDEwMOovWacWb7qur7tj6zf1xNhKOXKYuI6ktxI8hhdDWHuyHSzWRRmLswb84lqAICzQcCWhKSoZ+iByqL61hlTRhrk/AvSxkdpF/Il0JqDpdnz/S26+xyNtRVcBip7bpzArMJMPRVI1N6GMHrQOvSf000704nVizwg=
X-Forefront-Antispam-Report:
	CIP:139.15.153.203;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(1800799012)(82310400011)(186009)(64100799003)(451199024)(36840700001)(46966006)(40470700004)(31686004)(40480700001)(40460700003)(53546011)(426003)(336012)(26005)(16526019)(86362001)(31696002)(356005)(81166007)(82960400001)(36860700001)(47076005)(6666004)(4326008)(5660300002)(2616005)(82740400003)(8936002)(6916009)(316002)(16576012)(478600001)(8676002)(70206006)(70586007)(966005)(2906002)(41300700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 07:42:13.2373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 873a63c6-000c-4d43-de90-08dc1341fde8
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.203];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7245

On 11.01.2024 15:14, Alice Ryhl wrote:
> Dirk Behme <dirk.behme@de.bosch.com> writes:
>> The existing to_result() takes a (signed) integer from a kernel C function
>> and converts it to an error if it's negative. Additionally, there are
>> kernel C functions returning an unsigned integer where 0 is the error case.
>> For example gen_pool_alloc() and friends. Provide a mechanism to convert
>> this to Result too.
> 
> Hmm. One difference between `to_result` and the proposed
> `to_result_zero` is that `to_result` has logic to determine what kind of
> error to return based on the value of the integer, whereas
> `to_result_zero` is just hard-coded to always return a specific error
> code. Furthermore, I find that usually for these functions, the error
> code you want is not necessarily EINVAL. For example, when `kmalloc`
> returns a null pointer, the error is ENOMEM, or when `fget` returns a
> null pointer, the error is EBADF.
> 
> I think for this kind of use-case, we don't need a new function and can
> `NonNull::new(ptr).ok_or(ENOMEM)?` to return an ENOMEM if the pointer is
> null. Similarly, if it's an integer, we can use e.g. `NonZeroU32` in the
> same way.
> 
> For an example of this pattern, see `File::fget` in [1].
> 
> Alice
> 
> [1]: https://lore.kernel.org/all/20231206-alice-file-v2-1-af617c0d9d94@google.com/

So it seems min 3 people vote for NonNull usage :) Will do so. Let's 
drop this patch then.

Many thanks for all comments!

Best regards

Dirk

