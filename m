Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020074.outbound.protection.outlook.com [52.101.196.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89D32459E1;
	Wed, 21 Jan 2026 16:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011604; cv=fail; b=B+uJFehgyKyL62nufr1+U76jz8Cb463Dn+LpMgxR/nerUMVWx+5Rv+im8Zw7xCFKr4eLOjr6pK6ZrGsPPTksGawLQflgnI3tGcCSFpMD1EcxgUm/LHOAX+SdYrarnVO9EHOqB4pRtSJ6TacifbJyi4kPTNZ9u2deXzN+56begL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011604; c=relaxed/simple;
	bh=X+INzQxsrdljaNNjRcFeO8gHEFFSTLc/AjCZnR8yxqs=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=eQPNKQwSYVq2p4MVbuyxdSunRmrNU8zF9dYGrsfvf55VJNEe8Qf72dfKMvbGkpnUCoae992hAiBIv2IBWaL+hxeTx8JEk5NQ+8IXmyqmw6r+xLdFYDShu6iZwFBL7BM+m2R1ypZRDckH1m//YUZqGPrOe83Rum9VmKawfR9vduY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=oqX2bMko; arc=fail smtp.client-ip=52.101.196.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="oqX2bMko"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhCqMtLV1u4zlJn/TWM21IWGDlTJ5tX7mFF+K7M0ZlYjBiZKqjCSCy2fwTsxTFqGb2mCFftUbyYRymvAd4NHIGloTkSs8Ks5eFZNaHXVyPX8jWjyw18CSYE3l5FMT0WJQcmA5GxDVoz2bLA2bKQ1Ng6MuCitH56aJTZLnWQhuThfWSSLZ1PCWp4Y3tKZRgAnwR+hCkZ7POrnyk7M23r9ze3t3G11r3bvm030MCb9wwmQ9ysmnyQ0V39K6o7rxN6bxXo/Kfa3q0gYR8dxbitmt096NsAR5VWwy0Wb8hT3sGJA8JNr+sJJ0rEZkuFNqc7JEqxXeuyFwstNuZH8N38bYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlC2DeENgM0nC1XzkAOP9Sy+0T9Yvmve2y0eessTH5I=;
 b=wEAum+bv1M1Qy2/Vu8+M4j6X6ydac398heJby+27K5r8U6HSnh1ohMy3N75FkLLOjWYpqarFFuLZd0F0MFzcvHMkharY/ap1Aw2CgqVvRGcsKjIVx/y9rOCiDQfu9oQYuPTn3X3Beg5PVTLdvn8OlnSM5ca3ZikqVq2n8WFFwOKz+tfcgQ/xaeOCnkfNugmBDpFQu+wjHR7RnJk0Mt0klAUHQ+Zk0I5lHkqbZT4T9GmRVCjnpW68tH+ggegNiHvB8OuHY1MstatLulv0etYkaIKjP6MoyuSoeGf6tC+ohiLN7xrJ5gwl0B6R1+OvH+SHe7nTuyEQ1xQans+9PSkyHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlC2DeENgM0nC1XzkAOP9Sy+0T9Yvmve2y0eessTH5I=;
 b=oqX2bMkozJGaXvM87CuZLX9Iq5EQVTzvGs070rZXXeNt4h/KMK4HTO1GNR/9gwsZX4lG6PCTjy1czzyh9j9HSCD5+PGYG6t9hG4L9U/ArPplcraSUEEVyUP6t78JeMnX1qgwL/mmfOFN3HwUBCuJSD6TEqw88UK+8ltSZvEr2XQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3327.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:177::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 16:06:38 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 16:06:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 16:06:37 +0000
Message-Id: <DFUE9X1HQG9S.2YDWQ6GDLN36G@garyguo.net>
Subject: Re: [PATCH 15/31] gpu: nova-core: Hopper/Blackwell: add FSP falcon
 EMEM operations
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-16-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-16-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P265CA0140.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3327:EE_
X-MS-Office365-Filtering-Correlation-Id: bec7c3a7-515f-4e18-2aad-08de59070f17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RW43RFl4REVTOUwra3hBTm02ZmRjQVJ5Ymc5NHMrSVhKNWdFSGtEM1B2Qmk1?=
 =?utf-8?B?bXM3OTd2aVY5ZmJibW0wcjRobkY5VHZ5bUpBKzcwUDJrcUdSbW9WVEV3TXRN?=
 =?utf-8?B?WndkNm1INHVDV3pnM0lGaDVOYzBMTlYvOEVaK1drRzFjcFkrNkNkVzY5SUlR?=
 =?utf-8?B?MDB3SnJaN1huUGdTcWkyZ3htTEFXTFRuc2t0SmZOSE82dE4ybjk2NkFHOEJI?=
 =?utf-8?B?eHgrNkR6bXNRbm1IZDVXMC9Jd2lLcTZCMi9kU0JiNTJLT2tDcmtucEdrakcw?=
 =?utf-8?B?eGxNUldFbDlVWkUxbXk3VGNEOE1HTnNsWTRuVlFQR0FRUGovWTZJMGVMcUlI?=
 =?utf-8?B?eE1mWEpSNVVxaUpiaTNYaVowZy9raDltcy93L1NYY0pKWGFRZUdGRDZQMHZH?=
 =?utf-8?B?MU9WdldRcXdDcm1TYzMvL1NiUnkrcDQrN0Zlai8zUjh5Q3NlWnpPNXZFUy8x?=
 =?utf-8?B?UEtXUlZvdXZLNmhDNnBVT3lCN2NjM0hVSnpYNlRrN3p3L2hNbTJ4VTl2ZnpM?=
 =?utf-8?B?dENYWWRkWldady9NcCs0TEI2ZFd0ZnFIMHdVc08yMFNlK2t4VlNYemRkaGY5?=
 =?utf-8?B?dUJWS3paNHZjZkxWeGUvbFltaGtUcVFram5WVGswZ1YzcVFNZXFKY2JUR1Zo?=
 =?utf-8?B?TjVwaW9FenM3UWd0dVFhUlpaN3hIY0NOUHlLOHovL2lZeUE0ZmREeko1dk5T?=
 =?utf-8?B?YTlvb0dnY3BHdFAydEpseGlaUnJtbGRsZkRqdHNkOVdmdkp3ak5aYzNjRWVJ?=
 =?utf-8?B?VlF5dHE1ZFdnN2hrNklpVXVWNGFNT2JFVFlMcjNKbzBnUjVmajBMNXN4VzV2?=
 =?utf-8?B?bHQzaTNDdFlTOVZDbXRzbFpkRW43TGp2ajcwWGFXaGFFK0h5VW42TmQ3blc0?=
 =?utf-8?B?RlhBUm1XeVpjTElsSUFlNXNRZFV2aDZLY0plQW9xdE91dDRCVjFVVUNOQzJn?=
 =?utf-8?B?bERVT2xDVXRmREhrcGZlMmF1Rm5Ja2VzSFZoNUo4Mjc5VlZvWlp4WGYvelhQ?=
 =?utf-8?B?K2hncTBHM0N2NVl5RW9scTNMbjlIaUUrdCthUUc0ajNMRHRSYkFLeXRGU0JV?=
 =?utf-8?B?NE9zbnlldWlJNkRCRTVyR2kzd1lGWXNMOXJUVk1yL1VGWmZpZzRGaHRRSjdp?=
 =?utf-8?B?dkduNGFZbjZRdmhFWG42RGlvZkhIakhVZXIwQ2EwVjBySUo2Zm1lVE1oeU9o?=
 =?utf-8?B?azU1UDdSeG9RS016azhvS0JObExUUGV1NmZqTWhKYU9MKzZDMkprNVM3NmZM?=
 =?utf-8?B?ckI0LzFYTTZWVlh6VTNVQkRhT0c2cDc5elN3Y2tNeEZXTERZdnZjczR3TkVh?=
 =?utf-8?B?VWtDNk02emx3TDVsVUQxMGFSNTVGM0tLL1krZStUWng3MlBBd0JCSDc5ODRF?=
 =?utf-8?B?UkFlV08zb1FJVXVFMktvQzhBUTAxcHRCVkR5S0hTOGFodjF0aXlhVTc0L20z?=
 =?utf-8?B?K1prMjZCUFRRVFpvWWRHWTlZSHIyK3ZZaEJJUzA2WVg3aEcweVNIMEdCcFZn?=
 =?utf-8?B?NHpOTzFpZUZwbjRVbmxNaDVkOE1TbFdXa1AycE5yUWFvUmp3emRRS2FCa2Z4?=
 =?utf-8?B?bmlKbGdYa2dlQzJoeVJveUtIKzJIM01QT2R5a0x3eno3Mml4bzFLUE9IOGo2?=
 =?utf-8?B?RW53ekpodkJsOWJSd29Hd1NLNThScGNmRmJBNGRTOEw3eDYrcWRzRjlCTExh?=
 =?utf-8?B?UW5kSzdiZHlYZWV5N1BjaWZqUG1EWklHVHErMnljbGlzb3Z6ejBaaE5LcGZL?=
 =?utf-8?B?U2I2Z1d2b0V0TERlVVkrYWJLNlVXWjdGYlFscEFjUGJjRWNiUUpDS203YnR4?=
 =?utf-8?B?bEVuWm82QytObDFhYklUeWRwRkJERG5sV0FmUkJPb3RGZ05rKzNockpmbFVj?=
 =?utf-8?B?RGIyUWRUZ0NsNVZZN3RrQlpvNTRCbGlaaDRUQVQ3alUxQzNjNnRWcnhITjVy?=
 =?utf-8?B?eFUrMFFHMzQzeGozREdJNS9iR3JXNzZvRW01ZkdRQnM2QjZzeE9ydk9WdGU1?=
 =?utf-8?B?elBnZXprZU9EVmpDS1pWbm1oOVpxTS83NXhIUE9selByVGd2MDd6TjN4ZEJG?=
 =?utf-8?B?ZXQ0MXpPY1Y1aGVDVnJvdXROcEJOcHFiclJVbTU5eklXcUI5RnN4TXdURTVl?=
 =?utf-8?Q?35jc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym9TOTJPeWpwWVIzaVhUamhsNGxyNjRnOWlSMm93YXlmQk5odUhTRnlwbm10?=
 =?utf-8?B?ckNzTmtHMEtTLzBseHdzOTUwVFF3enVWNXJkV1IreHhJK3Zqa1JVei9LOVJC?=
 =?utf-8?B?bC9teSsxR1dkQWh6NDc4cStZWERFZFJRd243eGUxcVQ1UzJHSEtpWkU5Qmxq?=
 =?utf-8?B?aUsvankxLzFwUTBKMW1DcEZ6anQxZUEyaUxIRzExeEdQZDlZdnk0VXVZTUZW?=
 =?utf-8?B?dXNLcmttN2lXdFJLOE9scmNxREJpSU4xRys1TFlnTWx5bW9tbnpKaXlzb1pw?=
 =?utf-8?B?Q2FYdlY5cjdBeGZoMDA0d1BGaE05eXVNaENyMjBlZGdhMVg2aHgrZEhscE5w?=
 =?utf-8?B?YVR4Ym1UU0ZLdGxEb3R4MXRUcnVYMkRJNVhWQy95UVd2RVVwNnJYaVA1aitT?=
 =?utf-8?B?dFhUT1FNK1Arci9pRkJIMTZNYnpGaFlNSEt0bXdpOENtemtLd3ArMi9aMFNG?=
 =?utf-8?B?STA4ZzRyNzlqNEdEMzVJbE5tMVRwUTFORHV1a1JFZmhvaERxUlhULyt1VHhX?=
 =?utf-8?B?ZEJBK003amptMG9KVlFuV2h4Zm03aXhnWVMwYk5MTUJ5QWQxaW9KWWVoVW5l?=
 =?utf-8?B?L0wyNytlWWJSSmtoNFhrYUo2U2JOdm40cml5RjA1UmU4MHpDWFdtUHpNa0Ix?=
 =?utf-8?B?MDh1Z3Z3akR5clJpdWhRNXFGa2RuWVRwTUVLVld0U3ptajZ0bThDblZibHNl?=
 =?utf-8?B?L1pwT3F6UC9iT3ZSdDdmSk11bFNyazg1dFpPSGwzQy9pMHI2R2ZLNUI3dm11?=
 =?utf-8?B?NlBjbEFGckpyUjF1Ynl1WUlDUzRmZnprb3VwNS9RSW81dUJpbmxERnR5T2px?=
 =?utf-8?B?OWFDU1ZodS9DbmdxRm9NNTJRWklpc3J3Y29sVlNPZlFPM0c3aWMxa0szemtL?=
 =?utf-8?B?c01YcFIyNUZmUldIVys2dGpieU5RWnNSRFBXTzB6cUhZSDNqM0tuSEhlSHhF?=
 =?utf-8?B?V0tVU2IwYUsxR3ZvbDJERjYvMDViTWtSb0lyZmVVKy9kTlp1ei95UFpOZG9a?=
 =?utf-8?B?Vmx6WHZNWVpid1BsVU9hYW9kR1NpVnJlVmdHOXRGVG9CbC9lU0ZRV2YyQkJN?=
 =?utf-8?B?TWNuS3pGUjYvWUFwaWpPajBZWFQ0RFBKVE4wOWFVRDBkMlRwNytJbWVTTGZC?=
 =?utf-8?B?L1IrVHZ2MWpXU21CWm9GN2V6T3R1UU1XTFpMakNxYXNwMGhVRGFOQkVYbTl4?=
 =?utf-8?B?MFE5aWtvTkI1RDJZb2pPek50NTZQRjYyVEpiUE5FWE9sKzNQcWU2L1JmS0J0?=
 =?utf-8?B?M3lxQy9ONDhQd09UbnMzbHhsUEhPdmMxVmFEclZkMDJPVUZ0cHZXaWFnaUFa?=
 =?utf-8?B?UkxSVXdFTmFXRkJEMGljVHU0eGFWdlU1MWN6WlpsNXJxYy9UN0FuK1liKzFZ?=
 =?utf-8?B?T3hJUm5VWEdyQzdQb0l1cHZINnlhQUdZUzdJb3ljSWlDbTZVT1pxK3JIVS8v?=
 =?utf-8?B?RmRVMzRqa2xsMGlIU0NGODFRdVJwOHZDMUxNeWtFMzI0UVJvNFNaMUNBMGNv?=
 =?utf-8?B?OE40d01CdnU2QTdLTXhYWTFBMlNBNnhVN0llN2syaTZMOXk5MHo1SXBkS0hh?=
 =?utf-8?B?RmFhSVNoVXE2K3lteHNCdEdRYWEzM3JxWEo3elhaOWlZcks5dWZ0SUxnQjJu?=
 =?utf-8?B?eEN5SllEUEFhRG1uVEliRWk3NFdhMVpGZTBkWHROZ3hsNXZvcnBrb1NlNjJB?=
 =?utf-8?B?em5pak1ERy9KSC9rZXF5NXhFQXQrODBuRWExakFYWTJkZHNXQnU2WkNzVFla?=
 =?utf-8?B?ZHlsOUpJVlJFa1N0RnF0NFUyREdhMVlwSDF3YXY0ZXNaTExOM1oyUmVzRzla?=
 =?utf-8?B?VGhXSTFybGFVSkxRY2VHclZLNXdhYldXbTNIUUtWeitwcXVXTnVGcGl3eEJr?=
 =?utf-8?B?ZU51TUtFOEhCQVRCbmJMeHRqWTIyNlN4N0NZSDBvckJhWGNOd2JLMDhndFNT?=
 =?utf-8?B?dDJraVlPd2syaUxkdlJPNjlGcm9iWEI2eno3QlZoeUh4NlozQUpZaXJFNVM1?=
 =?utf-8?B?SjBJY0dwSGVhakc4bDhEeGNDYWxUYUtCQ0hHZ2l6ZjdrUFhiTjg2VnNKZU55?=
 =?utf-8?B?dEZRSjJLZllBTkxQd3l2TWpEVGd6bXFlME85Q0dJU3JjaXRJMDQ3QUVKc04r?=
 =?utf-8?B?bC9ZdEFtVTAvalpSSmFBN2luU1NhMWNyS1Rzb3JiSlRVMUJYaDFZa20yMHhI?=
 =?utf-8?B?VXFlV29qVGtDRGwzdUhaS1VsdlNnVUlKNGpqVFVob2R2c09RQ1dHTjlGRDRk?=
 =?utf-8?B?ejN5T3pNb3lOZ3psSHZsQ29XeEcwTmhLbys3NWdPMmxoejJnWTdMQ3NxQWR6?=
 =?utf-8?B?dmFaRXJHc0hLaEVUdjhEOVNpMW9vM2NjMFZYbEFueHF2MDBDR0E1UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bec7c3a7-515f-4e18-2aad-08de59070f17
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 16:06:38.6781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HXg5FZx98+j69MEjB07HB60991Na9RC+d0CSfxC9O4RwKoQvkxwdNgQ25GzeXJnxavIqF7DSVy5laAojb7nyEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3327

On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
> Add external memory (EMEM) read/write operations to the GPU's FSP falcon
> engine. These operations use Falcon PIO (Programmed I/O) to communicate
> with the FSP through indirect memory access.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/fsp.rs | 60 ++++++++++++++++++++++++++++-
>  drivers/gpu/nova-core/regs.rs       | 10 +++++
>  2 files changed, 69 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/=
falcon/fsp.rs
> index 7323ae2f2302..9e796e82e556 100644
> --- a/drivers/gpu/nova-core/falcon/fsp.rs
> +++ b/drivers/gpu/nova-core/falcon/fsp.rs
> @@ -5,15 +5,27 @@
>  //! The FSP falcon handles secure boot and Chain of Trust operations
>  //! on Hopper and Blackwell architectures, replacing SEC2's role.
> =20
> +use kernel::prelude::*;
> +
>  use crate::{
> +    driver::Bar0,
>      falcon::{
> +        Falcon,
>          FalconEngine,
>          PFalcon2Base,
>          PFalconBase, //
>      },
> -    regs::macros::RegisterBase,
> +    regs::{
> +        self,
> +        macros::RegisterBase, //
> +    },
>  };
> =20
> +/// EMEM control register bit 24: write mode.
> +const EMEM_CTL_WRITE: u32 =3D 1 << 24;
> +/// EMEM control register bit 25: read mode.
> +const EMEM_CTL_READ: u32 =3D 1 << 25;
> +
>  /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
>  #[allow(dead_code)]
>  pub(crate) struct Fsp(());
> @@ -30,3 +42,49 @@ impl RegisterBase<PFalcon2Base> for Fsp {
>  impl FalconEngine for Fsp {
>      const ID: Self =3D Fsp(());
>  }
> +
> +impl Falcon<Fsp> {
> +    /// Writes `data` to FSP external memory at byte `offset` using Falc=
on PIO.
> +    ///
> +    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
> +    #[allow(dead_code)]
> +    pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]=
) -> Result {
> +        if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {

I was about to suggest `is_multiple_of`, but then realize that it's only
available in Rust 1.82+...

> +            return Err(EINVAL);
> +        }
> +
> +        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
> +            .set_value(EMEM_CTL_WRITE | offset)
> +            .write(bar, &Fsp::ID);
> +
> +        for chunk in data.chunks_exact(4) {
> +            let word =3D u32::from_le_bytes([chunk[0], chunk[1], chunk[2=
], chunk[3]]);

Use `as_chunks()` can save you from doing this.

Also, a typical pattern is `chunk.try_into().unwrap()` -- yes it has an unw=
rap
as `[T]` -> `[T; N]` can fail in general, but not with `chunks_exact`.

Best,
Gary

> +            regs::NV_PFALCON_FALCON_EMEM_DATA::default()
> +                .set_data(word)
> +                .write(bar, &Fsp::ID);
> +        }
> +
> +        Ok(())
> +    }
> +
> +    /// Reads FSP external memory at byte `offset` into `data` using Fal=
con PIO.
> +    ///
> +    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
> +    #[allow(dead_code)]
> +    pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [=
u8]) -> Result {
> +        if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
> +            .set_value(EMEM_CTL_READ | offset)
> +            .write(bar, &Fsp::ID);
> +
> +        for chunk in data.chunks_exact_mut(4) {
> +            let word =3D regs::NV_PFALCON_FALCON_EMEM_DATA::read(bar, &F=
sp::ID).data();
> +            chunk.copy_from_slice(&word.to_le_bytes());
> +        }
> +
> +        Ok(())
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index 82cc6c0790e5..b642cee9611d 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -391,6 +391,16 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
>      8:8     br_fetch as bool;
>  });
> =20
> +// GP102 EMEM PIO registers (used by FSP for Hopper/Blackwell)
> +// These registers provide falcon external memory communication interfac=
e
> +register!(NV_PFALCON_FALCON_EMEM_CTL @ PFalconBase[0x00000ac0] {
> +    31:0    value as u32;       // EMEM control register
> +});
> +
> +register!(NV_PFALCON_FALCON_EMEM_DATA @ PFalconBase[0x00000ac4] {
> +    31:0    data as u32;        // EMEM data register
> +});
> +
>  // The modules below provide registers that are not identical on all sup=
ported chips. They should
>  // only be used in HAL modules.
> =20

