Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011006.outbound.protection.outlook.com [52.101.62.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A243446A6
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 01:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773712397; cv=fail; b=hFh2JNFmJfucBTNnRzh3NNnBUz7vAl7sibsUHoT1sGPcFz1CMTmjePPOY8ZNt4NWg4F4BNgAydJLYPFOyKBNQsmePK3yCe/aS0A7NNUPmtZIjCeXSlawsk2SIDbIMhvaT/Rqq5w6UlFmiJeOXLU5xHidZoBQeF8QYYvAam84mTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773712397; c=relaxed/simple;
	bh=INOGt1ACPshIVdPAjgH9sksbuUnrILniLPWugxV6Ak0=;
	h=Content-Type:Date:Message-Id:To:Subject:From:References:
	 In-Reply-To:MIME-Version; b=d8i3kB5BrHvs1XO/RM+gnATy9tJ4IS8FkiiqvsoTFzBaGIo97LSv5TKtUWoh7SUIhBj4RHe+b6KD/50oNku9GdjOBnU33ywpmpOvD0AMiJbYAzBckgSRjHa1ZmVFo0Bs0KCMuKPFjWvTd7w7EC0uG6qSh598otPN2j2GthbHcGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=izi/BJvB; arc=fail smtp.client-ip=52.101.62.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="izi/BJvB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlyzB8xLHzcyjMqj73s8tlepQGWP4Z5QSpJ0kaqIlz7S9dUdtRYpkfgswHYmBOjI6hLSjmthBIpdWssW4xfbBWmSdt62YQYvd8CiP4pwus/xRWLo5ergHWc5u/dcF7gdiDuaPUQHkGHHACaiDCC1layjYRp1ZiOVYmQfVS5ES08GgLS5xyJawiVlWWMmbm6EWvub4EzWvYIcukhPUXzFZUMuo/5be7uppiQ7VBWVTz8pp6vdxjyT8zbMaZ1XHX3+ZQaF6CdVF+Up62ymSkr8Ik/oc0VQT955BedTss7CZfVjciyKyp/T1rfeoyfK4ZAAfqm4FuxIqwa7c4Ldd7vtdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRx4SEVoyWVUBvOD6htM96kxTWZovtJ+TwAtoBLHPOg=;
 b=w/HQDndvP8/mIDnYw76W6FQW77+oyUGAzsW0skXYfZmUsL+UFc/lHM4SPpNvMT+7KgytwzZ2jvy+jmcsvxfmV5FalP6fySe1nyS7f4nvX/vJSr9xBy2vcyqGJjTgwn08/Bi4gSwWwKYaWWvbTUUvn20HoMCZ0qqlHyxlgxLgqArSg4I9nKyThAD4diZMD5OLBBp2KvtzLtKj1SiRydrw5P0IeTM92sLSgYIFhAJqaa9rkJIVEPL28cOJ77/PwubSdcMMz6xG4IcVffJChtAvw2uKukipmKJkgV16+c3noTU+7iso+vjKHCY4Bo3h4So7u52gGZxWAjYUN2jGgsKW1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRx4SEVoyWVUBvOD6htM96kxTWZovtJ+TwAtoBLHPOg=;
 b=izi/BJvBjzHwcLbRXRsAfse6/UdC0lWR1NXIf26rU3Yiw5WdD34B5BK0LtSAFwWqoEadzR43lIq+m0dm+9q+Yh25auGmjmxQiA+HqkUaS2eVIrcXZIcWlQzsDrTgFUZ7WkxI8fyRsuTp8RCEYP8ZmFHr0z5fDDLzvTl9LJ3ao7fOqTBrYDyKcVEbx80+GIoQvjrQCQgo3EGNfucEGx/9ib9qPtr+5yjlVQLMZxcSUMXGrrii1xXlEEPgexp7bsG4Bm+n0hWYxgQUgJ7Xr62iEe4svHjMtqDCxIQxMaDRBcZ3ZTg9kboZ7P4ypOlB5tthVuo9mIdQCKYAGZPH6M4P1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS0PR12MB7772.namprd12.prod.outlook.com (2603:10b6:8:138::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Tue, 17 Mar
 2026 01:53:09 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9723.016; Tue, 17 Mar 2026
 01:53:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 10:53:05 +0900
Message-Id: <DH4OKCZG2447.3ALG0T7OMTEH1@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Gary Guo" <gary@garyguo.net>, <mmaurer@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v9 0/6] gpu: nova-core: expose the logging buffers via
 debugfs
From: "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260316055736.1690546-1-ttabi@nvidia.com>
In-Reply-To: <20260316055736.1690546-1-ttabi@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:405:378::17) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS0PR12MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e88a17e-832a-49d2-4ae6-08de83c7f0c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	WtzX0Fg9v0kEtnMvlv+HzWwNNItaf2o5wfq6I3/MjRFOBaPSuYQfnRcQr4jRprkeikJPQOIMNm2Dh0ph6DmDdaVYnmfGKuxmhIgJIaTdgCGD5cqNYOIXvX6XCS+6suFRkyQF/HXOVHHydF6blnRDIqNb2BpMeXVcQuRE4J8mw8gBUxIf5JjjsKXOKb+RbRirKrX5dt9ZSHgh4/TkQZEHiHlzIAqlC8MtXE/qtgoiOqinq7puKMwIg0G6yzghsj5ySvP7VVuuAQCl4AjRY+PYUgpkctLImILNr10xmbQpMwrfSa7NreQNE9C2RObnpo9ne0GsEsmLNu1xo8OQPgnLd/ZvWjn/43HswpuNDeeURiHg0Dy9gwHcp1WvWUTc6Ev793Wx4meVNsR1BcUneKBQ+tLnoPlQjaouhgP/xx4KoEQPNmZgKbczWSMMnhd6FoweOAulpi/mOdagPPH34McEhMPDZHww2Y9hbQyQV9kcrgocxxOqYogPDgdSaqoUcr2QroB6hY8n1MuuHEa+mtWTWT0uUP161Q42l6HptC1Iha2zP+9OtUlSbsxl+HFLF7ID0IGblvGTZpdb6QfKJ55ayLxUqZ94WyqGSkrRtkyT0j5EeICtKotTibhHJMPOjRESA3wF6tbGu3u1qG6lKUVU7e9512DJ5iinAlXsS9yzGGuEHoGlfPRPqqxFzZC+QgTBsZ0ttAZxQK5Z08wCRNtZTkIE5F2bCXSjyfMOt6D5UojXqwyfcjUwZMERBLxah1jrLHJUQK7/E9xGRgFBR6vemjARB9tDEiTqOt6NEQJBH5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDkrdUFxY0VUNWdYRmJMcFk2WE1FWkpnVU5uL0g3cjlkY0lKK3k4cjFiZHV4?=
 =?utf-8?B?S1l6bVNwSW1CRHI0OFJwUTdqWElMWEMrUGxvc28yL1JCUE1xeWtjNWV3RXhk?=
 =?utf-8?B?amlNZjk0d2J4OWd2K2kySForNTBQVi94YjNGVVBBd0dkRDJKaWl1QVMvUnhV?=
 =?utf-8?B?eFhBM3d6NkFqL3JDZnlFTWJBOERPUElrcWdBTTZDa0pOdU9tNEV6WmlEZ0d3?=
 =?utf-8?B?YlhVU1dsUVJTeGtmR01xSEduYXdMZEd3RGU3N3BLZXVJZit5bWtlKzRNMEJ5?=
 =?utf-8?B?b2RVS1FNbEg3dXVMM3huL21ncjd1by93YVBwN1NVR0h3Tk9adGlaSlluQ3FZ?=
 =?utf-8?B?V2Rsamx4Qi9CSXZZc1JMMXpsZWMwVldBS2ZmWTFaM3RRYk5wdUk5KzA1MTBP?=
 =?utf-8?B?V3ZLdGdIdWxFenBRNXEwRytVckZ5VnpOc3h5QUExTFY0TzhmVTFFa0FQTFI4?=
 =?utf-8?B?OGZkdzc2dzdUN1BGcHVlSERZL0hScWw3RXU3Tm90QUF6UG9iNDZDZjI2NFQr?=
 =?utf-8?B?Y2hQMExaS1kxRUhsS2thVzlxaTJONEcxb3Z0cWZnRDllTE9QV1kzd0lRcG5w?=
 =?utf-8?B?NjhWaTUzZ1FhQkExUU1OMU10cFdsZkZOWTlJTjlaUWtsaVdhSnJtT1hwMm9G?=
 =?utf-8?B?Z3FtanBJS3dJUVdkR1R5SjRuclRncnR3UVdsTUZQZ1NXL0xvNjJFRGVXeVFD?=
 =?utf-8?B?S1U3WnhhSHVDQmREbmVzNUIvQUJTWDlheFk1NUNtOGdpdFdZQ3lJRkRMM01G?=
 =?utf-8?B?VVdTaTN1SzhiQkFnUHhtdm5KYi91QjZENEY4bEJ2NUhJZWZ6U3czQWFRQURV?=
 =?utf-8?B?SCtTcnFFL0IrT2hBUDY3MS9rbnhpcGlQM0l4bzFYb2tFbHlOK2pXRE9PVnpV?=
 =?utf-8?B?R0t0WHM5QUpFM3oyMGx4ZjNmZHV1K0plcXl2cmFKUXc1VnVMNDBDN3Q0emFk?=
 =?utf-8?B?UkpLVG93bEZyTzN6RnBwcm96Wk9TR3FmVWRYd1lHd2U4OHA0QVpJUnFGMWNN?=
 =?utf-8?B?emdoUS9ETlBlL2ZOTzFWQUF1YVdMNDlWaXNYRlZUZDZDY0dEdmFjMlRsbnZX?=
 =?utf-8?B?UHJIQkNkTDhIUEx4OTdVRnNKaElNaElLT1hkN2YvQklzSE54ajk4WEFuWHVZ?=
 =?utf-8?B?bjlLc1JRS21hRWNtWnlaRExCaTQvcS91dkw4TXZVMnozVEM2MVNONWR0bE5H?=
 =?utf-8?B?RVhoZjZ1WjY2eW9hVGhNaVdheXVxLzlwbllMaUdZcGo1ZG45bk1Bb0tjSUNq?=
 =?utf-8?B?a25VUTYzRi85c3N5MCt4bVh5M3dhekZJd04xcUg4bms5cXdSZW1DeGhmanNI?=
 =?utf-8?B?M1N5TzY5bkNWd0Z0UjZZdHlGdmpWdnl6SnIwS1dDWFlyUU9LQTJYaDZsYXJw?=
 =?utf-8?B?MkhUWFVWeWw3VVdGa0RGSFora2U1YnErRmVIbFhHQmRycHp0T2I3Y3dDTmtU?=
 =?utf-8?B?WmcwaUxJTjBDQlNDMVRRL1k3NlVaNDFyaURPNUJzYzRkUnplaE03STdVU3VT?=
 =?utf-8?B?Qzd3WEpDaENubWtVY0xYK0MwZTM4ZnNQaldVMFI3aUVGOXJOR0ZrdnlJekpt?=
 =?utf-8?B?VTBPVGFlS0RHcjB2VC8xVmJzeEg0S0VPaTZkZnc2N25XdVZZUENzSWNwMmc0?=
 =?utf-8?B?VVRKU2FLQjZoN1Z5eWk3bDJIZE8vZkxCQ2hxNTE0TXlCZ1ZoQmJ2a3NuYUxG?=
 =?utf-8?B?Wkx5VXlXb3Y2THNyYVJETUZFTGEvazd3K3E2SUJWUzRMU0R2K1RxdXdNcW9u?=
 =?utf-8?B?TWM3QVdkaE9aU3UyRVM0V2hGM1FkLzdCNWxvOVYrVEJNYmZFSGZPMEdRVmgv?=
 =?utf-8?B?OW8yZUhZSHB2ZmgyMWlNeSsyUG4vZ00rSDk1aTFQN24rLzUxQzdwNFM2dzZh?=
 =?utf-8?B?bU1DUjZ5U1c3aDRkOThBb3JmNis2eE5xMzE1YTJKK2Z2WkozalI5aGRRNWN6?=
 =?utf-8?B?VGtSeDNJcFpUNmt5N1JHN0hNNEVUSUx0ekJWNTFFakRPTW9DYTAzbFRqS1B0?=
 =?utf-8?B?Y2VOcER5QjY4Z1ljT25tRk9mK2libVVOZ0laNEtVR1lLOXNRcVZMMmQ4UVZ0?=
 =?utf-8?B?czl6aHZyQ3JSdXlWY25Ecyt1clVxYXhqQ0xUSXZvRFkxZ3QrUHBMY0UraWJT?=
 =?utf-8?B?SEI3Z2ZrZGVRZ01xNWNUelhrUzlzOWtxMnpFTjRYUW5NNlU1TnhDVzh1UUw3?=
 =?utf-8?B?U2MvbXlPRkVQTS92aHMyeXRoVmp1NGdwRjRQSUo1bmNSTDNUVG5FUEZmclFB?=
 =?utf-8?B?S2NmelZXRytrQUlpbHorWmwvbmVGL2VzWDFFS1Bzc1JWRXFQMnlVR2tURW9a?=
 =?utf-8?B?VG95S1NVRU5WbDZlRllweW5yRmo4VmVNeXpSOXdHaTVvVW9wT0NQcmVUZ3ZS?=
 =?utf-8?Q?4chBzu64lLeOA1a+VWdGZlEJRn62+dz0HCQMdnVwDlntM?=
X-MS-Exchange-AntiSpam-MessageData-1: nkLd/IZZDBnbMg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e88a17e-832a-49d2-4ae6-08de83c7f0c0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 01:53:09.6235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrIPvNbFbxoi9pYK1+SHzxxJ7G8CHRYnJd8SInB/Ukz2PyECg/H5LZWgpKEPTLfyIXIg+bQABEw2cm2s3HUc5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7772

On Mon Mar 16, 2026 at 2:57 PM JST, Timur Tabi wrote:
> GSP-RM writes its printf message to "logging buffers", which are blocks
> memory allocated by the driver.  The messages are encoded, so exposing
> the buffers as debugfs entries allows the buffers to be extracted and
> decoded by a special application.
>
> When the driver loads, a /sys/kernel/debug/nova_core root entry is
> created.  To do this, the normal module_pci_driver! macro call is
> replaced with an explicit initialization function, as this allows
> that debugfs entry to be created once for all GPUs.
>
> Then in each GPU's initialization, a subdirectory based on the PCI
> BDF name is created, and the logging buffer entries are created under
> that.
>
> This series depends on Eliot Courtney's Cmdq patch set [1].
>
> Note: the debugfs entry has a file size of 0, because debugfs defaults
> a 0 size and the Rust abstractions do not adjust it for the same of
> the object.  Nouveau makes this adjustment manually in the driver.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Tested-by: John Hubbard <jhubbard@nvidia.com>
>
> [1] https://lore.kernel.org/all/20260310-cmdq-locking-v4-0-4e5c4753c408@n=
vidia.com/
>
> Changes since v8:
> 1. Added #inline to Device::name()
> 2. Fixed rustfmt issues again
> 3. Updated write_to_slice()
> 4. Dropped "use pin projection in method boot()"
> 5. Now depends on Eliot's Cmdq patch set
> 6. Misc nits fixed
>
> Timur Tabi (6):
>   rust: device: add device name method
>   rust: uaccess: add write_dma() for copying from DMA buffers to
>     userspace
>   rust: dma: implement BinaryWriter for CoherentAllocation<u8>
>   gpu: nova-core: Replace module_pci_driver! with explicit module init
>   gpu: nova-core: create debugfs root in module init
>   gpu: nova-core: create GSP-RM logging buffers debugfs entries
>
>  drivers/gpu/nova-core/gsp.rs       | 49 ++++++++++++++---
>  drivers/gpu/nova-core/nova_core.rs | 50 +++++++++++++++++-
>  rust/helpers/device.c              |  5 ++
>  rust/kernel/device.rs              | 11 ++++
>  rust/kernel/dma.rs                 | 35 ++++++++++++-
>  rust/kernel/uaccess.rs             | 84 ++++++++++++++++++++++++++----
>  6 files changed, 213 insertions(+), 21 deletions(-)
>
>
> base-commit: a544873ce0575b2fd8285a1364d3e09929d9a3ba
> prerequisite-patch-id: fefd403caf8af386276351dd12397dda8ae8553f
> prerequisite-patch-id: 3e02192944c4dde97e6895a28371479aa49ddc96
> prerequisite-patch-id: de85fb30b65233210512b8295d7fe811f485f03f
> prerequisite-patch-id: 4232928e15093c74aa6d2a6519a4d7ac5e109607
> prerequisite-patch-id: d4f34f7eda8f5dcad2464f1bf3789e78556eb51c

Tested-by: Eliot Courtney <ecourtney@nvidia.com>

