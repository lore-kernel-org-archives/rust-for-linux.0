Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021092.outbound.protection.outlook.com [52.101.100.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74502F39A3;
	Mon, 12 Jan 2026 19:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768245210; cv=fail; b=nqgum24TWE5e85oYwO9JW5OuuNMx3Sovd04Ax7SSnpEN2psXGWhAJRNI+7JQCGmSlB560Ut/lcR/Sp/3vJ4cUrBFQ9u4bnzcWxgUpJB2nK8tXKOkaLL527hk+/4b4G+RWZAs4srK6W2LMRHCQK6oNPrxo5p4/kZx/WaRtAy/oUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768245210; c=relaxed/simple;
	bh=0p8Ab5/qYav8zQCtt1EVjpCfV/LFmAWBfiLu34HqPrA=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=QCM2WzD8t7lYI78VJg6Hf4DyJwlATQkILxoyJxCazTirOPIFeRhaNJ0YNduSPZtvjVN9U6bRRc+G7HCdIKKDyTIXurksgNdofwvX7/DlWEei5aCQJIKkNA1WabjafFl/AvURIiP821oEV85BP0hivs122ErK3vVXrBqXIit34d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=G5n+AgbC; arc=fail smtp.client-ip=52.101.100.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="G5n+AgbC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwTaM79sU23HKT4jgTLoeUID0qfUI1yNGiBSGcOO2jarF9liTPkSZ0ACf2rshxl5qv+O4ZXOMvkXlGdZe3YgtV0j79gW+Idg/rHxIUGqbEZNOrvJI9AlNqAoVLmeZ7Mhd0UEo3wk8/bX3YYhDpGiM+FFEAiwRc0nxzHVwB0NrrpnIPt3ejdKhk+dMiuaozqag0iB/vv6L2NeRQGYcFzm6AWXbjK8Xm80HGgiL+3f5WJg7WLT9JJkBtSVVLWeQHZMriI2pw1hNZuYcWFXoXyWg9aI/9xlrd7wZTYNd2MXIA36WYmlzqAdQ7F70SGpf4hIZXrykbGTT8tdorBI/5DWLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJupbSCXxLvLIsxZbg+L1EuBPxFimozzcT75Yo++2NQ=;
 b=XOUgI/Fizqx/CSYSWsF/Ibwl2o7JAOJBtbF8UNfgCHq/0K2SY7xAV/wWpnT/kYQBAfY6JmlEpja2xv0TxQXPTZFZHml+0xlBBy4szlu1m6YC6ds52gMtv73r9XLEhqmrxIC/JALQLKEb2NVoDDEBteVmh8PV66WahgQ3e0syGMzHOKoIyzJ+Ds/8cyZXxIAutJubIxCz7O8wxo7fLvhJtBMEK3QtIbi0PmDdugyPyD+wKDVBBl/fmr5YrvCaSiOdBS+KDXfALN2nvVnQ+m/38AUZSYTGZ6kEJsd7NlsuK/POpol7JG3tE+qxe9tXK9rexFeTqH440ptv1ewJ56OsBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJupbSCXxLvLIsxZbg+L1EuBPxFimozzcT75Yo++2NQ=;
 b=G5n+AgbCTMgVs9lzsycCTu+JXvN3x/7g8q4/fdL+GIzCkWZ4gBELcCdTCRyAZkdeuAkH7tToL8wQ3gwZ5vNdoW++ujgtYuhk0vwKYCp0za7bUa9sUc0unuFNS0EDRMmTvggxmLzU0uyqVS1Loyq657jvlxok2Tanq8J52X6qe2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO3P265MB2378.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:106::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 19:13:25 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 19:13:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 19:13:24 +0000
Message-Id: <DFMUM0YE3V2K.38547VHBEXPCN@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 14/15] rust: pin-init: internal: init: simplify
 Zeroable safety check
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260111122554.2662175-1-lossin@kernel.org>
 <20260111122554.2662175-15-lossin@kernel.org>
