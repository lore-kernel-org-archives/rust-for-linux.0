Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013014.outbound.protection.outlook.com [40.93.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C242DEA86;
	Mon,  6 Apr 2026 06:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775458418; cv=fail; b=urz1NN+tZASteZ3zxh3U1oNse9bCW8r5mB3fdZkeDO/jrKCVC93r2SSWn7K4xSY2KIyzlgfdMQ/TY7cvHNWI0UbZ+cpnnAkibwYOiQ9IKvoij5eUBLC5BhaHWpJl+IvH7UwHYE4p7X9ZQ6nfzcST4h6xR4abQVCyyaD846ITcQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775458418; c=relaxed/simple;
	bh=aWXdv60HiNEQqRvAJWkDxFh5AtS9qaUY6+n3S4peu5Y=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=PI4UF3J9+m+Dr0VG6fRG2vpcVesKKqW94YMOVKZQUX+QdvwXlE2WPUBIzHXgSg/9BUjDDX8RFfdbIweJywm3vxNZGt/YZQ3ReeEmNYSCmwMhyhbe0Bx5Eu4xGcCsX/HVRaZfYyeEpDTjq0dohlP4Y7QlmtIAzaeXiAbrLYhjdmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Fun26Qhz; arc=fail smtp.client-ip=40.93.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fun26Qhz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQd6wzVt0E/yxlysP19XG5EN4luUZAerbgyg9WUBD+1/0qMjNKl+sG6q62DrNl1N85roLsluA+jWkRBblvKkgI/O0APzNYWM3dhx73vWavSCsZ9N5SxbZiNsBARoQD9p4/b2pNirYKaRTgN/HnC2ej9dgB4Q0r2rwxFAuaHuq9i5SpleFrLQ49+J62TStWmgXukjug7baa/zY8YpG+mV61Hv31JLG/D3uMH/45/8hZVavRUmJVnNbCAlaMmCgtPXmi7uYWkuBwkGX/dj0LVyoM9Z70ORj67Mo/gBXbmygKKATg/TLHF3va08/8Gp4ZMPfDbRlAGejbmOQif99YNhSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kz153enOWNpAJBuz7arohRPc4kvzA0cB44L3Ku0B4BU=;
 b=v/LbZtGsLSCMSjP21l+zDJcQjjp0aIx0vtrGIRSMXbchSykqJfFKKTy2+FnvbhN17aYq3uxwO4BKP+MmxZ3KYVfSYfpmjQ16jAJisFN7Ufzr4J69NjELZFabnsUyjK0H8ssCd054qG3RBjDDqETg/FwU1cbOu8yKzHXljODeP4nIKsV1tBgI2sGOtVg0tOCnX5fRafjwUkpKnhbcYunQ6YocIvEAKpL52zJB5Jdq4QI7Rl/OvgFe/EVnNqE+pyxtxYqOVR5OEt6tkrhIVrmMGJgHb17dOG9IM5wey9LokZ2KkZdUPek2YIzdacDUVZePn135uKZ61fYC4y6c+do3TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kz153enOWNpAJBuz7arohRPc4kvzA0cB44L3Ku0B4BU=;
 b=Fun26QhzVbKvMvUlCoyZA+0fnUQwCWB+e0mWXi/WetQhIQwlZrrSeNGzo4aOXVcqYub/6JFoFP7xWIz+fIlB1iFqwbvz8RsZVpcGfImqqp0nXEOOObcccCDQ0dUvWOFcjQyzR1mZQgNHZjkj4k7TlVBAgIH8bPkRjg1U0OLh8Hdzd2ry01QSmPa9jdkk54Ve2wjWqRFHHAZgNOXiAoySIRhBIPYDGdP2nwTjrd6cCtWgVlEKbHon92xPWq+8ZkYv3xKrK0w9MQ1YZ54ir2EKIWhCZ56GWD0XZDur5Ae8dL/yZQQpJX8v5Y+JHpiidSRJTbwnxLWyGoycx/yJgH9otQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MW4PR12MB7336.namprd12.prod.outlook.com (2603:10b6:303:21a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 06:53:31 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9769.017; Mon, 6 Apr 2026
 06:53:30 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Mon, 06 Apr 2026 15:52:56 +0900
Subject: [PATCH] gpu: nova-core: require little endian
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-fix-kconfig-v1-1-8f634499f7f0@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBTG8VfRubaaYeJV5II5m0ONNqS0dzdc/
 vr6/jd4dIQemuQGhyd5Wm1Eliagpt4aZDRGg+BC8oJLpulii1qtJsPynpe1lkLIuoL42BzG+au
 13W9/DDOq/U1ACA+thAurbwAAAA==
X-Change-ID: 20260406-fix-kconfig-3a059f622697
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.15.1
X-ClientProxiedBy: TYWPR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::23) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MW4PR12MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be7ef64-6207-451e-af1a-08de93a9367e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	oqM1Chotp941wNimybSLum7CmsHWlVoC/0/mZ/v20JwkbxvQpM1i4Zt5OZ2YLVX3Asb7NRZKfeB6/E9Zz/9qM7L7PeEfbS2BCc8dZfY4jsT233Yp+ZDkqEQMoy9JCYVM29X/7RrfDiq1Th2Yh+3pHDBae4b7LvJkgpGOu+U4LVa/TJ8vD3Q6VMtGgD35438H/QuBIkyqxhM66KvgD+YbdT0gsE7U7sA++47040l0KDkAYUEbgqh5F8Do9PCuZlzTt1IP5V6KcYpNImS5Gp+p5HrpJgwpG/weFa7hE5cUkt/JPJ5vMpgX5kxAGozjda3sRj+3BOaZtG9+7uZw7K7Ih5+8xSzttX2N/Gb93tIHJl1b1wq31im+GOJp6yByLy/UGOMhcVVwbD/AfTOlvK7hS6pcEzglGMwA0cHV1/5ka2BpEUoDEfW5tAurTrStwgWBZ94bdrFJffle26utCYoqGT7sVI2CA8xi4jm+/4YnHkc+/36mc/RT3ba29xZ4iAduQ1Mddic7f5TodP9NpxFe+vkm+h2r6gc665q5bPIdstORbRoDZpBHnBj30cLiQU4BWqaagMIC2lfupXu+9yhdu1f0gcZA5CHw5Sc/u8GFtAaK27xugUyVkVA5cjTsyE+9uPC0MBdfyEr0m5fi4S96go9panZIIeNt+IxyWERUMUF/H+OgtGl36DxqDjxuYg4kieDw+/jag95CAFz8pchH72h3pqDxSBsQ3vGxI8AK/8M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmcwWCtrOHZiY1AwbmpSTW11QVhpQlZkREp1NGJsSmVMbTBZNTkzYnV4cmwr?=
 =?utf-8?B?YWRwSE9kRkhhY2Q3THNzRzFGc0Y2SGpJdXNQLzZqR2s2MHFORHJ2RkViOHlY?=
 =?utf-8?B?SVQrS3FsakJEQmdPMWl6dHBWR1NHM1NES3cvZXhYcjRMdDR1Wm5DdDFrb0Vn?=
 =?utf-8?B?eGJpVkpDaEVsSHBmUXZDQ1M5MU5EUnNLRlJoeHozZ2QvU1piSVZ4K1ZNditB?=
 =?utf-8?B?T1ZXQWJmTTRzUU0wK1ozQkg0QUJ3c2NRRk5kUjYvems2bUVuWUJsZGQ0U0h4?=
 =?utf-8?B?TlRLRXBCaU4rdzNId3RkUUp1OG16VDBWVnlzc0psNGZEZEZ6NjNHeW5MVTBP?=
 =?utf-8?B?alNWazBYZTRWUmltM3ZBTHlpVDRXZDQ3OTBsNW5IYTZyVHdXNzEreGl0d0ZY?=
 =?utf-8?B?K283NTI1NWdNMUN0YWw5UkNxU3V1UHZySndnS1RsWno0THNYSVRmMHNPLzBD?=
 =?utf-8?B?VlB3dkFaSWhoTG4wSXEyZ3NybVN5bnM3NWo0UEN0SmVmenRRL0JIZHNVMkZl?=
 =?utf-8?B?VnhYa2pCd1BaV0JMSzVBRk9pRmdwWFo3YmJMUncwbHlhbjJJMG9QUGZFazE5?=
 =?utf-8?B?clh1S0NSMkUrVTVDZUtEd3BGcElpdnI2UHE5YTRPTWdvZ1pkU3FhTjlMdVR3?=
 =?utf-8?B?WURCbVR6NHVFTUdObnhZeE9CL2dSMnM4aS96Y2l2NThCSHJEd0FNUjdDc1Rm?=
 =?utf-8?B?Z3NpTWwvblRMT09heXlpSkl2S01EejM4RFVNbFdjck5QRUUrNDFaNlZCNlJM?=
 =?utf-8?B?TExyendaeXJxSGJxcW51U3pzek9OakdrY1N5TVl1NWtEd1RBOWJ2cUxqVVZJ?=
 =?utf-8?B?MllYYjUzbHUzbWcyOGE3ZGE2L0w1ODVJRzdqNWg1OWljbEd4QlIvQWF5VDJh?=
 =?utf-8?B?SmVYWGJWdStMVzFYeXRQNk4zdktUVWpkZU1xYVJJVTlmdjZBNzFOQ0RPYmEr?=
 =?utf-8?B?aUZqTHJXY0MvRlpUY3I3Q3F1VExLc2VwWjlKNytiOGtHWEFLOTAvS3VGeW4v?=
 =?utf-8?B?VzVtWTZtUFc3NUs3NjhVajV5RU1TRkNaczBsU1BUVU1RcFlBYWJmaTdWR0Nn?=
 =?utf-8?B?cCsrQWplZ1psb0gxcTh2MVB3Nk1PT25yTVY4eWRybGhnWGpXeGlFeG8rQnh6?=
 =?utf-8?B?UldzbXdCcmVoUGNYUzc0amczb3hqU1ptakNiUkVSN0t4Sktnb2d6eFpPSDlI?=
 =?utf-8?B?ZHVqc3c5UExJc1g2eFRETlJIbUkyTjNIRGl3SURWcHdPUVlRMGtTM2hTZGg5?=
 =?utf-8?B?MHlGbG1zSklieWg3OWV1ZW0zQWVVT0hlbEJvK00vejQzZERUdGRvUHA0dzdT?=
 =?utf-8?B?SDdTZnJEckJCa2d4b0RBQ2h6S254SmYydnpZRGxPa28xTHRUQllTT3VFMVFH?=
 =?utf-8?B?TVNFWS9kaHB3cVdTT0hFelh6Skl3OUFjcllGSjJnYmdqUTlKTEg5d2txTTFz?=
 =?utf-8?B?RUFMcFFCZWg3WldtalJWdDVJZHR0T0pWc1VKRFlBcVlCUDYvN3NSWlJNeUo3?=
 =?utf-8?B?Q21TMUNwU0VSWlB4YkxaRzlZYjY1NXFIRFBVdWZibHRiM0JpTnIvazZvNFNX?=
 =?utf-8?B?Tm1kRGk0RE5FYnM3NjlHb1hSZVFTblhRdDlJRmF3TmRSSXBFVGZDV3V3TDll?=
 =?utf-8?B?eTNSd3B2bTMzbnFrUkpnNGJoUStvaWtBNnZJZFRFUm1QemhvVFIva1BqYm51?=
 =?utf-8?B?cERpZXczZW8xcCt1QXdSMldBUUlDaUsyWnZTc0Q5L3pxalpMQ0VCMFJEd09B?=
 =?utf-8?B?MkJtckdzdVZrU3RSZ3BzTmR4U2ZqMU9pdUtaY3NHQTFFeUM4Rlk2WWY3SUlp?=
 =?utf-8?B?UFk5YTdwS3RkS3VSakN0MW42VzZTalcrdnArWFdDY2ZEbVd3c0EzcFg1L2FV?=
 =?utf-8?B?dTA0K28rWUFpVFEvNXY0YUxsVmpLQlNvWHA2UHdQOEpsS3QvWFpOZWNkZTUr?=
 =?utf-8?B?Z0pTbVNyRlJUWEMvZG1CT0NXeVdDMWU1K2ZqVzdQYk16aXRmSlNlRXJFZW1X?=
 =?utf-8?B?N1VEMGdNYVpGYUlJV3RPZldkdU5OQVBUOVo2MjNtcEw3V2ZZMzhOUWhWV0Nw?=
 =?utf-8?B?eFhJOEJVVW5PemVJeTZ5K2taKytLZG9oWDg5RnhTem9zWjlRU2F4WjNFNkgv?=
 =?utf-8?B?bVFUZU4rbkRLZ0dId0wyRlIzODBnUXZaT00rOGlUU0YwZTI3akRwZkRqOFpw?=
 =?utf-8?B?Z0t3NVJISnJVWGxUVDd3c3I1UlNWcHBJcGp1Q2JqMXZJbVp3ZXJ2T1JIbS9B?=
 =?utf-8?B?VmRrOHFvM2hwZTJnMnhRNGVGN1NJNS9zWXpEMzN0cGVaQ0xJWTNrSmF5TDBr?=
 =?utf-8?B?ZnU2MDQ2MU1SVVIzaDdyMnlNM2lTVjJjVUkxd0pieW9Mczh6cGJyQXluTVgy?=
 =?utf-8?Q?Q0xtemENPwN16JxsXjJhHfhNNb4+KoHWATWtfqO8pguyC?=
X-MS-Exchange-AntiSpam-MessageData-1: ZxNTOnqfUmY3cg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be7ef64-6207-451e-af1a-08de93a9367e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 06:53:30.8806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omf+JGTUUKG4i2mqIjChgmv0bxulEpRWv3vaqBfkGsRHA7KsTWkwLyCQm/ZAhybDEZvq0Y4EfDh16Q8bxFL8WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7336

The driver already assumes little endian in a lot of locations. For
example, all the code that reads RPCs out of the command queue just
directly interprets the bytes.

Make this explicit in Kconfig.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
The current code assumes little endian in a bunch of places. I think we
should either explicitly decide to be generic on endianness or explicitly
decide not to - having some handling sprinkled around in various
locations seems confusing to me.

I believe that currently e.g. `RUST` transitively depends on
!CPU_BIG_ENDIAN, so this is more about making the decision explicit for
nova-core rather than fixing any kind of hole.
---
 drivers/gpu/nova-core/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index a4f2380654e2..d8456f8eaa05 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -3,6 +3,7 @@ config NOVA_CORE
 	depends on 64BIT
 	depends on PCI
 	depends on RUST
+	depends on !CPU_BIG_ENDIAN
 	select AUXILIARY_BUS
 	select RUST_FW_LOADER_ABSTRACTIONS
 	default n

---
base-commit: a7a080bb4236ebe577b6776d940d1717912ff6dd
change-id: 20260406-fix-kconfig-3a059f622697

Best regards,
--  
Eliot Courtney <ecourtney@nvidia.com>

