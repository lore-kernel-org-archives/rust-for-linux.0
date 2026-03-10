Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011020.outbound.protection.outlook.com [40.107.208.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26EE387345;
	Tue, 10 Mar 2026 10:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773140275; cv=fail; b=fab3xeU/jL5G9RHDzKr48lVsofx9MNK/tFCEx56ifPC/5U6L8RUBPLupN09NyPwSZ8EPIbNwWZIS7x5cdnnUplu4XDgWF8nP8iXfmI8NidX7UAwLzxrU8bd/DODYHsMWHqNwVUucxahobXszJiDRdbbWZ+WzTPWMhrtGMoYMRd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773140275; c=relaxed/simple;
	bh=kYKM73nTMQ1XKF7LJeKRQuhDPnHj2K3pE0I6sB2l5FI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=qA87+uEa2vknAZYIJMiiAAoTBZZFTlwlWd5c2KgVLp7B9r5QjZeb1nDcOz2taOIXp3Eui9xAj52X279phBxomt0xnFM2WdS8AFJfyxg6fiv0rWLKGKfDfyDy2tbhGqdjN7Ccgt2CXRFLNDo3RybuYJDNG0Tl1OAP62TEW1Nxyhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rxGbJiho; arc=fail smtp.client-ip=40.107.208.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rxGbJiho"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hn1BSHrQ98Ov0RzXYFEe+GIyJeqmerUb2Dy/hvW2IaOoIoiA4Ng2BSGXQvKQd7qYa0ZIObJlpW2WSnN5bOqBZw1xPj/qX9jq1XcsyGNz7CncwglQx1oaQicmpLOcCakGChs1ydzbpY1t3PDX6ILDHC7DwxcfP1PV0whGRs3+RVmHGuCcEM1j+w6v5cN2oy4Zv/0uzs9ar+xZMNzGnT8A8K/ZDWp+Y2aed8GUuA9psjaEij9/ajEx5DycCLlbNND7iAqbQVV4tc9Ma4PBttRxk8xPOZ8OCGyzbmQZFcTb1A6cQu8x3ySqnGVnHTdFVt4DeEG//+7zERpGuNgPmdOt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7B1+M7MyD0s95vEAWhiwspE09XcJk2m2Z7HXIYndqM=;
 b=vDsClno+RNZrTr82T1VOtGf0JCpjKrz5FIYepmY43tPTO0kPPRaDFylYxbwxlzYSt6IZUG7inCb+eaXsadvm+FVh6xslNIcRaKQTgSHLyo6PZoy4BCHPiIe7Q9q0YAGJU7h1IESspdzOMp1dtKxSkkavcYH04Bwk9uuURdM4ngu0AcqEf76EWw8lzGVAr+S2XV5neIEPRQLB4f9WvnHcnq5Y6+a2Yqv1pYujORxa0u4/jrpE/19H2j3ct77SLeAwfHYRUe9+XwbUOumauQdGXNqDzPzsS+ENrEdon4uJU3ux0OakkAVTETq/FEd7RdRV8nHnaHoS6LDsZ09qt01oDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7B1+M7MyD0s95vEAWhiwspE09XcJk2m2Z7HXIYndqM=;
 b=rxGbJiho2taO6XD+lFLGiMW5FuHM4yohCnbdCHv5zrUPCcTJkKfjm1oqJCXKm7l6cxUfai98VyOpU8bTuMmPrbkliDXhh7kCMsXdm4Uaw8K3O8JDFwFWigdntrnWkPGR0mjBnwSmpC/7XBWE4FDKlrsww94noDj5QjpnyqwBp+wO5SGZk35s+z4K+Exhk4uloIUTb/MGVg6Sruk3xWFBeyHkssxL7RZ09V3VvO+SzcOHjMpSh4q4NBPSi1UFgxIyvJ9wlTh1elhN9NBKXom6zFd7ux1FagyUXcjtVsRHAB05wFI/QBKDJjwpx1JBdHryriKFCuabnHz5gH3jiTTVlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB999080.namprd12.prod.outlook.com (2603:10b6:8:2fe::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 10:57:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 10:57:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 19:57:45 +0900
Message-Id: <DGZ1RKRZNJ92.3IPLTIW507A3R@nvidia.com>
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
Subject: Re: [PATCH v6 18/34] gpu: nova-core: Hopper/Blackwell: add FSP
 message infrastructure
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
 <20260310021125.117855-19-jhubbard@nvidia.com>
In-Reply-To: <20260310021125.117855-19-jhubbard@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB999080:EE_
X-MS-Office365-Filtering-Correlation-Id: ac78236b-9a21-4626-0f10-08de7e93de45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	lvvb7q0WPekQHCr2UFiml54tbvT4hYcRZmncE+JOcQah52I/c+3nplm441iH//pHA5noXzSN99Lm5vyXSh5Fh86mTFu3TijnxsUMHkk/BjdJhTXQGY1hIDAtJeParFgz6WFRxSgIvfH+dqSvlwOKbnsAniGkgyji099+oJu+8Y+bjI6ad6wi80ah+quzSM0+v8fRkqtHtpy/r6fWAYEQWtaWvVzAvd0CD8pyWYjvAD4WtNyTRHz04TEzDui1h2CnG66D/ovFfE7CmPOnfgWR0THggW6LGKcFRDDzwPDaS0fjFDGr7JNS7Bw4FuIyf3lEPSIrQ7JjVVAapQCliuSxycXx/grzxPTjrEHoiHRZXAcj8qTns5yeg5g772KTx+ICXTJvgO9Ob7VRYXWK8RyI1zaYjLQazbZ3WvheeiLnKg2EYkC8/HuI5gKJJnm76TDcU+60BA3Z42e//LHqfLo+G+Sw2AEOvLRl6jbBhTYMOXwceUiTxc99PtFnsUK/g1fDLTzPonPH/pdhsiF8/2FDoMza1fK/gT4DBgYDKHlS2gN4P7WxibZAK8l0/qlY95hxyuv8xfohrgCN81fn9Yq3QNPFXOFVCtv5jzYgixMojORYHF9+uTDRMr6uy6EkHEswZEluG4UQXM+aZLtlMEkV9foEiFYGcmRlJ9rzJ5xIwZIznM96vPb3roS2edZlXaWRAJMIAi8IEicNaKVxWQ/4yQz5EuL1XX2lY+edsaxatzg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eC9RblV0d2pXUEE4bjcvcjREMFhEYzZ6SmZDc01INEc5bUJscEtmaUZ0NU9B?=
 =?utf-8?B?NVR1ODE1K0FvWmZ2WXJISlhzNHlOZ0RkNERDL1hpRFVhYTNobG4vdFZ5WU8v?=
 =?utf-8?B?V2s2WEdzODFOekZDOFN3YmNiWGdaeTNnOHc5N21ZQ0FDV1VzQXdxQUVvbjc5?=
 =?utf-8?B?SThqUmUrTU9qYyttK3ZzOTE0K2VybUIvVktuYitVMTZyeE9NTjJqemg0ZW85?=
 =?utf-8?B?R2IrMFFzQlQxeW1rNGhhU25UUXF5ajU2MmhRTGxBK2srbGJWZFVDTEpQYkc5?=
 =?utf-8?B?ZmRoVzNzMGVlZExaRHJCb0pVU1JNZUwxT3kydFVyTHBtR1FVbFFDU1hjUkJJ?=
 =?utf-8?B?RnhtTHNMY3VkWWVCY3l3ODZEZmFsNEU0ZHNLT1ZjVlUwR3ZtN0djdU9kN0JB?=
 =?utf-8?B?cmt3bzJVWEpMeWh5UVBxQ0RRWGphSDNaeERLUFFZeVorTkpJTVBMblJHWVdt?=
 =?utf-8?B?Sks3S0t0Z1owR3Z5OXBzSkZGaFpuaUd3Z3p4WVRxRDdDSDR5TmJQaEpSemMy?=
 =?utf-8?B?ZC9nOXVTakpDMG5NelNER0dyTFB2Q0VuUm45c2pFR1V3UFAxSk5FbFlUQld5?=
 =?utf-8?B?SGlPbU9YRTI1Y3ZiUHJWN2ZqNFVzQklpUGJVOURkdm4wTkxJWnNzRlBtbXd4?=
 =?utf-8?B?em1zYjJmQWRKbDJwWGFMbG5aamllTm0vV28yK3d4UjJXVnNLOTVzNmlsaFQ0?=
 =?utf-8?B?RVd3c09IUUFISG8wN0lXMzJDdks2NWNkcm02TU1sRnk3aWdZeGJjNEMvZjh6?=
 =?utf-8?B?Slo1S0txYmp5elgwME5PMUVxSFFpQUlBRlVRekgvclpoMTdGQTJBTXVPTHAv?=
 =?utf-8?B?RWRIZlluVnNKc2RmWVpjYSt4S2Y3dVFzcVlvN2dDRFpybWl4clM4emFhNGRB?=
 =?utf-8?B?ZlRGbHhHNTJEbm5lMk5FSTJOWnc2SFN3WWcyVm1CUm1JWlRERUVoeTRtRHF2?=
 =?utf-8?B?Q1hQUVV4WEIrRFZWSklTK2JoWDIyODN4Z2o3dEhDV1JmKzFIUS9mZUVxU1cy?=
 =?utf-8?B?Z2dVZDRuSjNDZTdXTkhUaVEvRTFZR2hPNTVTUENnVUpHcG5jWVFSd0wzK1lB?=
 =?utf-8?B?Z3JwUDlVNE55bTZmQnczY0JEZ05hRHZGM01hQ0trZUVLNWlxWHVaOVhtc3VC?=
 =?utf-8?B?dDd1OGd1WHpxTFJsb3NkUjlxcXV5eTB2UGkvM1g2VzJhdnpCWGZGaittM003?=
 =?utf-8?B?WDA5WTliUFRSbk5velQ5aTBTcUl3N1AvaitpMzBUeFZkc0s3R2lLM2ZPSmhH?=
 =?utf-8?B?Yk5HbTd6UVBZOVhOc2QxREI5dkIrc3pNR3F4M29sZ1Q0LzRqekZwM2RVckJR?=
 =?utf-8?B?YkgrM09KZytxTTR5bldEOWNiVENyL1hsYzZqOEM4NUlSVlNsZURqMEM4SWFN?=
 =?utf-8?B?bi9henlRWm9jc29aYVIwNGN1NEdiMGlSUm1LYUhMeVNRWExlSTFwYkhraDNS?=
 =?utf-8?B?M0hUZnlaOWNlVEdzdHRQaTFsaWxVQUZacElINHVRZHFSVWs3WlhsMHp2SllM?=
 =?utf-8?B?Vzh0OE56cExKamQwVUF4LzYwUG42U00wNTlMbFpzeUFGQVRxRXg3YjBQcE9n?=
 =?utf-8?B?QmJaanIwU0s4dnRyWWYrc1J5WXczanJCdkR6dlJyUVNXamtrbk1xQy9NSmV1?=
 =?utf-8?B?bXd6TjNDTVNuTmtlMmVSTjUzOS9DdWQ4dDRDYk8rNUxZSWUyTDZ2K1gvWHFV?=
 =?utf-8?B?Rld4bEtnSy8yVUNlVVVMUmJHSFVsOVhuNjg0NUZnUjFUbnU4YUNBQ3BNQWsy?=
 =?utf-8?B?Ukx0VVA5enpCczhvSVFYb2MzY2dQbmxOY3BYU1dvK2lZL1U5MTJEVjhTN2ww?=
 =?utf-8?B?WG1CaElNRDNNV1FwTFFadUowUnBhcWpBWG92UlRzVUI1b0NVazV6TG5WVGkv?=
 =?utf-8?B?V3lpNmJmMUM5RkRNY0xLRmF4V1JWUlRpZlZldXJhaTFnbWI5T0RXdU5yWHZJ?=
 =?utf-8?B?b2RNWDN6UUd2Nmh2aGk0UTA4WnJNSGhoaFVJWG1QRUNnRjA4dEZmZnlEMjFC?=
 =?utf-8?B?ZWRYOEVPK3dWR0c3S2VBSXZ0UllEeUxLYmdsM1BSMENLOEREcmdSdGJCa1pz?=
 =?utf-8?B?VFVWcVRjYUhUb3BXd2ViZnFRcURtM242cTk5ZzZFalFvaHFkbHpIQUFNMjVx?=
 =?utf-8?B?TGFlejRoZVBBS3J3bEU0cXQ3SHdoZG53dnRSRENsbjQ3YUtScE10am5TdHlD?=
 =?utf-8?B?TWdFbkl4U2JxakMxemNKUTAySE5wTStrejlLSkdEZjVkcy9nNHpCalppaHZo?=
 =?utf-8?B?QWNzNnJDcS9KYzIwRUhtZ3RucHNVOXo4UG91MEJQQzdxaTJNU2RsQTBpellq?=
 =?utf-8?B?WVErZzJxRkJKcm9DU3lweWhuVkNuRVZVc1ZVZXFBZkpRa2tvMGdKRDhDNDFj?=
 =?utf-8?Q?x6EyWhJLmpnk1i2jn1EXnEFGY/M/MajQzQOwb+q3X0/yR?=
X-MS-Exchange-AntiSpam-MessageData-1: MVHJXuv+RSkisQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac78236b-9a21-4626-0f10-08de7e93de45
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 10:57:48.9307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwwsEUfxKdTdAvwhBywoeCU6LUUhZ0cnI+iHuua5XGDChueS7eqXiWzRcisY1cvb7EmT1PZIJCAAXnSGyZ5MPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999080

On Tue Mar 10, 2026 at 11:11 AM JST, John Hubbard wrote:
<snip>
> +/// FSP writes this value to indicate successful boot completion.
> +#[expect(unused)]
> +pub(crate) const FSP_BOOT_COMPLETE_SUCCESS: u32 =3D 0xff;
> +
> +// Helper function to read FSP boot completion status from the correct r=
egister
> +#[expect(unused)]
> +pub(crate) fn read_fsp_boot_complete_status(
> +    bar: &crate::driver::Bar0,
> +    arch: Architecture,
> +) -> Result<u32> {
> +    let addr =3D fsp_thermal_scratch_reg_addr(arch)?;
> +    Ok(bar.read32(addr))
> +}

This function is unused, and modified in patch 22 - so let's just move
its definition to patch 22.