In-Reply-To: <20260111122554.2662175-15-lossin@kernel.org>
X-ClientProxiedBy: LO4P123CA0333.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO3P265MB2378:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a4fbb13-a7bf-4f9e-9d9e-08de520ea93f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGdwSnJDWHJnSjlQc0VINHJoL1NqYjNMenREMmQ1MnFiSVJDVlRjT1hFR0Vl?=
 =?utf-8?B?NmlKUnpUU2F3Um9ndjJQNlFSR1FqbFV1aVdRbytVTXcyVDhjclRMdU9mZUI2?=
 =?utf-8?B?anpCeHlrbmxScUhxRml4NUN6UnFjbzJLVTlMbnJuZW45Mmk3ZnpZSmhHdmpT?=
 =?utf-8?B?MlNMa2ZGQ0tPbnRQMWErWVZoQkdhOTlqKzlrTlJKaWxLRWUwTU1EUlJlTVFq?=
 =?utf-8?B?YlFJaTByZHFER1JtcXFkQzNKRjBYdzVVYVJ0NS9VRldGN2cwV2RzdWpyTTkz?=
 =?utf-8?B?L0tPVVI5ODZUN1VhOWpZMWJUdWIyUmRVNW9xMHJsekF4Vng5Zm42VzBvMUxl?=
 =?utf-8?B?dGtsMmhtS2daaW1oaC95Qk9GRVpDUWFudm00eDRGTVRyMjd5NEV1NjBuOFdF?=
 =?utf-8?B?M1hhNnQ5TVMwOUJYTDRDeUlFQThUNFhyWlV3TW1JUDg4V2VmUzd2dGRJc1Zv?=
 =?utf-8?B?TTlrUm5LcUk3b091SjErQjlkQVV3OVQ3U05UZmdKUUhpaWoyWDBiRE9IMG9O?=
 =?utf-8?B?amR4ZjNIK1d1d29lQzI0dVgweVZ2Wit6VFN3MmlTeDI0N3pPaFZ0aTk2ckRv?=
 =?utf-8?B?a29JMjJkejBJQkM3Z0ZNK0JITlE1QjluSGF3RGlINzQxa3lkNUdlUjVrdFh1?=
 =?utf-8?B?RDQ5Z0EyaHBCY2tLMjRuc01JWlVpc2ZLV1A5d09WYTlxdmFPZXhsQU5PZzVY?=
 =?utf-8?B?bS9NbUhDdDN5Tks0TXNNUFlMalZxZ3RvMkNOMVlrT2k0c3NSREJneHRZWURY?=
 =?utf-8?B?Z1dLbFRsYTB0RCtldVVEVGVRSWdpY3pJZkhQV1lrTXFiY0ZLR0RQRkZUK09h?=
 =?utf-8?B?M05SeE5jVy9Xdi81Z2F5REFWaDJ4N2E0RnFudzR6L1Y3S1Q3aXVpeUdPNXp3?=
 =?utf-8?B?NTZJSWw4RkdlQVpyd1d0SzIzNURXN2E1VGRBZ2tNY1RrZXlwemFMaE1zOEtp?=
 =?utf-8?B?eHhHUHhWdGtRQyt4K3VadnduaWJGeUIzdjlpQk91dTNJTzdBWkpXcmhNdkhh?=
 =?utf-8?B?RUVmQThFZDR4M2FIVWtDRVJXczlhVzNWdVU2cVFZYm1CWGJ6bDFjcHdjRXN0?=
 =?utf-8?B?WWZMTzVkR0dVVDBGbGFheFFUMjZVbWlIR2lzUVU3MXZvNC9WSi9yRnN4akgx?=
 =?utf-8?B?SUtFcTZxdXI0N1dzc2E1a1g4Q0ZSWk9DazQxTzJBTUtMc3R3RFc5amhQSUc4?=
 =?utf-8?B?Ull5bGpUUDR1cnI5OUozbUQzaTBkcFE5bUlGMVYyNnhLZWljeW5wSTFTVm9v?=
 =?utf-8?B?MGE5YmZCVGViVlh5YlpKWmNCMDdpemVsT3RUL1BZdmtEb2kyVnY1UkRLM0tr?=
 =?utf-8?B?SnFWYjRwUldVb3hLT0xUMG15Y3plbTNIbW44KzZaSEtNbHYvck12Y3gzY1lm?=
 =?utf-8?B?TDVnSGwwN2V2b2VqeTg2Ry9LTmJqSnIrd2pUMS95NDBoSUdvYWZLM2ZkMzVD?=
 =?utf-8?B?MFUrOE1OK3VSd0FsY2I1eHduajJoQzF2TlpkdHlKWDBtTXlOT0duNURVY08v?=
 =?utf-8?B?clZkTmk4WENyZG8rdjdZUzc3N3cxem5Bczh5Z0F2bVcwT05HRXB1eS9DcTV3?=
 =?utf-8?B?aFRhVmFZRHlPWHJJWndtejBlRXNNbVJmM3oyaVhGRllXcEgwNlltRVNEdWRp?=
 =?utf-8?B?ZU9PdFgyUWtqS0ZwMEEwUGlTcGVKNW9vRndPSE1XVEJzbW5ocVh2UmU2Y3ZK?=
 =?utf-8?B?L3BQbVFhZThTRitHZ3R0cllDaC8wNFVZbStBd0RxMVg5TVNoSjR3dFNEOGtO?=
 =?utf-8?B?aVdlc3k3Tkk3b2Ntd1NIN1QydHVuenFMRkRvVVltcnl2eUQ5YUFCV1VtcFBq?=
 =?utf-8?B?TkZBdTJUZUo0Vm1vUTFkYklmZVRXV1V0cm42d3hZODE2Nk8zQVZWcEIxcWhq?=
 =?utf-8?B?Tzg4QkNXZkVZclZPTitrRDJ3bS9xM1RqQUszbENMTUlKOURkRHhGZkJVbGZG?=
 =?utf-8?Q?Wq4EirdfIV/M6ofwx0pKfWLlUeYjYdfY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVUrNk03TDlmQUVxR0NSVUNFdDBsZSs4d1hqNmdEaGhrSm9xSnFCTGdKNzRo?=
 =?utf-8?B?WGdJSnpyM2gyRWE2dGhNdEY1YUVFWGQxeGhlK0p1TU0rem1rdzYyNGNXWDhx?=
 =?utf-8?B?SEV6OWpQR3pFS0d0MGNQSmtLOFFHcFV0bjVncGVPN0ZCUkRzbVp0aDhWM0hi?=
 =?utf-8?B?MjlNdzUvOURhZ1ZMVzh1T0NBWG9tLzVLZS9taHN6RWMxZFBjNVp3QVByV0NL?=
 =?utf-8?B?Wk55R0FxbU1oSXpJZGdoelQ0cUhDM3l0U1UrNUlpVEtXTkhhS3VxbytyS0JW?=
 =?utf-8?B?ZStNMEkwYjU4TlVKRzJRMUJHek9pZ2llV0FJekppQW1hWkMwR2p3cytwTjM0?=
 =?utf-8?B?L0p0V3orRVZIQWQreXV6bVBoS0c5SEM1ZXRDc0FUTmRxLzBnS2hxV1VLclB5?=
 =?utf-8?B?alJpV2VxVTFoc1VVVFpMckhBdC9kcERWN2hvQUY3eDZzcTNLR2cyUzZ6YXBC?=
 =?utf-8?B?UElsV1pBT1QvOWNuYys4MFo5NFdhZ0swcFI3ZlE4THJwb0xKeHVlUGludjZU?=
 =?utf-8?B?ZVZ3ODdHTG1jUEdkVkY2OGZCZUNEcUxqS2ZmVjFqcU5LWk5yTzk3K0kyNHF6?=
 =?utf-8?B?anFpamlvQnA4QmVzc3hIMjY2RWF0SWRoSDZqbDM1cjZ6Sm1KdFphTUJNYmYx?=
 =?utf-8?B?bmdsVkJrVXVOOFArckNudEV5UWRLL3MwMTRjNHIvNktacXdVV0x0VTV3WXIy?=
 =?utf-8?B?d0M5K0JxYnFGaXVjMzdlaExuOTN2QXJERWoxMkdVVTJ4dEhPanprdERaYkp1?=
 =?utf-8?B?M1ZqVHhlZzdLTUZnVTQwaHNXTzd1MzRHSzk5dit0UHZNWTdOcG1mT1F2Nnpx?=
 =?utf-8?B?UVpRYVBtZDZFL3AvSGd1QUxqemVSZDdsWFFoNzRoMTNRWE1ZUjBxbVYxZ1dk?=
 =?utf-8?B?TXIzZXlJZy9lWEFJNm93MU5URDlGckpZRjJwL2FBcHdCM0RkQ0tmQzNYaWEr?=
 =?utf-8?B?ZEMwTHRXQjBobFZEU2dZcDdYT3IzL1JhSVpjTGJoSm9hSFFjSjd6SlN0UzRq?=
 =?utf-8?B?L2UxdkVtdWZKalk1Q0k2Q1RXdC9aYXIrSmVJWktpbzdURHVLU3kxS2FIL0JK?=
 =?utf-8?B?c29vWjFoOTBLVnRrdS94Rlg1MHR4VVBONDZYbkhJOUx3eHE2U2xtOW5FTEdv?=
 =?utf-8?B?QmF1UkJiZjVjd1VaeXFTR0VmUkoxUm5sNjVDQnl4WnBURUcxMW5sUDhGRGFC?=
 =?utf-8?B?SERtUTJ6alRDUnJlNlJBNkk3VDg1T0Fja05adGFFTmp2bFF3VjRISmI2ZStZ?=
 =?utf-8?B?TVZGYkcwbUlkNXJSOXdSRnJRMG01cU8rQ0sxcXYyNkVhenp2WUl1NUxDdnlw?=
 =?utf-8?B?dC9UdW1GMUhjWitKVXI5Rm85UVlGdllCbHhVdkVUbTl5a3dtQ3pEMVBaaDdO?=
 =?utf-8?B?NjVpcEJ2QWZYWDhLT0tyOUVVRWJLWFZxZnZqUmRJQXVGMWhVOXA3MDM4WUFa?=
 =?utf-8?B?aHRUUzBGMUZGSEp1M0RpU3pjeTZraGZYdXh5RTFLZXlYRHNRMzJTdWJJcEVN?=
 =?utf-8?B?Rzg5VUxtdnUzUDd4aFZWMUpwSk5hcVR0dERQUVBjTGlHS3UxVURjQlA1cWtj?=
 =?utf-8?B?ZHNEZ3hCTmNUNmpueVFmVGpjMUxYSzU1enc5NWhQaXBJRjMyeElEQmpvamVP?=
 =?utf-8?B?RlJNU2JXSHFtMWFSaE1ZNW0yeTk2MjVydm9JcWVJVlVITHFKdGRBMGJLN0Jr?=
 =?utf-8?B?aXNpMjhMd1l3ZlFmT3pFT1JtRk1jb0RqK3NyR2lOQzBOZ05JcU1kZFZGb0Rz?=
 =?utf-8?B?OTFBNzJUdVFKVFhoUTFGT2pFb1BwM0NoZFdsbUxoTWhEZ3UzU0NKSzRKcjcv?=
 =?utf-8?B?UVE1Y04vQTZROVo0QkRQMHRtYk9EQi83VWdNTWpub1FFVVhISm1MNUVMM0xD?=
 =?utf-8?B?UXc1dm9LblQyNnhOY2hJK0Q1THIrN2gzRDMxQlpvMS9yeUIrcEtvMFRNVzJa?=
 =?utf-8?B?OG1NWDJDelF5QnNRcytjZ1NlbkcyL1JWMFBOZXV6dTg3WnE5UE1xMVB4VDhs?=
 =?utf-8?B?d0x2Vnk2Ym1uR1JvTUZnVnNlajdqbWgrT3A1TWhNQlY5RE8rV0tic1NxcDdt?=
 =?utf-8?B?YzRHUGFnQTlsOHBuQ3B2R0pxNHhVT2lPTlA0cElhUE9lL3BEalpXMTF3Mkts?=
 =?utf-8?B?K2t0UmxXOWJjbHlQNGxkZ2lEVmMxbWtJMEdKYjFDQWU0NXo1Y1dqT3hmM1hm?=
 =?utf-8?B?ajNRbjJXZ1V1eFlMOFVmdmw2NW0xc2ErdFFEZmM4SHRoOUQ4amhYa25CN3JU?=
 =?utf-8?B?OExzSVBHVldzcm5tcGkzUFE5dWhFTXZaRVI5UnJnZHZMYktkVFpXQTU0ZFVp?=
 =?utf-8?B?akxBLzVlblFhVGRENWdmTXEwcS8zbjJVc1NXQ1loU3lSMjVCWk1nUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a4fbb13-a7bf-4f9e-9d9e-08de520ea93f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 19:13:25.6331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOuAUxz139ETg3P1IpTLxzvDiZ61DCICh81OwXrnmwuUtFpMOgk9kfj+qoDcutCTNu3FOjiI/ne1BzI85h6s0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2378

On Sun Jan 11, 2026 at 12:25 PM GMT, Benno Lossin wrote:
> The `Zeroable` type check uses a small dance with a raw pointer to aid
> type inference. It turns out that this is not necessary and type
> inference is powerful enough to resolve any ambiguity. Thus remove it.
>=20
> Suggested-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v2: added this patch
> ---
>  rust/pin-init/internal/src/init.rs | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

