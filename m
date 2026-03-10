Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010029.outbound.protection.outlook.com [52.101.193.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEF530FC23;
	Tue, 10 Mar 2026 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139114; cv=fail; b=YaSoEPGHkRH3NMZ7dhYW1ZxLvfc1lhZmtRhfxy+xyyWDQmRpOXMyOPoEYePE/K4f6fwj3LXDuUZH5YKk8KSWYjiw93uposPAwGp6e5Qg0UEnRUTjIyQdkHVwHRTSFSVqOyI57eLyrIE42CfEEadivD2lQeIdBUYHInWA6uUhGSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139114; c=relaxed/simple;
	bh=wYm2dgCyCyJC+CpyyF0sQczrNQ+MDEVGW3vVAiKhYLM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ja9+U6dLYDpC+4V2WTCA1eOcVtKNLzaTjAnSbja485Ewv00pW0Zni5lVgPMkR2P/WLk7Jj/Bk2ODPvkIxXxuvPmulww82H+UGIFbodnuxCL3U7Nwbv4HdOSh5he+mK84mF/waiv0hRvfJ016Kp9znIPlaC2YlmOME3rw9flZWjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qM9W+7UT; arc=fail smtp.client-ip=52.101.193.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qM9W+7UT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiY2nSvY8pleYzd2+oyYa3zz9H9aEUPl9DsBvWmTDU0eNdyc+dNDCC5jx/XNQcsIrEJOiDaroiRa7HVuCcBDV28yTad9FuaKDnBkjtk8nSkF+IqgIQGZyBoEU4DZjF4/2h25epsQA9HddujenGAuy9o81D09jrtLV7EOxKPLfvoz08pyEi7G94A4UpXbK09UQVY8S1KmPAjpOD9NeizIFuxwIjY176rMkuW/mFrD2fH3rVVbOXeEpERZdgtGa49VdbxlMVqckUVmQVy9U+ssH3Um+nIi6oBtvbtO2fNmXBREBrqXlOibbJEzzNKrfOGb326P1sg1+GkLn4btVn325Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRagTF7BWyUWnC0e/6mu5/5HGCwU2QIVSb7rh33LV9M=;
 b=HB9UI/M7rv+9gvEz/XPUAP2vlhO6JqA4gStIY9zgZFYBYUwGuFJFVEbbYGfSKf6v7R1+pn5Dj8oSOcNl9H+COlLwYfHd+WbZsRtcJKgAlPeaaisGv5gfg6I8xKyeqF5Uf0MG7SFzKGtfVv6UkATctZUDD6he3UOKx0OGPYKjfoiHRn5QjdoubWCkttoDuCj4RQOMAsjvLQpfRUe34L9yiHrPMn5e+XIkEPkIeuqq+w2kU6WTnd/O0jxFUv7dqHj832Mrf6PBvy/PLig59DXqsE1XxiGHb02huu+UdD9dJW0Bwkg9q5OAnJX6b4RVWQGm8UuQoI6YMHh2eNjR5uirvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRagTF7BWyUWnC0e/6mu5/5HGCwU2QIVSb7rh33LV9M=;
 b=qM9W+7UTJeZsMytDYe4RevwQszOd3zX+dEhOnKBdOFORn4G4YxrPtYk3yN1/H8fkS/TK6yCQQoXWM2eit0i9tSDyix3vW2kgC3cUTIExReyVKy+aH2MmLBBHywmOchUB1GrzV93WqZjo+9vsIiUeDVAEXVxBwavuSwqaN1qyN1u2tdQ2Jdh86r962zlXkr5N+l1IbJ33TN7/pr3IGxfwwsg4LxxouEb72qI72xgRWyUivv9CGlgaybDU+mFjWOS9HrgyrzaHgN43r4XvyB744TGFVkE7dBywLZw+K6A10tayw/8YU+2AHpnPuCnsY3nfx8FRlyj8PCdK0dLEWmquPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8330.namprd12.prod.outlook.com (2603:10b6:610:12c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 10:38:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 10:38:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 19:38:25 +0900
Message-Id: <DGZ1CRQXFIH1.3GB2WJC8ULCSK@nvidia.com>
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
Subject: Re: [PATCH v6 12/34] gpu: nova-core: don't assume 64-bit firmware
 images
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
 <20260310021125.117855-13-jhubbard@nvidia.com>
In-Reply-To: <20260310021125.117855-13-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d251e2-08c7-47c4-9583-08de7e912ab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	FXgYYZJRIzDmczl/zq/gBdrglxakLJTf/Hq7GKidhC490bikZGaYSFtIFsNSsinSLuear+eT6/K5SD9gyjP/3pku4BFa+vIVtv1BSSF2nbQyrZ9CXhYpnxAuFCNJj+Xv9gHpvRtODptnEi+O1vrpaWJ0voAtz6mHccgXoolWhZ5ewYGnHSkN9PUK90VllUlku4ip/BUW3L0xd6pYz1r/KMo/TNY9iFZn0pBuw8uSV9jhjx8+e9JntTsQg+thQXv9mHD+Awz826EHPHj6U0KEZcsjlj+V/VhGcy0E63A2gecmVAku7b8ech9K16wCTuX3EbBv88r4MPJx9/Xj5vRtd8Tjhwu5CCmuHcrp7rzlh3SgOpPYAKyX7zUJre/SEyX9FcBRinvMkxFsrUNq/EnsXHe++mY8cbYad6+HacaWnNGE/OHIB1yrE07c/z0K/Rvr9f73FSHuSXrcwq1sjUVAwqppoq41uLGUGmQ8psADwhU5YZXHevznWWngCnqjvtxPg16aZDCpsSpDQKlI/Dvgs5J2zGKeWq7QJfjnggXFwkyZwfBqqSIAgnyGM/XSGSYBaChb12n+1ZKvPqu6frsLl/ftH6qdOBwh2VaMjXFkU0khObcNsVhardSRTTW5NibpFl/BC/zab4p25rCnsblmghwrCiujQ3QyBUMZ8IUJTLz9tvC/ZAt7e6tPL9u+PfT30V4+AiN091Fl2Me2y0B2JxE3+9Qx6kR9ybRGgRDHToM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFJxZEp3MFdmRUZJOWR5L2lWK3QrcXZkOFo2Mkd5VUxKaHQ0VUtpMmY0eDNt?=
 =?utf-8?B?UFFKT243aWVOUTVxSEh1OU5kK3hBVnNOWnhZZXAzL0dWSk42UlVuUU9Odmh3?=
 =?utf-8?B?bzI0OG5MYmFUdjdqWXVlcHRQcjJqU0MwQ1VJMS9lOEc5UzBBa3J1aHRpdVZV?=
 =?utf-8?B?QzJ5OFpBS3gvejBGMnR6MDluVVdVYUpnNzZwQ2crWG9FL3RlRlIxVGVyNi8v?=
 =?utf-8?B?MDMxaHdKZWxLWitiYStYODV3bW5wcHpmMnhBT0dvaCtIMmR3UDNIVnFzZUdl?=
 =?utf-8?B?UkVrQUV5WWxCQWdqMnNEMkExTWtaVlhVU3J6dWhRb2NxcTBOdVgreHFjL3NC?=
 =?utf-8?B?eUJjaWZIQ2JZMlBUdVlBMllZTEFpWmlJdm9EVENRcUNIUXhzd2FzdVd2UlRO?=
 =?utf-8?B?bWhHbEg1ZXdudUZMOXdaMlhoQ3djTVBJbHVkbEVQMUFONVNnOHhOSUlVY3RN?=
 =?utf-8?B?YWhWakd0bWYrZ3FnR1lycmNtVDlOZmpIallORkRTdWZXT3VhdkZUb2l5L0p6?=
 =?utf-8?B?L2p1QlNwY2kvMHI5UWd4SVptVGdpN2NwOXBDZVE5NEZGK05zUHFwRXN5dVZI?=
 =?utf-8?B?RytOSjAzaUo3WGFjbFh1b0VaNEVxZWxFL0htVHR6ZWdtbFZ1NzN6bEdXcVh1?=
 =?utf-8?B?SWF5NlNRcmJwTFNMbWVWaFM1akM4VEN2ZEVUcDFEV3FZUGg2SmlxUEhFcWNI?=
 =?utf-8?B?ZmpoZTk3UFRyeXJGYWRNWDRXZXpnQTdzbVFubklhNWNFYllPdElUNnRoYTEz?=
 =?utf-8?B?OWtiSmpDWG81Q0ZNRWVSaVh6d0c4VGNTMGlFdFZCV1orUS9aUEwzV0FVSU5O?=
 =?utf-8?B?NGtuL0VobVlNVHJhT05ob3JKQXAyemhhRHk4bWtUNnAxUlJDVnhrZ1N5VVNs?=
 =?utf-8?B?KzR1dExpaWk1aWdLc3dIdzVrZmhRcW85aE5yb3VFZ1lKUVI1b3k3M2NsdThD?=
 =?utf-8?B?SXBBNkNaMGEyMUhyaEM1Y2NzSGt6Q0FWbVZrTXJJS3V5SE1ic3Nxb0JXNGw4?=
 =?utf-8?B?MnhDcUlScVVodVpDYUdhUjRXUUdMVENSMDdnc0VNYjVOQ1Q1T01LZXNrVDhj?=
 =?utf-8?B?SXhPOEJFdmZOK3V3WWk3d3pKbU9hUDA5Sk53SGRHblV0RWErQjMwN3VpbXpL?=
 =?utf-8?B?ckh2OWtSSDJ5cDlVa2xHZGVXK1dmRXE2a1hERm9hVlJtbk9vU0ZwSlpVTDdk?=
 =?utf-8?B?RDEzbUtKRmJkdFFOTHJCamNtcXFtaTI5Y3RseEtSaW5jZFJqSkcrZlJSQ3pY?=
 =?utf-8?B?ckpkZVFMVHRBWGdwSkQ4VHp0ZldIWmVhTWVjaTE5dXhSbGx3Y1NSNm4xQmYx?=
 =?utf-8?B?QWpTNnBZMkxnTGZsY0xkQWJyZ1FERnB2UmlQOGtVbEc1eWhWSkNwcXBPOFBK?=
 =?utf-8?B?WC9LNmpTNU0vUVA2N200cWVXbGttejN2RlhsYXhQRURiZ1dLTEx3N2M1aDAv?=
 =?utf-8?B?S3V6dGRaaU5aTWx6T3V2QTFLWldoQlAvRmNRbTdSN2k2Vktlek44Nkc0bWJF?=
 =?utf-8?B?cGx4U0F6RHdEU082Y1lxZ05uYVBNKzVITGdlcTNrbUttMzQ2UE9McjNJclFs?=
 =?utf-8?B?b1M3NmovallXSEY3b05aYUJDa0NMUnp2UnZCUlFNRVZCenMrRjhvU0V1ckhH?=
 =?utf-8?B?MTNHR2JpRGIraG1QbGhCRmtES1ZjRmpkeGZzOVlCVjV5MkF4MDBtWnRCM3NL?=
 =?utf-8?B?YTBWUTBXVm0xSkpBZ01Ib09UbjYyc3FwVjd0WVoyRDFMVFZVSUNBam5xRUVk?=
 =?utf-8?B?NG5MWHltb2s5QU9kMSs0NDlWTDhUV0RySEY0WmVDNEgwYTdtY2k2TjdBT0lK?=
 =?utf-8?B?WU5hRG1SQkp2dUtNTGxhcjJkZFdhaUg0YUk0OTUwbGpuUmc4UXIrcElubC9j?=
 =?utf-8?B?SzV6WUhLNysvQ2l6QjNGdHZlaUZ5Q29Xek9nMzlMcW05eTUwNXMyb1ZjZko0?=
 =?utf-8?B?VS9hZTAvdFJKK05na1VEWElpSW9ZdjRxZHBQYzJDbkdLaEFibVFQYkd5OW5X?=
 =?utf-8?B?b3NabzdZbmhrWkhPUE1qSG9tRW4rNHZ4dWZNaG9mVEdGc2wrbHFzMERxaE9P?=
 =?utf-8?B?WmVvSVB6Nlo3b01MeVExZDJRVVY1ZG82R2syQXZYUW1FK0hnZlJaNCtGQUZr?=
 =?utf-8?B?WEZjaEF3SnVpbVNrMS9TY0ZUTVNCSHNZamRFVWoyN2pIZ2pPODhPK3lJeVli?=
 =?utf-8?B?dHplRXlXVHhvazM1TlZaaE5YVnJyaTJwU1NtUThueWFjakQ0ZU50bGxJOXJY?=
 =?utf-8?B?SlZJUjkvempTUUFnRTZmMmRHYmU4ZGJlTVhoa1JxNWNTNFlqMm5QOXgzT3Iw?=
 =?utf-8?B?RS83d2hsbzRVSDQwUHhtS3FMbmtOOGFqVG9xZjJ4Ui9pVEFObXBzS053Z2pM?=
 =?utf-8?Q?x9lEQIXDQUuieTzn7ONw3zMWqIzuIJZlktVz531opH1+W?=
X-MS-Exchange-AntiSpam-MessageData-1: mDANXFES+rnlAA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d251e2-08c7-47c4-9583-08de7e912ab4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 10:38:28.8208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XejXYzmxR3ZhExGP5KS5nBe87gZPIRmFgj4PptZVD5YdH6ve1193rEy5f6fzct/ivfzvCd4E1b8rDh376W/wLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8330

On Tue Mar 10, 2026 at 11:11 AM JST, John Hubbard wrote:
<snip>
> -    /// Tries to extract section with name `name` from the ELF64 image `=
elf`, and returns it.
> -    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) ->=
 Option<&'a [u8]> {
> -        let hdr =3D &elf
> -            .get(0..size_of::<bindings::elf64_hdr>())
> -            .and_then(Elf64Hdr::from_bytes)?
> -            .0;
> +    fn elf_section_generic<'a, H, S>(elf: &'a [u8], name: &str) -> Optio=
n<&'a [u8]>
> +    where
> +        H: ElfHeader,
> +        S: ElfSectionHeader,

This allows mixing the 64-bit with the 32-bit section header. Let's have
another trait combining the two using associated types, so this function
takes only one generic parameter that unambiguously describes the
correct format.
