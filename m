Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010040.outbound.protection.outlook.com [40.93.198.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41A41F5EA;
	Sat, 24 Jan 2026 01:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769219415; cv=fail; b=X45oMVQTA1iYFQ/VKXB5Jn4ttJUQvH3i6v5s3JXBkNbUuIimBijMuHabiPph1sJyOb1RfylR4cmuGs0296nS9oHelMyJ92/AzP5q6+qCKdcw9ApjxlOzE11siRPL5qgyLVFDmoEV/4v9W2leMd5Vmtd2JHuBWoNdgqhHGzfusy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769219415; c=relaxed/simple;
	bh=shw469+YSWmuYKxnFGhEWAGgXn/aeo44/j5AMlHrQ1I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Zpgwb8/+0AritXZnI1m922kEaT9zdqJVBMNLVo1dMIGTKIYZNyaZVAsysphAJ0CB/QWx8qgIaMXLAPpsLD3RBzYuBgyxBsc/WyFVF6jOKGvLVoAf+M0WzoqzYN/5s1MdercfgHtLIIzTgDIREKKmSYU/vtXpgj7YSzHDEM9Af6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=m/YmfVe2; arc=fail smtp.client-ip=40.93.198.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="m/YmfVe2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkBn2WaIsntggcD36Bu1d2/T+5R7fRoDn43UYyBgiqj3rLXbrB5rfdATOKl4RjRRy1rG6g0k3H0JkRtdwXFIZ28BjCzy3XR1dW60gvXl6wr3VCl79gJ80imG+bJe2xqkVpclcT8tPdtngs4wRiIFlwoQ4smwo2TSzEvd4ePz78VKa6BOfWOOXhE3GuE+OoJrTakcMGHdD8q/5t2e9J7zTZsqGZTtQS0ozPDCvP+Y2Ekgo+hE26zmXExEG7gLW3rrcZUMZBCUgoFq9lLwTA6Ry4PFuO3IorUCtQs6DKgMEnwpompuJ/+VRMglo54KnISBgE4jg10tgmrDwVDWKrUvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qhVu2/cIa9FvnlqTU+c29kxwBAFMTXFhI4AXEevtd4=;
 b=WLSmqYO662BsBcZ0Gmzq5wQaPavJnjVAp/QSjIAEy7j6ZxbyaSpUuU5nufykyhJoLUSVr0dGhDrzC1lXLyzsr0sypDWPEIzAFqzNpj1yIqftJjrsWfQIqOx7nK2z4s1w5sYz/fZNeLOtxT+wXdFMBt+UxePMikCtlJi03HN7sbsXlQggTLyBVDgIEsgnm9v9uY9I1yt5Cd+rz0G+OJ0kVFVfPlC3jNcPdLBXBrqiWXj/q/OoIVkoyJ38jsO0DQJRqlkbrFoVI2/2eNKKptRr/sP6Y211E4K/8hBA28l4lA7P6eWxUznbeEE6yHHlRATpptxQvT6LV3RUZoaw/3qifA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qhVu2/cIa9FvnlqTU+c29kxwBAFMTXFhI4AXEevtd4=;
 b=m/YmfVe2EQJ0yBt9Xp6TLpMKT7rDsYxq2GzVqm13VlffI1uvJwLKGymbRgu3NQ3pBazQEYWwIlsmLjL+Kzdvcz5+mR1Eove+mwCChjxcJy3S2pkafsm6YRfetflE/9637ocf5r6OqXHmZWhwtm7rdvAmO8Qk1vpP/Co/KugfsEn3s7t06Ik7lwt0aDJGxdsm2sB/fSCkSGYsqSVM8P0OOTCuDhnFnQiw+CoETdfLZ9TJp91TfFPt1Fqt/z9bP4QP7QEP4JcH6hSUsTzWxu8KEhV4kzSOY4uaFgqBm7e8v4qqNtQCMRVRg8htxYfgBqrYXWKiFb1/3q8qWiQNkmrScQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY3PR12MB9654.namprd12.prod.outlook.com (2603:10b6:930:ff::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Sat, 24 Jan 2026 01:50:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 01:50:10 +0000
Message-ID: <dd0cefae-49ab-4edb-a4c0-b7629f622cd2@nvidia.com>
Date: Fri, 23 Jan 2026 17:50:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/31] gpu: nova-core: Hopper/Blackwell: larger non-WPR
 heap
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
 <20251203055923.1247681-25-jhubbard@nvidia.com>
 <DFUEIY2MXKH9.1UAD8LZV7FQCX@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFUEIY2MXKH9.1UAD8LZV7FQCX@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY3PR12MB9654:EE_
X-MS-Office365-Filtering-Correlation-Id: 6477e04a-7ad1-4aaf-d8cf-08de5aeae84a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWRzN0tNUFpJNDN3d2NlRC9BN3hmcVNQZkVrdnRNdVE3NTU5enRWV0VMeE9a?=
 =?utf-8?B?UWlVRG45WGZtNVd3ZnJ0VkZaeTNuSGU2Z05BL2pOVUNaR0xaUEQ1ZXg1WU9u?=
 =?utf-8?B?NDgxZlRQUGQ3cmNicDV1QXJBT1p0V2JsbFFVSjd0dHpCeDljd2YwMGhhR0dH?=
 =?utf-8?B?YWRWTVFjSUxJanhQQzZqMXB4VzBteFlxOSs2b2JweWlNNUsvZG0vb1lCMHhO?=
 =?utf-8?B?eFZrakJOZElTZlp4b0t2K3dDbHNKU2N5YnlJWS9qNHh0YUs3ZW90UjgzbkxB?=
 =?utf-8?B?VGNLRFlzSWFUV09RYTdDMFBpNlovVEhPMlF1aTBoclhubjUyZ3FGalQ1d3RT?=
 =?utf-8?B?QzFuV2pqbWJqS0REYmNVUEttUDFJNy9zWXhuVGUvRVU1ZjBMMnkybmtDazFl?=
 =?utf-8?B?Z1hxS0RWc0R5bHJTVVZFU3pPZ1FKUmtSbnNjZ1FYRmppdUJwb1FXTTBSRDda?=
 =?utf-8?B?NnVUYzNHQ1FsUU5FSFhRNWdYdWFTNzFKdnRkQVRwM2lOWm5vUWhnT1g5Tjcz?=
 =?utf-8?B?YkFlUWxpcVMwa2dMZ05DU1JGWXVSQ3RJRzJ1dnRTNjB3bW5CVDNZQUljNEor?=
 =?utf-8?B?T204NjZJaFZPUVFsSDdxTWNvUUcxK2tuNVpzbmRQSzVzSGplVWg5WDg5Nk1H?=
 =?utf-8?B?WHdsSlZKR0JBbGwvVnpjS3VvSWF5SFk0WkxJWjI5RU04NWhqaVBGSzI0eUN4?=
 =?utf-8?B?UmNHK2QvVlFKUGdpVFJEVU1wQTA2d0QzQTFBV0h2WEh5SjlCbFNRWWYwaVFk?=
 =?utf-8?B?MFkxaHdndFpRbkZTNHdtTjVBb3dBYXVaU0dic2xIODFpSzBLNG5DNUNEbU9J?=
 =?utf-8?B?YjZmSEx2bGxOazlxTE9NNjkvdnpNMWV1aDJMTm9oOTBtRVVxYWlWd1d1MEJz?=
 =?utf-8?B?elo0d0RBdkZ0V0xvUlVlV3E4SjJHSVFmRzJPNEp3Tm8zNnBJbjYvZ2NwNnNO?=
 =?utf-8?B?aTFLK3RQanFveFEzQXhJVW8wS3ZBdmVjOTU4ZlA4eXR2NVdicm1pV2RDMmJj?=
 =?utf-8?B?NVFoeWlUQ0VBUU1QYnluby80MVJHUjNMU3QvRTN4cSt0T01paVBVQm9nNDJO?=
 =?utf-8?B?TFlNcmh6T0Z2OVVtZEpDYlNzV1ExM1VNakRzTXlncW01T1NkaWkybGpwRG40?=
 =?utf-8?B?TU5JbmNtLzlEUjI2T2hFaGxlSnZyQ0dTYW9FY2lMUHdMUGRDRVBLR1dUYTQ0?=
 =?utf-8?B?VWcyMnFnS3IzVFM2MURjZ1dnazhYcmxQZStUbHRBYXM4SGxtaHFRQk5aQ2pL?=
 =?utf-8?B?dlRTU2MrUm9wcEQzUnJlaXI5S1JXQ0d6QmFEcXUrYjd3SU5acjllbTN2c0lH?=
 =?utf-8?B?dnlLSFNEN2RGdU0reTZRL1JMQU9YVnNQZ290NUJoVjVpSndwVWlNdDFTdFJZ?=
 =?utf-8?B?amxsUm5CbUlXNnpjM2NCWHFmZkg5TFZzdW05a1hnd1p1TEk1RWtBdVlmb3Zx?=
 =?utf-8?B?TnNidFliZEFGT29lNG9KK3pNK1dSL2VYWWtsLzUxd2s2Mm1YT1I5b0VrUDAv?=
 =?utf-8?B?SnBSL2w2OGMxWWx3QmhtN1NOcUhOY2ZsNGlPTkZwMW1WbXlQeHdQWFFMd1NR?=
 =?utf-8?B?N2wrQzZvTURjM1RDMGpTV2ZMZkxwVHBoUFBOMnZEaW5YVFRxa3ZJT1diUmhx?=
 =?utf-8?B?ekFKamJWU2tDRHpEQURqRW01MUV4ZjlSWXF3Z25MMnhIR2NsR3N5c09TeXBu?=
 =?utf-8?B?Y1Y1NEpIVjN1OFhabmMzb3daUFJWd1VDTXozNGpGNVliZ3k1Q1VWclI4Q29U?=
 =?utf-8?B?aHBwRUFTRFMyYTgzRkpVZ2FKcEU1MG4xSHhpTWQraWswZ0V0MFJOYVF6Rnpk?=
 =?utf-8?B?b2tKZUR4MlBDQ05lZmFGQWFBMENJSE9CTVgzMFU3Z1NtOGNHa3RqMDNkVk1F?=
 =?utf-8?B?dnBORHZwSHFHeFBpWkd3WUUwbjBtbE03NHRvS01kMkk0QmtvVnUydVBycEtP?=
 =?utf-8?B?VEFDK1EwVzAwL245MU5DSUpHZ3p1RmdmRU51RG9oU2xrQ2t5dGRsbExjYktO?=
 =?utf-8?B?T0dpemplb3JZWXZKbXBqVGtwOTNaT2pycGd6Q0tjeFFuVUl0aTJZbllKZnAv?=
 =?utf-8?B?dGtKS2JEOWxKT3lySy90ZFdNNXZPYTVRTlBTV1V0TkJRelRTZUZOOHlxMHJi?=
 =?utf-8?Q?Z0xQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVdQVm1KOHFLOGYvMjY5QmErV0ZicGQvYXpSeFYrRkRvTHpadkFHd0tiTU0z?=
 =?utf-8?B?ZFYydmMvTUJTSmhYU1pqK2wwdHgxSXJtM29HMDNYdWpoMU1TNVNVZUpXNU9k?=
 =?utf-8?B?aysyQWdiVXJDMk5tOC8vd0RrdDU5UUxPd0xhZ2hGL2VrRGFGSlNvSnpjYXBZ?=
 =?utf-8?B?Tkcvblhvd2ZxUGZFN0hPdU82MkpzYW41SUNhWUprV2NuZUhrcjdUMUhxMWRF?=
 =?utf-8?B?bXgzSnlCNkNBVG9FVHMvbmN3NkhiKy8rRE5oNWI0V1BVTlFHZXVReGg0ZXNM?=
 =?utf-8?B?blVMSkZCdkNKNGF5NGxaa3ZTeDlIcjRlV1lSUE9KWFBvSGNDemJURWczT1ZG?=
 =?utf-8?B?Y0twbnJBcEtjcER5NlhoV0FpNFEwTjVpQXl3RVcxRmxpU29jeGhlTzMxN0ZC?=
 =?utf-8?B?aElhWmNmTGQxTndlTnhrVzNwMDY2OEdGWjNqTnVSNlVGZXFYVGg2dVpiYXZP?=
 =?utf-8?B?WUhlTTlTdENtZ05xWTQvakhjUncwUXM1Mk10UDNZZFhIYlJqbGdIWW9mb0Vk?=
 =?utf-8?B?TVFtTm5TeHN2V2NHQzlXRWZwMHdZQlRvVzRVZlZsdTI5VFhubmZ3bmp5bzNG?=
 =?utf-8?B?dWFIeGlsbEFVTHU3NUN0b2wxMWdVa2JYRFpub21CWFVGVStTUEVzc1dVbXUz?=
 =?utf-8?B?d25mTDZvZThHOFF6N3I2UVZ6UGMxZzlaaVhVaUM1MUcwcmZPbTRmTWswVHZn?=
 =?utf-8?B?cnJ3dzdPM1JNamRwTVI1c2UyTnBvQU15eE1GaFBwWjJsR1RIRzE3Y21FaXFF?=
 =?utf-8?B?VVZPNmNFK0F0YzhpbnRIVFJiUVpHVlJRWWlJRzViQWdwUzFhaHJEN0FXdFpT?=
 =?utf-8?B?QldKS3IwU3ZHbEJsbGdJck0rMWFJMWVRVit1NjB6UFdlQkZEcklGVXhmOFlE?=
 =?utf-8?B?Zjg2WDZtSkJldWM3c2wzTFpTQm1wRVdzZ21iQmpqaTF0S0I4YnJMUkU1MDBH?=
 =?utf-8?B?bzlvUnVPOFRUZVVUN05qYUdtYW5udUM3VjlLeU5yOG1OUDdtNkVLL21kVm5H?=
 =?utf-8?B?ai9DWUJhUEZuNXJja1lVejJDZWZNZnpyOEVtSWVSMTVnTjRYOFZ3UnhsSHVr?=
 =?utf-8?B?dHRoYXk2UTVueUZFVnU4K0RJVndReHc0eHdJWVBiNzhQMzJ5TENRRnhmdHhU?=
 =?utf-8?B?cmhyRjZjak1iaXpBUk0rak9DTHEzV1czeG93S3ZhZVVsRXBvUHRPaVNmUlNC?=
 =?utf-8?B?K3A3bTBHZ1ZFRVN2UWExRUE3Vlp4SEhkRWYrU25IUkEvRjNla0dnWUxseVZF?=
 =?utf-8?B?aFRGVnY1bFQ0V3BxclpBY0V5V1lVbGpXcmZsZTVEY2lSWXpOQktWcW1oQkg3?=
 =?utf-8?B?MUR1VWthY0xLdy9nc01venVUMUVTNTM4UGNsZlNlTmdydUhKdlVsZUVkT1Jt?=
 =?utf-8?B?U0J3M1ZBSENXZ0hCeXNGUUhMNzRLYlV3Q0tZTXB5SHhDTDNLSVhtSzluUlFw?=
 =?utf-8?B?SFkxMk9NOWsxNC9SZExtY1N0V0JXTmp3V0c2M0M2QXRaTUZteXlIaFFXZ2d2?=
 =?utf-8?B?VnZ1T05CaktDS3Y5WVVrSFJEMUE0cjBrS2tsS2w0dXdRc2g0ZG1reVJhcnNz?=
 =?utf-8?B?Tm1WRlVjeGhiY3oydU5hcTlLZ2Y5a0xNbkwwd0xsY1cyeUFjZDlMVmY3QXdK?=
 =?utf-8?B?OTViNVNtL3ZhMFZqUFZQRHAvVkMwUzhBM2dDdGtnMGdBM1A5MUpxM0F5ajAr?=
 =?utf-8?B?ZUlWbW1aa2RoYXVlVDBuNnMrajRVaDNEWDF1UUhTQjRPNjhrMmgxM1Y4dFRR?=
 =?utf-8?B?L0NKYVY5bGlQSjJCWWNNVit4WG51MTRGQlBGMWRhWWNDM2laRUFlQldxbXk2?=
 =?utf-8?B?NXFYZWxBakRhZ3VPTFJ5RHVERG1iRkJYcHhmbUp4SE5FZVpLNFZqTXI0YWlP?=
 =?utf-8?B?RS94SzhUcFBwRXJLN1o2cDh4aG02aEh6T0ZwMkNDUFNTZ0RDZ01lYTdwZnkx?=
 =?utf-8?B?a3gydS96d1pYa2ZNM2RuUnV2cGQyRGkvK0k3VmpQU3kwYmpySW9HNTJxbFEr?=
 =?utf-8?B?Q2dwdStTeGpWMWN4Y2ZZeTNrcVJtV0hwWmtCWVNQNitSUGZlQ1BNKzhpV3Az?=
 =?utf-8?B?Z29pZWZaRHNVZU42ZlZiTHA4Mk03WE1JL1VlYjhEb1JCS1pxUkNRaVN5Zzc1?=
 =?utf-8?B?ZmQ2TTJtdkFHVmczYTNaWkZIZlFlc2xuTjR0enJtUDFMMERsUTBKcjhCUGRk?=
 =?utf-8?B?VjVtMmJTMzVRWFI2akp2bGlibFd6LzBDNU4vQmJkb3NENjkrMlovbXVqaHZ3?=
 =?utf-8?B?VmVQUkJzNEJTYXFjZGVhQUcwblpOR3k4dkJxN1k0TCtEdlhjNXJHY2ZIQTR0?=
 =?utf-8?B?dDJWbmpkR3JqRTl6Kzh0MHVud2dTNTE2MjBNZEhTS3kyMkNNZWVnZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6477e04a-7ad1-4aaf-d8cf-08de5aeae84a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 01:50:10.1249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+maj1RZWjZshJaeI3RQjTaXuCioaIWA4+UzEEnmIdBQAcsC2dxipHVwSrx0gI9Kt+NptT+17O0/yRFPdQrv0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9654

On 1/21/26 8:18 AM, Gary Guo wrote:
> On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
...
>> +/// Calculate non-WPR heap size based on chipset architecture.
>> +/// This matches the logic used in FSP for consistency.
>> +pub(crate) fn calc_non_wpr_heap_size(chipset: Chipset) -> u64 {
>> +    if chipset.needs_large_reserved_mem() {
>> +        0x220000 // ~2.1MB for Hopper/Blackwell+
>> +    } else {
>> +        SZ_1M as u64 // 1MB for older architectures
>> +    }
>> +}
> 
> I think the patch that introduces the function should be merged with this one.
> 

Done.

thanks,
-- 
John Hubbard

