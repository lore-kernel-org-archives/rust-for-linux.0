Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011018.outbound.protection.outlook.com [52.101.57.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9A434AB1E;
	Wed, 25 Mar 2026 21:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774475818; cv=fail; b=sKJ7viMzEGQjg9HeS1SPTXkpYdIFl3i4QW1sg19DmCE+baREyRkZKkCf8IRRe8NrHoevlhhA5+che9omdj44VC4RUPymNdY+feBZzbzoO1VgY/CRgfJsJXlqqt19f3lpfTCYqvDxWcnykh35SyIAgtKKt8RahTcWarsM8wL/CRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774475818; c=relaxed/simple;
	bh=zOWf8A+3aWqhhEpRwAxUvkN34lgvQHMzJblTJJurIzg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SXYMYpmHqL1OJzqO0wDP8hWCc/b0n12Mk5/qCly7eZRjR9TrsO4QhgnOmCIcOW5sVEmjhSSIceSExZ3x5wJTvMMa2znmFGIVT7Cmr9Mak+H38MMDagUe7XRZSyQ851nZ9Ik4fp8HXRHgh24SEK4pPAMqY2WJPhKeJ813E4MfY18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n/AQNa+S; arc=fail smtp.client-ip=52.101.57.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n/AQNa+S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0MobQFtL3V16Sw8GsbFSGIcrF5koyPqxtfGnKLsSspWOTGqJTNSo7Leo7kxZ1pkNAUlV8foGtQqPgF4jx7QjWBx/kj+l49Tg0eVSCLXShL4yO/vyHK9OGQsN+oCP6S8p1WPTMhYMRSPOEZQfN3CHUzSHnkgI4pr4sF6qrgti7dqhSq7N5FH+49c8OPkcCRonKrHiReW0Z/lOFagCSGlR35h3da1jsR1JlQQ+70s+d8+GbqcHK7NueCdrWdBJx1qpKcM1d+leJ19FUezEqE8zfKFhUkOZ1kZs1OIyFeQouZa7UDf8U08A3O9nUgmwD9b8BF5DsjiwIIfZKRg5W+ksA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MBcxd8wndFQnj4JvYPlQX7mC+IwusfMnWXalJYeDiY=;
 b=BEXCPGiBQ0NYsqlI779o1yyN/9bxXW063Q+c7n0vXy94Axh7CvnsNkQWkROpQ2iYtyQ5p0Ba7R0yhykTiPrBaotxmORKsysKO8xOZE8wbC6oibGpFxZ1sJP6cCPnCmZGohrHp8a/woJQ5yKvdifiIRHh4edjwLT2coGrUA6yUzRNCWpDfN7+VHuAt/JYAmXbkzGvlo84+G2Q1B+pDBOyQgJ19SnaBtLN1gYZstP2p2oM5b4B9NseHvSwApjK/V5XpNxJcLXizsRABsnE1u0fHNLZpgbi3qw9WVkfqHMMm35zsd11HoEj7QpLW6GvOqJVX9JghwWRqElb3a7fyl8pLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MBcxd8wndFQnj4JvYPlQX7mC+IwusfMnWXalJYeDiY=;
 b=n/AQNa+SAMZQtJMynooBOYW90hiNgkbP71rYEKO4DfFtXlWxOrlY3QtWY5USRWCeyJ/smLPOdYDgUZxe6TCP/3aZMvtdZwC3pxJjrFfM7MD298+KQej7L0xt6O3llfdVxpjV7wV3h2Vs0kYBOezpbZy4WoSWW864Scu8Y/a083S1t9wLvaxXQvLStSKAiAHEzmPGOoVb37rlrU6JPVF0hhPzg093wHHlRjwP0Qmydn+hXfyAy8OMMoSPO1vGm2GsYqoIQ5pRzMJqzZTSZP8qdvT4LxjmOF4Di+Sl+pOVJ35/uh9dSXVXHwXX60iF4gpdM0pu/5c/NTyisbyrTl1U2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB8473.namprd12.prod.outlook.com (2603:10b6:8:183::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 21:56:52 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 21:56:52 +0000
Message-ID: <5db75d43-830d-460e-b377-9a1f72c21fc7@nvidia.com>
Date: Wed, 25 Mar 2026 14:56:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/31] gpu: nova-core: factor .fwsignature* selection
 into a new find_gsp_sigs_section()
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-3-jhubbard@nvidia.com>
 <177443554510.105362.9416236198599659187.b4-review@b4>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <177443554510.105362.9416236198599659187.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: 03cf2f2f-6f26-458f-a8cd-08de8ab96c1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1ZdgTI+HNES6yCRwrblH6v9R1Ic+FL0oCKg0QUrnwf67hVRuwA4HF2MrkEdm8xDAQQMAbvX733TU4i6DdXik5KsaPhKkKOjSx8HT2HiEkFc5wVF86+6kWS+kE1zh6wAlQPHRqDDMHtBq24dxf4OsSPlXWOqsVt4OlKnskeBVCCkxwpIYLa5kuyj6cDaHZmkmAP7tJZFPGC3fUZaVe24Yf6CWY4kDD5xKiC2gDGfIGENkaZN2jC2h/zY+k4wxtcsO8c3UjFFOr/Qc/6omFT+ChGYq2/KFJTYCuTfoR9Mn+oBG7idrf0cfhRUlwBzCPGdWckfJUiGCwik8mEySgIHpNANQS0hL7/raH0EbnFgyLj8qjEHIGZ7Y4m8BjizqbGhj4CfZgB6Hh+sgD9XepvPs7PO7gRm1iBBUU6SsQF1d2NhQFSg5QXJ2DMcWJRX/4d+LGdZtL7A68UJO49Rcc0ahS0sKwVhi1avbn193JloSpmbzvjUncrDwArQ9/rCKsZFostDQqBuGub6MieXesiurCsfLmAcqAOwX1H5VbQy8KRLVZqp4+/LtmGHdrfqGaDHe6nEAS0BxosWZcT2B3MmcGDw/Kum3RMVfU4fnB7uS3stlbKOK26X6E6/Z9wxWd3AHxkESCH2rLTZuNnVwQdKQGh/8OATVx+8N/r+H5QQfjp98nDjq/bZ8kuOaJKOkLBgxveNa45OwmC9yonDvpTufL08iFGjF34ECobjw8RgULdw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGxGeGhLVy9xc2ZSVzFWdnpxSTZEelQxTi9PdEQwRzUzR1VZQTFtQkh4Z3pQ?=
 =?utf-8?B?OTBpZi9wZjcrSGZPZiszUEExTmNwWENxb2NVYmVBRkZzVDRCd2F3R0Q3MjJB?=
 =?utf-8?B?cVdwNGlGWmlUTFFQNzVJaXp6amtWcmhHcGpMcmM1bnVUUXJOaEQ1VlpBVHQ4?=
 =?utf-8?B?ZlFQTWZSaHRiNUdmUlpoY2hoeVI1Y3hNM2djRVZTd1VjMHluTDM5N1g0eGRG?=
 =?utf-8?B?TDJtTVBPVmQ0dWRGV2I3eDlHOWNUbnFyQW03RXdWbEhvTDN0eUVtcGYwTVJn?=
 =?utf-8?B?SW5rd2syb1BaclFtdTNCNVptNEZzVm03ZmVxcHdVQzV2Zzc4UTdGbGNMNGhy?=
 =?utf-8?B?MTQ0NTVTNEdtcXptNzMxTlNwa1dQcnJKTi9oOG96VzdzWGFVMVgwcE9Pd2hQ?=
 =?utf-8?B?S2xJQkhmc05sZFQzZkxHMEdNUXhWWkdyVHpKY2t2SVgyRFJHY0ZFZGVoOHZn?=
 =?utf-8?B?SHgxZHJZcmVTTzFJYllvQTVOVnhENGRjSnR3ejZ0ejhtZDd6WnUxS0hqQURS?=
 =?utf-8?B?Y2VkcU5PTlIrWDJSYjJERndIcjlrcEhFd3h3czN3bHh4Um1vUlE2dFBkZ3Zn?=
 =?utf-8?B?b3JJNUJuRHJwUXlSQ3pZUHF5T3E1MEhlSGpwa2hwVzNuQmFmd0lPS0oxVGRu?=
 =?utf-8?B?bDl4RUtXQjVWR2NRRyt0cnUyakVBU0ZJQUpDUGRaUXh6c2RiamZ4bzFFenJJ?=
 =?utf-8?B?L0prcXN6T0FGcVk0eVd5OGozWkU5QzdUVU12UjZvNVlwb01iOXRhRUpZRkxE?=
 =?utf-8?B?VVpoL2YyR0xxZDY5WTdWcmE3VUo2cEZTanhFRFRsYzR5S3BldFpkR0VTb2lj?=
 =?utf-8?B?Q1VTMnB0QTdmM2RqRUNYUVlVUDV2dVBIUkRMWjY4V0IwUU9CN0JpcENjTmJ5?=
 =?utf-8?B?RkcwUjlzTGc5eXRna3RXQWswMWhUR2FFQmhUTmhBbnNrTWJZTDc0YXJQVDBV?=
 =?utf-8?B?ZWJWaHU5K2tTKzBEV1BPdWxiK2ZxcjNZSjNQVEhVZUw4eEpTY3AyVnNqNlV5?=
 =?utf-8?B?MDl1RlJnQjBuTW1MY2wzSzFuNlp3akZ1emx0bE0zaS90SzFLZlVMLzNLekpM?=
 =?utf-8?B?ZzVnVG1tRVBFVFhIRkQ2d3MzdXFIRVBvOUV5Vm9oN2EwK2t5VklxbVdKU3pY?=
 =?utf-8?B?OVlpaXFZMU0waXdEcnJDbXJsZFQxM1EzdTUyWEdzTEh6cXFzcUlMb29WVEJz?=
 =?utf-8?B?Y3ZUWktORDlrWmxoMFZWUnpyaDNEeXBzT25RK1U2UjcvQWRXYnhhdHJ1OHZY?=
 =?utf-8?B?RGZSL2VWZm1OQjZiT2VEbmRIRlNjaFlndlRvYklCcVcvbDA1aHBhVlBrUy9P?=
 =?utf-8?B?TVVSTTd3UzFxaVkydFJtYllRV3BqU0FJMzkxRCtzbHU4bHp5TE50TWExUm1C?=
 =?utf-8?B?ZkhPcXI4Q3NuQXNScnhyQWUydS9VRUd6aXhDbXFRL0F1dkpGOUhnWVp3WlpK?=
 =?utf-8?B?bzlvQURBZ0hCWGJuTitJTUI5RE1nT2lGRFY3Y2VnSER4a1RTWHNsRmdHNWov?=
 =?utf-8?B?dVV0a01hbEJpT21PR1VIcjh4ZE5hYzFsNVVNVUMrbEdMVHlSMTB1S1FSOENN?=
 =?utf-8?B?ZHFNRkVKcDZwWFFud3UxdTBKRWo1WC9KeEZVZ2dYbW05M2wwWmxmUFZTRFFI?=
 =?utf-8?B?K2xiRHJNMjZIMTBJYlZ4NG5BcXBydmxzQnJqVHVidjBSdFVmc1A0QVR3eUtY?=
 =?utf-8?B?UGhHaHVibmUrM2Z0dGdvTGFBc2VhcUZURWhsMTJXQlc3eWMyWmlWbVcyK2pF?=
 =?utf-8?B?K3NUaHdSR1RjUDZVSFFQMDg3bG1jcGZKa1FhK3R2S1FXQlY5Qlpka3h5OVRX?=
 =?utf-8?B?MUI2N3NkQks4dGxJSm5KdHhybHBaRU9DRUhlSGsrc2ptM0w4dm5Ea096eUtP?=
 =?utf-8?B?QlJkUk00ZDBZWlYzVXlqTXh4VEtHQXFlSmF2dkgyczgvQUd2QnQ4b21mZ2dx?=
 =?utf-8?B?a3kvZUxQcDlMd01HSklrd2l5bFdDSHFuUWZpK0VxT3NkTVJlL3FBdStpbHRj?=
 =?utf-8?B?dzloa3VSamtPVXRnS0tDMFJQY1luY3poRXpvUzNESjRXTkJRSTBiSFl1L3lM?=
 =?utf-8?B?M3lqV2IrMWdPWU1XV0lPSHIzcG9TdHB6akV0Z2JUTWF4ek5GcGJzVitPeDl0?=
 =?utf-8?B?QUxqVnptaHlxeG45dmVJbEdibWRyUkNmZU5DL1d6OWdjWjZEdGRURGlGcUpG?=
 =?utf-8?B?a1hjKytzcXNqa3RHSjZvS0pPRHR6WVExbENFdGk1cngwVmZjb1MxVzVwcDBO?=
 =?utf-8?B?VUxwY0xScDVyR3Nxb0hFbjc3UmU3UjhwcnN2a2d4SkJzbUpNVnBCMFJJVVBx?=
 =?utf-8?B?VnRTOHllVnpXdUpSVHc3R2dCUXphcUIwaG1TL0FtaVJRRmZSVTBJZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03cf2f2f-6f26-458f-a8cd-08de8ab96c1d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 21:56:52.2662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qK/UQHOzEzo+qtZIAApejlPlIDj0jYbUe6qvWPg6ZgfR4yyVlaZCr1+DF6DldUPQbIGn4YjhrfNA+k2dKrW8vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8473

On 3/25/26 3:45 AM, Alexandre Courbot wrote:
> On Tue, 24 Mar 2026 20:52:13 -0700, John Hubbard <jhubbard@nvidia.com> wrote:
>> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
>> index c1f0a606f5c0..8bbc3809c640 100644
>> --- a/drivers/gpu/nova-core/firmware/gsp.rs
>> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
>> @@ -146,6 +146,24 @@ pub(crate) struct GspFirmware {
>> [ ... skip 14 lines ... ]
>> +            Architecture::Blackwell if matches!(chipset, Chipset::GB100 | Chipset::GB102) => {
>> +                Some(".fwsignature_gb10x")
>> +            }
>> +            Architecture::Blackwell => Some(".fwsignature_gb20x"),
>> +        }
>> +    }
> 
> The match statement is exhaustive and we never return `None` here, so
> there is no need to return an `Option`.
> 

Right, and also true even after splitting Blackwell into two arches.
(There has been a lot of churn in this Arch/chipset area, and clippy
doesn't really cover this, so it's one of those things that an
actual review really helps find.)

Fixed for v9.

thanks,
-- 
John Hubbard

