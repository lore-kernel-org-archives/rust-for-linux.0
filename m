Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011007.outbound.protection.outlook.com [40.93.194.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C1B288C08;
	Mon, 26 Jan 2026 19:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769457242; cv=fail; b=dSInrb5lEfLme2CrZy1/HwyDB7l6tlhIB7ogKa4u0TNwi54SNquPZEsYZpZtMHBvydTWKBiTx2Lw7kD9h520vtrPMxaXwOZnZrb53Er35hqgASUlYsm3J25yJqYVelPubxac34SCcHmkcCjsxCgHl78x/rQ6y6rVBYerW2pTCK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769457242; c=relaxed/simple;
	bh=K8I9753/QwkPqYjNzPfTkuRP31xPodibpp5m4KBThSk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fh5wMS+GWECR5x9rvLE4eC8ZmuGXTxsbXdT7YINapRoHCZLYEBp0zp/o24PzZFfICnReR/3uR1tYCqjNpZUPj9mdCHNel8bhx+RNVfdCrtNd3yp2n9TgIs4wXLg59B+pGMWsVWWPgOCHuiNyUNd/LfTELQnRRTdsS5/aqStHRlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hw6YZn+I; arc=fail smtp.client-ip=40.93.194.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hw6YZn+I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7RtBKVxDzEqDQYy+9kIthSTywIUxOrp4JJkBiAyHiy5iPkrJ0X9lwPAlVWb0Lcy0R71zZyUeNsddUKlxpmGYMdtL5ymYTaFRb9IdBx2Jaf0RMnbMjCC4mTdmmkaXUwAaz5VN8+RbdJsVsgcyjb8toVRZAgQIeo5qIA1W0XwpiOP8TlLzAXMoqamiVzN9ZYZo54d7TjP/NAQfuvi0An2sCiXwlCTbvHP3BEgQX+1LTTObifCD8g3nml0AUF9SeuV8G+DOBHJkaZjKeh1bjBztb8skb0XPwFNpuQyWriacWbtcHzx31+2MvYKFD8gtTEolj5QKt3Pr1qnPl4tSzH1wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2OW2EUPRUbCONlwwUq0bxKi4FSu5G1A537oISL0xIU=;
 b=dGwiHpJn7BlkmdwpbJxqc77Xv6nC/KGopkr8EFIov6m7JM4wQsrPV63yHZQMjMPsGI3yITTvBvlsjINqfQCiVm1nPdhggM6a8fkxNHct84usJmUsCQqwhRiPmqSduPCE9nBqbnq4JhSbEiwjPjB0KbAx9AGEXDjZ6FDHZ9eA1qFXZlqlaLNMwT585kX95HBqSyvpScukWVM4aznlXNOuFC8FnGhiZbQwmPk3pbqpeEvgyUIYGPC+9QfbqJ2hHm4HwMhOQxgS5VArIENLc/NZ7Z/eNp44G/gapvQuGfcM6BQLreLZDuAM+llKKaI2+7/Ih91Pj8ITuQ7ZEDecRjkoPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2OW2EUPRUbCONlwwUq0bxKi4FSu5G1A537oISL0xIU=;
 b=hw6YZn+Ivf8R+gPy9bGRCPi6zgjnU5M3AlSrcm/kIgPdbMEiPsyto9dQZOlVLd0foHUAAM1LW7+d4PqcbixSC/TKbVvt1avgDT8BJ+9Dp4ipaUFBswHAzLM/oXf/x1EyJP5qO6tjpAQX3+RiNZ/+uvjw/YNX5W9z9iBlAFc8yWrCU8jSTUSnXtIJEothcQ+gQhmJP4DCcdIIFDiB1slRqnt7keR84qv+c/RyJFIui7LYy3mM9I3FeSo+TVPy8SuYAYL69CktPUaqVZhaZzI9HWZ/RCbCnSfTAW5xWQqg2TujiWhWdr70OZ3KI9kPr/E/JeYK2ObsMDXlglHf3ITGTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB8073.namprd12.prod.outlook.com (2603:10b6:610:126::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.15; Mon, 26 Jan 2026 19:53:57 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 19:53:57 +0000
Message-ID: <08e6bc5a-cc41-44e4-9c7e-9e11f8aaf962@nvidia.com>
Date: Mon, 26 Jan 2026 11:53:53 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/31] gpu: nova-core: Hopper/Blackwell: add FSP Chain of
 Trust boot path
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-30-jhubbard@nvidia.com>
 <DFUEWBKOLFQ1.3NSTFO4L97503@garyguo.net>
 <01b59562-9d90-459a-905d-56de1bc05433@nvidia.com>
 <f85c4bb9-2fb0-4dfc-9a07-992762df0822@nvidia.com>
 <DFYJMH9S9RHC.34AA6HRKPMC6X@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFYJMH9S9RHC.34AA6HRKPMC6X@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0364.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b91ea9-3019-4a1b-a7b0-08de5d14a451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWlRSWh4ZS82ZnRvVUJFWFJvZjZnN25mdVpPTWN2V0JxajV1OGlLR2NmeDND?=
 =?utf-8?B?cUE3K0hCcmJUcEJqV0NYaTVKdEdTT0NIVzQyN1NkcVgxTForRkZMUlBjWjlq?=
 =?utf-8?B?NHY2TW5yOHllMHNBQW5ORkpSTnZ6UWpjQ2doUHBJeWhkU0tBbGJJa3JqWm1Y?=
 =?utf-8?B?YjBJZWhUbkFJTENRTjFaaGFHanNWeS9xa1JNeXpiYUoyK0hiRmdQZVQ3RnZi?=
 =?utf-8?B?ZHlnTDRncmd3VmtiazNsSHFIZEFFTVFxVDhlSjQ4UmpRcjdpZytWelM5clNV?=
 =?utf-8?B?ODJJZ1NuZGVXZDdmSExCblpubDY2RWhLRDE1akNEWjErL2NYdWRUdGtFQ3NC?=
 =?utf-8?B?ejZYQ2h5M1ArazJYbmVJdWpNSUVTdzE2a3FTR0I4dmpiMGRoaGQ0MnQwZTg5?=
 =?utf-8?B?YkRrSVdHUzVleFlPYW9jc3JZYllUNEg4ZDJSRlhURFFhenBlUHM2R011Rlhl?=
 =?utf-8?B?WWttbFhrRTNFdnhOaDl6VG1kWFRBbFNhbTk3L3NodURQWlVDT0hZY0I3c1Vm?=
 =?utf-8?B?V3Ftc1RrYTJydUZpVHhPTXk2QTl5TFdLSFN6N0I0Y1pzQmc4UDFLVUZIMzl5?=
 =?utf-8?B?NW1WTHNjRVNsVDlZWS9QdFRoRG9mODZ6b1lPU2FhUlduWWh6R0JaSVpWQUxU?=
 =?utf-8?B?c0NtWlpVR1NpZGFCM3U5Mi9tc0FWZHBuUEZ3Q1hreUdRRnVXZ1gwWXc4cDdm?=
 =?utf-8?B?OUEzT1N1cVcxOEc0SG5TNTZlMVRyaWlzSjJoc3J1ZHhEM0twKzZtb1FlajZ4?=
 =?utf-8?B?cGQ5a1NKYmFDenM5RmJmVVdGS29yUGFvWkc1ZU8rOG1LaVVvd3MvejExV1Z4?=
 =?utf-8?B?RHNENDBXZGtnckRsaTZnS3FXblE4TGZRbE9RN2pyN0RhMVRocHdzUkwzWGhW?=
 =?utf-8?B?K3NmSW9OSVFHMU4rSEk0cCt0R1hTa1o0UjN3ejlZT3oySG1LYThMaGt0dDNX?=
 =?utf-8?B?b3kzMHVKMTZYRzg1TEl0b3JrV0VWR25WeXp5ZlkwbDl5R3RoSHkrd2xIbFd0?=
 =?utf-8?B?R2Q0V29URXBYOG10UFN5ck5ncFFNaWY4eFFvaEY0aGtKYTlyMnZobmYrK003?=
 =?utf-8?B?YkZGdFNsU0JjdWJ3cE00SHpwdW1uM2xCZkkycFUxcFh1VG9BRnRkcnRQSnZ1?=
 =?utf-8?B?NW5FNHBWWkxiakg3dXNWR2EzRHU1MkRvZWVMREwyaTRlNTZjTnA1dVU1QjI5?=
 =?utf-8?B?ZkhXVlNvWktuV3czdjJWMnhnWHNjdEw2ajE5VUpVVFhSNjJaeWpBZFJUMUVP?=
 =?utf-8?B?Y0Vja0orckU4cVhIdXN3V1R5cFEyRkVDYzQyM0o2R1VSTlpTVUNYT3J1Um00?=
 =?utf-8?B?OHNpRUdxUkRPUXJ3MEp5VU9EcFBCK2NMYVNYMksrdU5jMmVXWjVFYVUyQ0Vp?=
 =?utf-8?B?Y1FBWjZhdi9uc1d0SkJkWEgzSUl0MUZWcG1SWEJSeTUvRFBESzAxcEY2TTFv?=
 =?utf-8?B?Wko0WkpXUnRjY21DcVEvNEVlYk5iczRmeFNWaG50K3JiNVpWQzJjZDQvcGVs?=
 =?utf-8?B?MmI3VXZLeU5tWnM0WUlFOW9JYVYxTm1laU1NWGRkQWplRW9NSlFYbTlTdzFt?=
 =?utf-8?B?Y3cxODRONWo4UEZhSVB4WkJLMmJVeEJmZmFrMUxSNE1uTjcwd0VCK3Jpcm9n?=
 =?utf-8?B?M0I4QktJZW10ZDUxVDdUV29wdHdWMWxRQlFTSzhvYXduN1ZWZ3JDNldLeXZZ?=
 =?utf-8?B?QXVlSkJpa0dYR2wxNkxsU204amlIQkt3dXFYcFBkTFErdnpNZDVxaWk0d29W?=
 =?utf-8?B?a2NJVzNuczlnbUFPazU0V1dLbFE5NHlnMXh3aG9IcytuTDJ0SVQ5KzZEc2tp?=
 =?utf-8?B?WHhaSVdZU1pFRGVOSWZTVkhYM21nSnhOazBNci81bzNhTXJLWHM4c3FSeXE1?=
 =?utf-8?B?MERpTGN4UmVydDJJZGExbzJuKy80bTB4YVk4ZiszbHNhVnlFZFVlWmRZbXpJ?=
 =?utf-8?B?L2JKOHRYTlVneC9sak9Pak05TzJIelZVUjhBSnNZRnY5c2lxRHhOWFZueUJp?=
 =?utf-8?B?dUZXWFNwakRqYndLeXVtWFZ1ZHdZNzI4L1BYVTQ5dUhvS3VyNXpNR0FweVA2?=
 =?utf-8?B?azZvbW1VNEpOdnI2UUpCTkI2Z1BEZWM1ZEY3bmk0RzFiRStEOHdxQlBPclRk?=
 =?utf-8?Q?tbTc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3ZZQWsvSnVPT04rMTN6WmtPNE16U0libmo1TWVldjVzMXJkQ3V5M2s0UWpu?=
 =?utf-8?B?blFxWEJIRzJBeEV1N1JBSlMzY2pqSUw5eG5ZRUxUZm9xclVqWHErb3E1ZTd4?=
 =?utf-8?B?ZjR2MFB1YllDcjd3L0cxUDl1bm00c2UwTklXYzBuM2NvVHJ3ZHB5S05EUUU5?=
 =?utf-8?B?aWM4N1VIRWd2VXZIWjBjeG1IUWlyKzVSS3BxSzlqYlR4MTVZMGZvRVREdmti?=
 =?utf-8?B?UzRydkpMTWRZYXhHdmM2MHVxbWVTclg4US9wKzY4MHovMEFMN3FXdmw1Y1FR?=
 =?utf-8?B?SmJGb1JzL3JXNU5kK3UxbmNPSzN6UlZoNjUrdW5MM3VqNHVuK3FRN1hSdjlW?=
 =?utf-8?B?ckcwRzMrcis5Rnh6OUZtMG5lb1lxcmMyV2ZQQ3lpQWtGSGJHMzQ3WlViN3Fn?=
 =?utf-8?B?V0xUWms3aUNEZnQxdERUbjJSd2srK05iTlVqM3l5b0NMRGJpZnJMTVZGanFM?=
 =?utf-8?B?R1RQNXM0WnRpanc1NzdrY3JmN3J1MzFHOW01UVdFVXVNT0xQT05kWUg0Wkpo?=
 =?utf-8?B?VUFMclJ4ZkNqd1ZMU0lpcWpMTDRHanVXWi8xOGs2ZjlHYXB6MHoxZnZkckNH?=
 =?utf-8?B?MFNmQzNRSndlZ1pCT1hWaklrRWVWbFJTTGZLRHVLbHhrMmJVMEwrOXgzU00z?=
 =?utf-8?B?bk9NRExPS1NiU2lteVcvU3BpRXhmNjVlSmE2ZHIyQTBvUHlUOTN3RFViRkVS?=
 =?utf-8?B?R2tMaGRUVUpXQUhIajAyR0ZtSjBtYThWYXhZbFd4VTBpbGJIdDZ1cUZHOGdQ?=
 =?utf-8?B?SFQ5cmU3MUZISCt0N21ZZHZ5djEvRzd6UzNiY3RJYTRNUWNFcC9QU2JhY1Ni?=
 =?utf-8?B?bFU3UFRKdHJqbUo1YU1XZ0l0QnpjdFlzTURrR3JZYTc4aThrZnJFcDU0Q3ll?=
 =?utf-8?B?enRITElkSURFOWRnOHJLcTFWSWRKcHlPdksrZmJwSklTcEFWN1dnTWVVZGZM?=
 =?utf-8?B?dGNUb0JXS05PTmlQc1JLdERlUnAycm53YU1UaXFNVmVyQXZIQVhUVzg4dllo?=
 =?utf-8?B?V21VSnRoMndrenM4a1ArYTRkUGZUeTlLZ1BQSlhnckVsS3NSeEpsMk9oS1lJ?=
 =?utf-8?B?OTE5ZGpzNzFvQ1lPazJTV1VNUTFRQkRDb1FWaGU1OVYyM2RZa1RyT3Z2WVY4?=
 =?utf-8?B?S0ZJeWh4UEZSSGs0QzA2cCtNdmxOWHd3MS9SUUZVQVBVTE11SHdtV3kyZ2FT?=
 =?utf-8?B?QUhrN0l2aHAxRXdCYm9qYU1KN0dVc2h2bVp3dGpVSHlSMDdRT3pEcWN6U05B?=
 =?utf-8?B?czlXcG44cWNpUWZseDJKblZrTjZWZDhyMGhCTWNOS2pubXc3cTBEN0ZFa3c5?=
 =?utf-8?B?UTFrOUFVMFBuM3MvMTEzNGFoZXppZEFBUVh2ellJMG5jVmszeHpYZXQxMSs4?=
 =?utf-8?B?UG5yM3NVRmVKTlNVZVIwOUQzSkVPaDJkT2RwMTVKMmttY1M2VlJTbmRnTWV0?=
 =?utf-8?B?UmQvdUcyczFqeEZ0WWdZSlpUZGlRKzNOb1NCTmVzQVlma0lKRTJJeFY0VHl6?=
 =?utf-8?B?VXJiSFlsS05tZ3BJemJUZ3VxZGVtNE16S0RMUzg0NlpOYk1pNFpaVVRtUVdn?=
 =?utf-8?B?ZDMrSXdTeHJ4RWdIRHhBZmRwWXY3UTNWWVhUOE5yL3B5czFOTzBFWmpaNHVM?=
 =?utf-8?B?Q3pQUnFybTErUFJjMDJYYnNyM05HUVJCNmZoN2JtYzFXbkNjNndIRFpRUE13?=
 =?utf-8?B?bUYyayszbi92WE0wbVREbTA0cTF5SjhtNFljK09WT2JOUkthRGt6ZWlhT3Nk?=
 =?utf-8?B?ZlpxalRnT1pHVWd6TE94RG9JL1FXMHlYSW5nY0l6SFV4WE5xb3JOUGw0T21k?=
 =?utf-8?B?cXc0UUQ4bHdKdllBQmJXWmVjemF3VXFac3M4UEtCajgzY0RQcmlSbnMwMWE2?=
 =?utf-8?B?YmM4UWJ0N1prTWY4T294UFVETVR0K0NWb0VpV2pYTlJCTE5USG1ZbVBnVlFp?=
 =?utf-8?B?ekNQNkR0cU5vbFIrZnB4U0g4Tlp5WmJGRlppYjJLblFTTVNKS2dRNDFwMXpy?=
 =?utf-8?B?U2srbjJvREE2a1ZKWkRXZ1pHMGRsTjBNV2RwY05najNXYk5CVVNnbzV0Qlpu?=
 =?utf-8?B?SWEzSWVEVlhVQ3hVWG5rTzVkYlVSYld4Y3FXN1AwSXg0akxIM1UzS1JzV0NN?=
 =?utf-8?B?K2lWcjBBYnhXTExTQTNUTW1tcG9Md3RkUmY0a2dtblNVRkh5YUlaSDN1UXl4?=
 =?utf-8?B?V0tmR0QrRDhQdXZmWWc4YUdjclYyUHlwT29icXd6SC9XTkw5bWpqYUZKYkRl?=
 =?utf-8?B?UmRwNW9CNnB0ZUtrNi9KK0tKNUxhYUk5WDRnRDROeVRrbkM3Z2tDa2hmVEdG?=
 =?utf-8?B?a0VvSFJSejROZi8zREZqKzhsbGxRRlhYME1TZHpNWEpTbnVNVjVwUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b91ea9-3019-4a1b-a7b0-08de5d14a451
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 19:53:57.3481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0AdhXSocgngzh1laizsniyPnaB28q1GibtpyI6KBd+46UmZhPZ91B+4Nxbxj38qaJU5DyukBdZSyWZaRWvJrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8073

On 1/26/26 5:08 AM, Gary Guo wrote:
> On Sat Jan 24, 2026 at 1:42 AM GMT, John Hubbard wrote:
>> On 1/23/26 5:38 PM, John Hubbard wrote:
>>> On 1/21/26 8:35 AM, Gary Guo wrote:
>>>> On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
...
>>      // SAFETY: fmc_full, which contains the complete FMC ELF file, is never submitted to
>>      // hardware, so it is safe from hardware-software races. And we are the unique owner of
>>      // fsp_fw (and therefore of fsp_fw.fmc_full). (A separate buffer, fsp_fw.fmc_image, is what
>>      // gets submitted to the hardware).
>>      let fmc_full_data = unsafe { fsp_fw.fmc_full.as_slice(0, fsp_fw.fmc_full.size())? };
> 
> If they're never submitted to hardware, why are they dma objects?
> 

ah, right. That's leftover from my earlier bringup work. Of course,
these can be separate allocations. If I change fmc_full to KVec<u8>,
then the whole unsafe block just disappears.

I've fixed this for v2, thanks for spotting that.

thanks,
-- 
John Hubbard

