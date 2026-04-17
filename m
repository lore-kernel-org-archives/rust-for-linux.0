Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013007.outbound.protection.outlook.com [40.93.196.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413223B5851;
	Fri, 17 Apr 2026 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776436471; cv=fail; b=NnvH3Iqhf6O70033C7US+wjLM0xT02QimsEcfY/Mth+5S0nljX2TamZk6Lkc9YbvC5sE6hh6YdoGTeOjZYyrdlOxEwy5kYceDHKUuWE0NT8Zc4+bqnutexQ//gc4xTIAKsMnID2Gy89hrAdkr54wd1UXgk4QeMCpKFwMqOiMdDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776436471; c=relaxed/simple;
	bh=J9ruWnz5eHdRX3PB1VFocU7zOsdLgETxUJeUIb5LxOs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=eF/zrxvjwCabWIHv+kkYMkQydBkmgvM/rD3iEveJvqg3uqidrf8nObmvMIFBkQUIQDAUrkC+/sNKOhXjPwmOcWeGg4sE8xoPvjc2yKX8JGniQcGEhM2U9zAfThG0C4EX2LKW2ZkkmESsQHXhaIl9ExmgfdbgFflKrQYCqegHth4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=m+Pyv5EU; arc=fail smtp.client-ip=40.93.196.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="m+Pyv5EU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3q33mtwISx43kn2JTG9meBbQq6m/H+iH+WTXtg+FeYQ/ktHUeReEhmklObCVqOM+KGrR4v3TM2Xf4hcOgP042zZnkvOE/EQz8vBCfzlZEtmPA90uh3KaeGN592bSXyl0w/nLRvC8jIdpld8/tjFBf9QBNo0FL0Lfeh1UfdgkO3y6Mco2MOpY4dQI2oEP4NYIOTuIa0m/MG4j3qsQ9bzr8d8X93VlYEnjyLDNPS2Dx9N40353ELHQJ1MQbAE3A9d/fq0VWWqS1NYQ1kuJHxoW/SYTZZl/hwu2gWnaf64lZXma8YzbpCeWqekvhPaqDHILv34Fg2m193S9/iIyYFEIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TR0sjuckpvp0t0ZN6NyHiRJMQm7NlhFs3Ry33oryuQk=;
 b=ZKEzBR2ddjs/w8Yi8bI+0BeDA1jXsomqL68RxNzGzy+qltYxzPi0ZEU+KZwshHqD4KW6rZAaUL75Il7BMIuRMSB4X9eLyx2tZMqRj3y3xYep81oMcy8dPMacho9/5QDwQ+OECz7j7tJZjVwAe6SdO9HYLGEU9SWGXfQwC+qc0WPrmpDJwor+Yvbrr5xjdYv/8A/Gp1rOLz0MfZK9gpahH13Y9tOovHSvIERAXzWHIX0BOrnMRxKtQbs7g30CVhX8irWLyUZ4vLMGk4k4SEqj61xDsDVqiWj+2vZeSjKLX/LM4UqlqOhLJ/BZgD9o7ffcyjZvwi8TkmVsrScFrj542w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TR0sjuckpvp0t0ZN6NyHiRJMQm7NlhFs3Ry33oryuQk=;
 b=m+Pyv5EUT2J6ge7MYxg1QQ9JHiV/tDRk6FJ8G6Dd/dKXrVXWxCwxMcLovoUtub1bFO74CUAGVQEr9mD5YUXrsgUlBAnQCdbpH7nAAQ6U2VWgtUwVnI2EcEwlAVgvujeLsbpmzFRRfwm2q4LK1k0jXRpwNLBiAGU4S54kr163rZzhk+7rQjMdFoRRuem10gC9phrHn5lnqnA8pU1xBcYEZT9KmEUEFi2UXQIP6R4YmDPrf9cw8kEFzOpD3S/+RvnOkfmWxKWtxFZzwKuVYV31+RXeLu1oIdYcBXgUaQXHLreqIw+ymPq5K+4MXztX+4B/5N3N4NxMy8ieDc3o7QuKbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8936.namprd12.prod.outlook.com (2603:10b6:610:179::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Fri, 17 Apr
 2026 14:34:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 14:34:24 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 23:34:20 +0900
Message-Id: <DHVI63Q69LPF.3015Q0SX625BY@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 00/28] gpu: nova-core: firmware: Hopper/Blackwell
 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260411024953.473149-1-jhubbard@nvidia.com>
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
X-ClientProxiedBy: OSTPR01CA0076.jpnprd01.prod.outlook.com
 (2603:1096:604:218::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: 1141d68e-6ecd-453b-c548-08de9c8e6ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	R4HiqnCZtuuFgEPG+nOF9vlecIHboxfSixYy725liWKLUtLTtIRCkxkj6xLI1m5OKXSl0pakbGVbIC/B1ByT7jmYUuyvl3HNSYCJxBV5dvhkGFTbRqm1l+GEOFHYsOzXz2r/tNvyBpgI8FqqVwcgcEK+BcuhcAsPkqiJ1pCUSLzcoIih2DCnMMNaHmj9mMcGpWjOPTf9b+qSm0xaBM2c65qtfa2VceBqWyOAGmEA9ffMVCVaQ8y2bRXGA7taFJffxVbERQ5GoJvN1qtfSFElL+tu4GKgeW9IE+b17TSEODx2k7/zM13cs4OBzASshgkAzKKNBz5wgm6+sbDxMPS/SYgg+b63CWdAJOm4cuNUPkyR5MMkpQO5WyTe1ij9HfVZKesEr3G/5teqaAJlhUhFAJ2zyHdXNyDX4EB/6cFC9r1ksBVnSEf9AJ9FG1tyHGj/sQblfn3sUCWycbSkdZv01g4V1bJRU3pEneiH+Drh/RV80oVEOfVjUrB6FASpRVA+rPHW4fs9aqX7LL1vhEjKY74ieSMgkQypahUfEeZMW+4oRz8W9Zeyy9laqjdNnJEKZoXZdvvpDS85imzfr21Yyc/0VhAsXB4TRdpoToDk6oGmCyBtVYMJj03h/fwyfE9lFfG1Xr5P0OmZMn65gghtZBfIM4taLTjVGfFtDHOTJnMvuFkNXYhoDuXJvnm5qkzYwA/8OXhpikeTVahutZwuswlLCXU0t8BbWucv27/slE8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTZrUjhULytpK05jWUZhN3hvWWp4blh5VUpHQ09zL1FMdkVVZ2pqWkFVRit4?=
 =?utf-8?B?SFV2RW41SlRwS1E1R1lQdzBzZ0U5bS9VK1ZwRWRkZVNaWGJDQnl1ZG1VSC8w?=
 =?utf-8?B?S1BRZGN5ZlM5ek1lbzdTRHlHQkVXUEo0T245Zmt5SjBJNVltaThMOEJtcGxk?=
 =?utf-8?B?N0g4YnE1UXlkUW5XaG0wVzZVMmdtN002c2ovYTc2MDRKdHZUZDJYQTlkQWdM?=
 =?utf-8?B?MTNZcGs3VjJCNlFMN04zNWovWC84VDBXWUU3Qkg5M3g1YmJDVnkyOEZSUnVG?=
 =?utf-8?B?WGFIMkVHOENzNFlPVVppWmhrTGJmS2FnMjJNQUNHSDNpZ0dvVDZGdDZWMzMv?=
 =?utf-8?B?YXlvdW0vMjNXdXJKZ3JNenZydVl5L3VOYklwT2NNOFFhY1Nobkc1VGtkZUJN?=
 =?utf-8?B?SzkwdkFvTm9vbTN6VThxRXBjZ0Z5YzYzQlNEZk5WQ3dPaEhhbUwzUWRUeVZx?=
 =?utf-8?B?ejEyUFpZd09jdWxZcndFUzZEYlVwWnZmeTlvMXlua1E2NzBQOXo3UjhBQzhD?=
 =?utf-8?B?VU9veG5pRGxqdS92T3NRUlIrRUV6Mk1LVWRzdm1rWmRWc0ZKWkNhNDBrcW5F?=
 =?utf-8?B?eUE2YnNtakdXYkNZSTlPV0hjcXFYb2ZDQkZ5THMzWDVvbmZldXhLaEdhRHlR?=
 =?utf-8?B?emJMa0VIWWp6bm1RT0hjemRGL2EraU5mamJTRDRhUlpWNXg0OSs1dUx6WmNj?=
 =?utf-8?B?TktjMTh2eXNOWUltblgyaXpJdTdZMTVWNHFmMmZsc1dlQmVJUWYvbjVoU3JY?=
 =?utf-8?B?SHErd3VITER1ZlkyaVkvRDJ4WUg1NEtWRUlVcEQ0SWVibG1heXZNYzdTR3hB?=
 =?utf-8?B?QTA1MXNtMmtsQUppdEFqekxFb0xIWmJIYjBJYkNFcEd1RkJxYmF1YnRZcnQ5?=
 =?utf-8?B?MWZObndxWVBaZ3BLTXhwUmEzamNyd3gwTGNKM1hyQnRXaHNrMEM0a3VNY3FU?=
 =?utf-8?B?bVpjVG9UT3ViTlhJR1JiMmpEUGFyQ2lSTGRtUzgydjNCM3Z6bWgxMEFkaWNU?=
 =?utf-8?B?Q2M3S1FNd1oyZkNzeFFla1VYK01Wa1dweEdIYWVTcTRhYTlUTURWRDNzRzhm?=
 =?utf-8?B?aUF2Qk9meE9MMjJQckJlNjErYUJEWmJJS0E3ZksrZ2JvQnVaZHVwSWVLNjEy?=
 =?utf-8?B?Mk13Y09wVnQzZ1pTNjNoUmNtTGdkaSt0M2NZbWY4SFYxdHd0eGUyc29RRmxo?=
 =?utf-8?B?dzVVVStrWkNWd1QrbTFBMVFwWUFLM2QxdlZFQVM5RHllWTg5ODdqK2t3ZEo5?=
 =?utf-8?B?KytQeVdWMkJvczNGZUl0RlRhMG1OemoxRUNISE9LajY1Mm1ETlR1a0VxVHp2?=
 =?utf-8?B?WFRUM3VtbW11Ymdkdk5vYUZjOUpnOWJjYzdyREZtOGJ5V0RuVytUb21PM2xr?=
 =?utf-8?B?S1JRU01ic1JJRzZ6QzhpTGpqTzE3TktOZitpN3pFOWEvR2FpS3ArckY3S0Qv?=
 =?utf-8?B?N1JQOG5HVS9zcUM3Z1BEay84YjhHdTQxQ1MvMjJseHJnQ2pjTUFLTWllVUJU?=
 =?utf-8?B?RG8vZVhYaFQ0STRHTnY5QWZOeG1jTmRmTWFuWWxNMzlBUFlnbWdnU0EzYnJD?=
 =?utf-8?B?S1FGSlphei9OSVh6YUllNlR6eTFTT0k1THUya3k0LzFuamVzdFNodGhORWQz?=
 =?utf-8?B?TWxOMC9jeEQ5cmFmS3RjaWdDclhybDdMVjlDWDJNdWE3cUtYRDQyWXBiNTNP?=
 =?utf-8?B?YVRLNkx4clNYYmJXRElUYzl4T1Nad3REWXhLakRtZWlZem1UcVdmL2dzQXFa?=
 =?utf-8?B?aTZFa3MyRFVDbGtKQTFXTnJkaGNaT3ZNZjZhU3hEdDlzZGRUTUdXQmZBYkJB?=
 =?utf-8?B?MWlvTWZ3U1ZObHM5ZnVXdU9aekcvSXk1RWw2aFBDQW03bEZMb0NQODdEcUE5?=
 =?utf-8?B?UE9hUC9mc1FiNnpaK3RDYW45R3JwOHZuSjFJeFB6bDIwcmlaRjFPZllINWVV?=
 =?utf-8?B?QmQrc0VrN0RCVzlCam9iMFdSYjlQbnRVbmpBeTYybU1MY3hRRlRuUWU5cThY?=
 =?utf-8?B?NnVWWWRMUnZOMVhkV2ZKcnBsNjBVV2tGTjU3K096WGQ5MXNmVjZocWJSNWl5?=
 =?utf-8?B?bGY3NnE1T3BUUTJNV1ErL093Q295aHFETTZUNmdYUG5maTY0bk4yQjFhMmdu?=
 =?utf-8?B?cHk5ZitwbnBxamNjLytTcXBxNWNqaUMvZHZuSGxFZ1gxMzczS3d6R29LM1J3?=
 =?utf-8?B?V2t0THRnVHlkWURhVmNsR3A4eFRLWHlQOHJlVks1R2JUelMwWXltd045bVdF?=
 =?utf-8?B?VndMWmJPY1FiOHgvNTZlN1BVWU45V1ZNTmQ3NnNka1Bpc3ZoM2gyWi93MDZw?=
 =?utf-8?B?M1VKcGtRNVhkS2NaTFFkQnB0SXhkOXJwenVVZzRVVU5wMkwvdjIvY1hnSHhD?=
 =?utf-8?Q?Me9ZeHmPKvhuvKzJoQm906zprU+g0ONKal5lUD6Ell6HG?=
X-MS-Exchange-AntiSpam-MessageData-1: cciAxxcIJAug1w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1141d68e-6ecd-453b-c548-08de9c8e6ba6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 14:34:24.1433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzqVAHi5inrf0UjHRlHCd15+qrELKHk3b9DmbIQECeHeYAjZHi+ZogU5ZrjPErRCDw1Ab4SVOJkKUTCIIp+F0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8936

On Sat Apr 11, 2026 at 11:49 AM JST, John Hubbard wrote:
<snip>
> John Hubbard (28):
>   gpu: nova-core: factor .fwsignature* selection into a new
>     find_gsp_sigs_section()
>   gpu: nova-core: use GPU Architecture to simplify HAL selections
>   gpu: nova-core: Hopper/Blackwell: basic GPU identification
>   gpu: nova-core: add Copy/Clone to Spec and Revision
>   gpu: nova-core: set DMA mask width based on GPU architecture
>   gpu: nova-core: move GFW boot wait into a GPU HAL
>   gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting

As these are acked by Danilo [1], and looking good, I am pushing them
into `drm-rust-next-staging` - feel free to drop them from your next
revision.

[1] https://lore.kernel.org/all/d17c4875-f3dd-4743-adf9-05297e8aa29d@kernel=
.org/

I'm still halfway through my review, but posted the comments I have so
far - will come back for a second round on the upper half of the series.
:)
