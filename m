Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012018.outbound.protection.outlook.com [52.101.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF873191CF;
	Mon,  8 Dec 2025 09:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765187704; cv=fail; b=C5Xq4qoMqD0aHItE/YMAlKdJdFiPvXnwzcsnpTb8LVgFHSq7r29Hx4/Sk/AtZyq79E1ACLZHYog4QPbdJQfjmmwO0cBYh41vMKt4j3iYBjKDYKcl2tgPtkGg9heg7YmhHvmdSg6DIDNdbFV3oNg0Y5W5+4nTTNZYmKTbU1BQxP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765187704; c=relaxed/simple;
	bh=d58CztdA/77OkIFmnvFC0gxQn1iX1WBL/H6JisPmkeQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FIqxmOQgX6HgV+G31k8v9L3VcVBYnHCG9l6e7clfoOzTlujaYCV6TTC/0H8iXVbRUwrOSaCXjfiFkB0DSSf0QhNhZhoSBRuL2CReVttVxUAqpbFMgHCyqEH5GtpjYE/mzFd3eusfcnMfXHs20lwD90K/6b5wBoUYFec0ftbbyrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=quCGAzt+; arc=fail smtp.client-ip=52.101.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="quCGAzt+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HL+kEQk+8aaTqhzP/xWQxmKWrQMdeC5qC3wTy0rG+t4ITPlrYe1hlsmG3K6OdIsb1bRebjPGwCBqz1imMCn/vVkt6MUnJAsy+FP3oWYQdX47Elx+soc8uFSaLty/SAVkit7/m00GgXr/GWYhBUzXSb1fq+6MAEKyVLTLfTm5sWo7c/yOqu90bi+Uob5CkWeVhdcsk9I0ItHzdZc5Q1sTrgd0OLYGJ/4PrH1vA042Qr24Jo3ozfvtNA9ar9Y6s3XCEbc6IGxuDh8epllp1buj3HhOBv+rPK/KcWuzNXbXwXaJnUUo1rpjY4CwaXOwnh7P1YffhbUSp+Cd2bVcBxTbKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=930X34z/JPic4p0lQlFB8WypaRp47yL4Emp2p1BCoGM=;
 b=JeIqhRJ6zK/AhYOag9Pz4TLwtvDJc6kqqWOybbqdR9oDnbZXJOrxF8VetQ4W16hHLIZd+aZgvrtmKhGcIrKBcz6cinsA06/YVqRN8zVsZ0NKn5zesP5fEZnOaQmrxVw6DPqoS+Zc7wgFoTKYPR6ks7HYRlFpzYJW1P9pigm2F7qDDaAoC/dhvfyl3YxqtpHzfeTLHR687iauyVYiAbO2oJlH1oI1GO6rc51p7toTSCo47oKJi2sFaxAvp/QrvoLi3BgrxFfRnVgVKEPSmMBZvnr0vvY1cjVC31PQNS898GCRGuE1MTy55VTd/H+yXhODMUW2ZBeyk5XUi/t6xpw5Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=930X34z/JPic4p0lQlFB8WypaRp47yL4Emp2p1BCoGM=;
 b=quCGAzt+sk1kXbTOHIYbFzM9h6TNoUX4S8J6wu0vYLPSyV/AVa931uL5aHE42u/3y5uO/pV1GVmfbC2J+GESHolsgJ64tFbPjD8HSknfsp7JllUtiOvrLSj4iliBWOtwAuw5FvfrGxpJ7wVgFhCjxYTQ6KbE4wSJlElBHVtKmrZtBGMlBcGynlz+CHMVxGB4B2/kR9Z4uhqDFCxeWb3sWxxqqZ+u1SYQW38sdCfKQ6OA7hlSwy11Yckl4/9aA3p1pakBdr+e6LIIxTSc7IHJn/CG3/GuFqrYaonUuEdrN7CYPEDObE+JkxQfKyg14QLv4FVDbf6ZorLv/tbVrljdgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8005.namprd12.prod.outlook.com (2603:10b6:510:26c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 8 Dec
 2025 09:55:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 09:55:00 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 08 Dec 2025 18:54:41 +0900
Subject: [PATCH v2 2/2] gpu: nova-core: gsp: use () as message type for
 GspInitDone message
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-transmute_unit-v2-2-aa17a6848afb@nvidia.com>
References: <20251208-transmute_unit-v2-0-aa17a6848afb@nvidia.com>
In-Reply-To: <20251208-transmute_unit-v2-0-aa17a6848afb@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0043.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f093eb-79ab-4b39-4459-08de363fda2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2hHdHE0aXprbklDZjIxbGtJM0JwTXJ2TktMb1laSEJPVklZcnowNEFwS0FR?=
 =?utf-8?B?eEllZmJtNDczbnVyOG14cTN6Nmg1TmdoZzluSytpblpma2lkWTBTbTlrMlJL?=
 =?utf-8?B?S3kybDVHZ1lkemdBekVnaGlpTE1oSEdqa1JLNUVaQWF0K0xmTlB6MEFhaHlH?=
 =?utf-8?B?NXByQWsxM0hac0s1QU9VK0FFN0pCSWpzUlU4RzQvYTJQOG9FZUdLQk5Dei9U?=
 =?utf-8?B?YWdiT1V6QWdDRXU4UGdrMVVldmx4WmtNN1I2dWxoaElJcE9MMXZsK0pSbGJi?=
 =?utf-8?B?UitsWWRYdlFoSnc4N25ZNEpZNkdtVEZ4MTNRZDhTWWp3U0ZYN0hrdXl5d1d2?=
 =?utf-8?B?UEJ1SjdPNG5TVk91Zlg0YWRFQ2ZIY0tCR0Y4N1BTSWNlOTBvWGpzck5Ub1NK?=
 =?utf-8?B?NEU5ZEtyWEhTVGdFU2RnenliUDkrKy9ldVhCT1k1ZlZkK1JObWZlTU5kbzcw?=
 =?utf-8?B?czlVbldjYTBobzVDMTk5TU1nekpvNVMxS2dwZE85WmdhZmp1UUMvY2t5THNW?=
 =?utf-8?B?b1htTTJYVkNXa1hLdklVZS8yamIyaktEaGloS2JBMWIxWHNuK1BjZlplQ2dM?=
 =?utf-8?B?Q053OXdkQlNobThwL2dhamJyL3RCdTB0cjVSSHdYdkswdFJ2R0tBd3d5RlJL?=
 =?utf-8?B?dUYrQUlvTlc2R1pYdHoyOWpoZTJIc1h3ZTJlM1hJaGxWM0ZDemFLeWlCRnY1?=
 =?utf-8?B?YVhLUEhLWkszL2cxVGgva3I3TzZFYURHQ0FpT2VraElxbmZZMXBhdTlqRzRZ?=
 =?utf-8?B?ODc3Z0lBRkhiaHl4K1VoYnBzMnFsSjdrU2h2M3ZudGFuSDlCQS9HbTlBY1RW?=
 =?utf-8?B?MkV2TDVvWm15cXd3cWRRRkZ0S0dhdUcwTkdBT2MwNCtyNFZtYXJVZitiUUNZ?=
 =?utf-8?B?SU5ZS3lvU1BLak1EUnJZNDFPMVR1bUdteFFzc25ROG9rNnJBVThCNnA3WEFw?=
 =?utf-8?B?d3ZmcmdJNDFSWHhUcXJoK0Y1QVNHNFFoR0dMMjdOTXFyTkxzNHN5TnZYNlVP?=
 =?utf-8?B?bGJpWEYxYW9kV0JpWjVEWitCbTJ2UmU3Sk9ZNWdQWHBxa2NNM01zZlZyTlBC?=
 =?utf-8?B?QWZRMVBqWlpGcjBaSXdNUEtwblE2VEV2K29ZVDdCMk5rOW5wUUM0cTRITWhw?=
 =?utf-8?B?QkErVFlMQVBaOGEzSkdZRW51c0JxUFRMaStWWkg0U1FzS3dZQXZsVDQ0dVE2?=
 =?utf-8?B?NGxHTFhNd2cvRnlVdnlUaWVRb1QrMG1YUnBaMlVwRS9JSUZ5bjZSaXBhd0Zr?=
 =?utf-8?B?Zmx2ZGFzNFFmdjMwL3lBT0ZHTmswRlpOL05obE9CV0tlNzZzZzRWOHAxcW81?=
 =?utf-8?B?OHhWWThjbTBZWkhGeXBEQ3pqSzBucVk5QzhzNTZrdW9WY2Y0YWxRa1ZhSXEw?=
 =?utf-8?B?cTY5S1N2RWlUWm1pbzQrOGdBdGRScnN0VWpKWjR3ay9KZ2FxYmFnU1EvWWlB?=
 =?utf-8?B?MmdpYjU3WG9nc3o1L0ZwZm92L1dKb0xSV1VCTEx6b2VWKzJvaFF3ZnUzZ3JZ?=
 =?utf-8?B?OHlyR05uQ3hkMDRvMFNtZ0xRN1BnRXBHL1Z4dXFwdzl1dWtXaXBlL0Z2QStq?=
 =?utf-8?B?a3d1b29GUThsQW1LT1J6c1dCK3dBb3YrcDdZeElVeEJudE9YdGRUS2FJcXV2?=
 =?utf-8?B?aTNRaTdvRG9uQ29NbklLT1k0TjcwbmswT1BXdktodW1jb2l4RUVVUVJqNzFr?=
 =?utf-8?B?RWswWXNxMlhOMDhYb2Vqc2ZBUDF6T1JaNEJmL3FSTjhwWnpsNlFRNndaU1pi?=
 =?utf-8?B?UkwvMWJ1NFZHeGxWT1ZhTjRHckx3cjZJSWVXMGxjLzJMVHNkOXU5OGh5bzA2?=
 =?utf-8?B?a2tBalhHT3FLRjlSUytHc3o2clhLZ1VraU9NZ0JJRWtzV2orS2FjQXZGVGVB?=
 =?utf-8?B?SVh0MzVmT2tZYkhzOGNYM2JJc3ByNEY4TEdSSEFwQlRUNWp6bkd2dkVsTkFt?=
 =?utf-8?Q?5+xmmiFDLfREgFlDXCjusVtDMTTO1Zc2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWZnZkN1ZWUrejNTaVFHZGtzSCsxcXlmdjBKQ3lpL3lsRUdZNHM0R0FWNzFL?=
 =?utf-8?B?ak5GS0NDNG9WVDZXdlR5OC9sdFhuOUJtNEhFTjIrUERSVFBXUmp2ZWtMczUv?=
 =?utf-8?B?bmc3NExWcjRJakhveVB3b1FidUFUVUE4L1E2YXN1UHdYWmhtM04zdFh0M1Vs?=
 =?utf-8?B?NXJEaWs4Z25yT3NjbXR6MERXcVAvZnE4U0U0dC9XRklOc2g3RGVPRTY1cGY3?=
 =?utf-8?B?bU5UT0hjUVp5WGZYY2pReHUwZnVyeWdobzY3MjlPZHIrNU0wT25qY3JiRW11?=
 =?utf-8?B?cEd6UFVxaEpROFJtc050SVRTR1NiKzViTVdoTlZrS0wxNGVRSHB6MGc4dVFH?=
 =?utf-8?B?WnBsazA1NkljNDk3b2tkWjJ6M2pWektxbGJnQXg2S2FLYlFCMGRsSHc1OElP?=
 =?utf-8?B?cmdBcFg0aVJJME9mbUZWZnE2NE9iVmxtWnlNS095Q2lsSUFYelZiK0NSY21O?=
 =?utf-8?B?cWkyV2g5N0gyajZkZG93M3dUVG1VSHpmT2VJdDlPcW43d3llK0dvYTJ0UXpN?=
 =?utf-8?B?cDNxbWgrZG5icERaUlorajVwVTEwNWwzRDgwdFJQbEVlNndxWVA4NUl6VHJT?=
 =?utf-8?B?M0ZSK0NjdGkxd3dUS1Jjbzd3OElnQjM0L0tHSHcxZkREZ2lZSjhvaTR2cWpM?=
 =?utf-8?B?eHdySDVnZzBSRG8reW9oZWlnM2dXdnp6K2M3QU8rdjg4VlBQVkVnSlZNMnU0?=
 =?utf-8?B?ZG0wWVJaNEEwRmtxdzFLVkM4RndpYTF6V00xbXI4ejhVVTVKV3dpNy9nZlpY?=
 =?utf-8?B?b2czT3ZqdWNzOFlhVjJGWDJVOEQwbm9aUmNMS3NTU2ZWMGxGVWxNMWZpSTc4?=
 =?utf-8?B?a1QyRG9ISGQ0NFEwUWNqcnM5c3lLRlVQN1ZJSGIwcmpSWFV5Y0hTT3pYK3F0?=
 =?utf-8?B?OCt3K0EvaVJSTTR1TEpxbS9Ed0E1MnJxN3prVG44dzhPNWJjc082V3hiWlI5?=
 =?utf-8?B?c0xId3FVWlEzTzNEdGVTZWdncmhGdlVsL1JMYXJHTXlDVWczSGNXeWgwRU1j?=
 =?utf-8?B?ZmF4VDFCcnN5aHp1UnEyUXNKMko0RlBjSEw1RnlVd3dXYWV6Ynlmb1JWV3Rz?=
 =?utf-8?B?b25Nb1ZqKzRBaHpQQ3VzKys5WHRYQnJjVU15akh0bXZvdGVrcFIvY2hOQlVW?=
 =?utf-8?B?Z0tPbS9qbm1BWkVYcnZxYThhMUpjaXUvWTZkc3grQ2EzVTRoeUVqeWN0MFhB?=
 =?utf-8?B?Uk9idU42dkcwMUlSNjMyaTRoR29nZWl6SlZSZkVraEJJWHBQSllXZGh0V1l1?=
 =?utf-8?B?S1UvbGU1Q0JXSWpWbERhU3U2NGd1Wm5vWjdTWDhHTlJURGFNRFlDcVV4cmZo?=
 =?utf-8?B?MjZMcTBzNEZUQ3F5bjFtV0puSWpXbG43M0MrNXg4VnFyZmg0M3hlNlI5Vklp?=
 =?utf-8?B?QWhPVnVxOHRadHROVWVoRmtpbnNrS0Nldkg2Zlc2RTlwYzhCZHR6cHlVeTZB?=
 =?utf-8?B?VWdvVlZuRTFxRDBJQlRnZ2xCakN4eWphVVhIOXpvSURqZHBiS1NydDZmeFln?=
 =?utf-8?B?VUQ1N0VhcStKOTZGeE9nZEhzdW81Z29GazFoakVVQm5QU3A5bXVxRnVmYVRV?=
 =?utf-8?B?d2lRa0xCeHZsYlR2MlRMdGRObDFKYnJ4MS9Dd2FzTmdNaVdvc08xUUJsOE56?=
 =?utf-8?B?NlpsdStxcGk5cVArVDBUakczYjBKc3JRay9IQ3l0dFdrVzJiM3U5T0hxNElw?=
 =?utf-8?B?WHhJa3Z3WjR6Y25SUEgxM1lMbmtPcWwwOFVaZkhXTklEKzFNMlo5aFJJdjdn?=
 =?utf-8?B?aUN0WThNUzM5WVhjN2Rra1NFZDB3RlRkbU5OOUgyLzBnTGZOSkRPNnNWWk1r?=
 =?utf-8?B?U1oydkxLK2RMTHJlTjR5NzU5Y0R4dFFLSm1yS2VmSmdBUWExblZrcUNtMnk3?=
 =?utf-8?B?OTFvaGt0bUNWS2ZzSTJTUDJKd2t1WGRNcWxMbFY3SFBodkp6azBmQlpsSjJG?=
 =?utf-8?B?WnJKOGZmQWRHMHZUL2tFSTFTbHJiUmMzOWwwVnhPcmc0ZnNpci9Vc09kZzlX?=
 =?utf-8?B?L2NLbjRwSC9WWlhCMk5DQ05YQ2Zld0lnN1VMcHFSRmc5cFc1ZTFzMDBoVGla?=
 =?utf-8?B?M0psM0xPRk9ncXI4aHFjbUxDanhEV2VnRGtEWFN4eXhvdFkxNWJPMnlPVS95?=
 =?utf-8?B?c2FwaFNDYXRUdXp4TzBsN0dSb1RBQWdlRkRIMmY1K25HNWhwYzVLbFpxbmk2?=
 =?utf-8?Q?IyDkdbNo4wHgABX5MIs6YLHhNSUCbG1YuiKPvaShKQ4P?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f093eb-79ab-4b39-4459-08de363fda2f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:55:00.5761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZvd+7Up+6mgbta3J7fX+l2hpnxKAFHA2JCVPHgikPQTEL9davBk/BwkSxTR8y2s1EA8ECqnjOukQ/+tMlTRQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8005

`GspInitDone` has no payload whatsoever, so the unit type `()` is the
correct way to represent its message content. We can use it now that
`()` implements `FromBytes`.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 0425c65b5d6f..2050771f9b53 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -142,7 +142,7 @@ fn init_variable_payload(
 }
 
 /// Message type for GSP initialization done notification.
-struct GspInitDone {}
+struct GspInitDone;
 
 // SAFETY: `GspInitDone` is a zero-sized type with no bytes, therefore it
 // trivially has no uninitialized bytes.
@@ -151,13 +151,13 @@ unsafe impl FromBytes for GspInitDone {}
 impl MessageFromGsp for GspInitDone {
     const FUNCTION: MsgFunction = MsgFunction::GspInitDone;
     type InitError = Infallible;
-    type Message = GspInitDone;
+    type Message = ();
 
     fn read(
         _msg: &Self::Message,
         _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
     ) -> Result<Self, Self::InitError> {
-        Ok(GspInitDone {})
+        Ok(GspInitDone)
     }
 }
 

-- 
2.52.0

