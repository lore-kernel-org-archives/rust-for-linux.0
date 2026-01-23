Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020091.outbound.protection.outlook.com [52.101.196.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBE22857FA
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 18:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192104; cv=fail; b=qUxWROTK9+rOoxismz6r0joNo/3eW34HEDiZC6Hb8405zWdtMHRacxEuTBHWKPSgLmMqgzbZgQPMFhjf5F89bZh0WddkfCkqhjGt4N/SG12JaQ1RvNwz2DKwCI9byeg8OKTvRlhpSd/3gi8YYQHz1jJVrBf6ii/TrIvi+CMNMas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192104; c=relaxed/simple;
	bh=WQTtPRI53IsTLbAli5B8KWo8dAx7otswD8xlH+Utphs=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=cqHTyfgBDQihW9zkXCY4gl3XaYDdffpmlFY08GM/XZdq7uss58ApGAIM6Jp8aNWxmYBH+bx5dM2PuWku4HIu0RoavHgIQZTvAR9apA4lM4mDd7+swirzAvrM3175W3nb+5jyhicD806hGPYp1ZnlEZnwPTXjOj3CyqTsWefWAfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mkel4MvA; arc=fail smtp.client-ip=52.101.196.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mkel4MvA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0WS0H/7GQ29QsH8nuafzID5LvGPzyeUrYq+Ebq3pyWqr24iegZToaZ9NBw80F9xRAm00vmJ/cU9Dpgd4Ge05oOy6H9J5roRgudJagT85Qcb5okrj/MuOOEqTlwHIysJVyhcPkb6rj3Tkzi283SG3Aq5hR+pWzBGcXoZOTtfr4PpBdVK88Pbhe6GqDEQvcWH6yhApAXMy4flQ6I5SrfXMdmPI+aJUPQ7Kin8DostiJaYvBha+u3bV1Ax4WRhSHuqN8Gil1824JMNBjw35Wyx2LfJLRcJOFjYFkB2Dg9QdgXE4oye7OsC7E4MhiCbBx/UQZyZgCqxH/BUA1tuInJdhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSrEMJ45aLKI3zXmQduLvKg3VkxJ3cVFdmLLVsvR76g=;
 b=laWGWK7UWd3CpNMvVbdErGqoL0/vgtEb37ncMH4LTki1pwxDlCHQPk70zJvw2tR0NwbMCQT6sGMpDVClkluYTkpfiKYPn2eZWufhir2rfW//SkGx3EyFgn6+sAx5pieqHAtHxesp569hAK80AR4PzSRQug7GpGi0Rx40ahDRD/dYML7WiFHZCWJAXJ+IDRMDU+wsT2rq8iuUIiJPkgY4FTMY0aMnS+PkNVx81v1lP7em6vKmkMYGUVJc8vBlWgSPO1yk/FT4n7w9yaviiKfJmbWn6KGpoipvdAId2fxE5QPza1JoHKr80/kC9eFVf7QTkXs96t5KsrUiSFdyQN2hww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSrEMJ45aLKI3zXmQduLvKg3VkxJ3cVFdmLLVsvR76g=;
 b=mkel4MvAfM8/Hu3VnJqx00x80iCkhh3Uu8E6SaWa9sA1WlKDmFUOzvbQUYil1E/GEmG0xAarIvvxB0FVEG7gJ/FXQiB0Sf/PMqRigz8ySM2VH61whImITAtw4AIpq0IwqWBN8JSkvREyNMih21eJmQBzrNTIAAaxfd6suU2bJCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5114.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:15e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 18:14:59 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 18:14:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 18:14:59 +0000
Message-Id: <DFW69A2VGB81.1YJ26924JUFII@garyguo.net>
Subject: Re: [PATCH v8 11/13] gpu: nova-core: align
 LibosMemoryRegionInitArgument size to page size
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260122222848.2555890-1-ttabi@nvidia.com>
 <20260122222848.2555890-12-ttabi@nvidia.com>
In-Reply-To: <20260122222848.2555890-12-ttabi@nvidia.com>
X-ClientProxiedBy: LO4P123CA0180.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5114:EE_
X-MS-Office365-Filtering-Correlation-Id: 803cfde5-044e-4a58-05fa-08de5aab51fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXp5RTVLUlMxUXRKWmRvckVoWnNoZG9Pbkw2em9vaHlyRllzZVVTb3VnVk00?=
 =?utf-8?B?NGM1NzliOUlqMkJ3VTRrS3dlWFk3U29pbzBEU042bUVMMjNEdmRzbG0ybU83?=
 =?utf-8?B?WjdWT3lXSVJ5RTFoMlY3YTlkdDl5RFVUM3JoalpnQlE4cEJwOEU2TzdySE0x?=
 =?utf-8?B?b3NCNDl6Z0hKZGFJZTR6UWVOa1QycEJRQmJobjhrMFVvK3p5a2Q1b2xIR20r?=
 =?utf-8?B?RlQxdEowR1U0VnY1RHF1dmF3ZUJwdjBwcWc4V1A1aTF0UHdhcW52MlJaeEho?=
 =?utf-8?B?c1VFbG45cGxxaThsTDIrelU1dS9Fc29WbHUwSE9POW90VEw0UGtBSFovK2pr?=
 =?utf-8?B?RERBekcvVWxvT1d6Z3owenpKZVRlMXErakd1UGM1bGh3bDBET2FGZnIzTzVv?=
 =?utf-8?B?N005b0pTNnp2UTVjem9PU2g0OTUvc3FJZUlib0Ixak5pQTJsdzhmcDNGNU9O?=
 =?utf-8?B?Qk85aUd6WUQvMUV1Rnd4WENqYXhhT01iajRQajJnTGVsVnVzRmJUSEFjZitC?=
 =?utf-8?B?MXFkdGRHYlNleDNBMHBQb3NUSkI2QXNUck1CUmxvYkhKeTFKaCtYY3JrZGhF?=
 =?utf-8?B?QjBndk9WYVk5SUxLVGJpNVplc0k0c2doU1l6eldHUXpNVEhISXNyOXFsOWZM?=
 =?utf-8?B?VU9RQTlSSEVIK3lwYU9jS2s3SDBDY2xoS3kyazBjZFNIMFdlc2pEU0hqTnJH?=
 =?utf-8?B?c0VGUWI2a3d1bzR1M054SXRNU0lRb1lEQ3hKT0ZjaE1DRnlaZ1I4Zlh4R2Js?=
 =?utf-8?B?MWZ2cHIrZjRxNUE0RXFIc0hUWUwvWGlZY2hzQ3FvVFFmTVJzYjFmRkRUK2dJ?=
 =?utf-8?B?SGUzZkZqbnI1SzFIYkEzeFdmL3E4NlJlQjZBZ0t1c3Q3Nmt6cUxucm9iQUho?=
 =?utf-8?B?OG5uVU5zdGpXY3dXWVdKVjdMODdreDd1YWJIaDJTZDlRVkxCVHo5M2xHazlv?=
 =?utf-8?B?enlZSU1XbXZ2UWZKT0R5Z01MdkVTcmFhVFFyVUF3d08zWWhuQytpUnQrYlB5?=
 =?utf-8?B?RHlKa2psanVNOWJzUWkzQ0VFdzY4cUpxTnV5blRQRSs2YmRoNDFKZlN5Zkxi?=
 =?utf-8?B?WjRSSEM5Yll2WHpCQ3lqRTI0WmdOTzZjNWlLSDJ3RSs1VU9Bbm1qV3dXVHln?=
 =?utf-8?B?TDFkV3hWMjN2enVoeVprNU5HQzdiVWdhUER4TVRiOElLWTV2OFZ1MHQySjYx?=
 =?utf-8?B?dWJRak4ycmE2S1FDWHdmT1JlaFRMekIzOTM2eXBIQ1NwSU02NGNmY2ZScGM5?=
 =?utf-8?B?Z25kUWZ1aGtsVDhpRFRBbnI0WndLTEkzNmJYZjdlM1ZweG9ubnRBM2ZmMnlU?=
 =?utf-8?B?VGVLaXVnZDNuRmthTDlDUUQzVWtjaHkwY1E0QnZXMTNxZ3NnYmlwSXFPelJ2?=
 =?utf-8?B?TFNkdTJGQVlkUFJ0bXMrZmxFa0pHSkdtZ3FRSlI5S3Z0NnViZURxWXVPQ2N1?=
 =?utf-8?B?N1ova1g4V2lrb3pjcU9xNzU4VWY3VFN3Zzh5dDBmMlRyeHgwL0RzU1Y3d0ps?=
 =?utf-8?B?eTRiZDU5UTQzWDVDbVRoR1J3anBwcHptQjE1L3hURWgxTnZDa2ExMXoxR1Vr?=
 =?utf-8?B?QW9vWVFQNHh3aTJkdUptMzd4K0s2MlRyOUNrY1BuYWl6S2dSa2toeWkrRHhl?=
 =?utf-8?B?UnBTbkVKbmhnaEliS092RkpVYnJaV3R6QnY0aEx0RjQ4M2ZxVzVzODMwTytV?=
 =?utf-8?B?MTloWlhnd1N4THBmaTdnMVVvR2hBRFIvUmJGZnl5ZWxmUlFkWVRWWmxBRVRE?=
 =?utf-8?B?c0ZPZWdrSG02ZTFtQWNJZ0QyeU9pWTFJRFVEZUwzZER5NVV5cUM3NG8yc3Y5?=
 =?utf-8?B?ekVnUW1Dei84QkpoQWl3MXdSaHZBU25Wa1NMUzFzY0FrTHJMRkV1MnRvbyti?=
 =?utf-8?B?bTNZYWY5SEhLdlBrbk5XbmlQb2ZVTEw3MTc0eUZsV0dCQnpWS0RvRUtEUStB?=
 =?utf-8?B?Znp5UjkvRHZBQ2xzY3RJTzFRamMwbVptT2xxZFlCdDk3c1FMVXhQUVVQWVQ1?=
 =?utf-8?B?ekI4TENINDI3Rkc3TFhvN29yQ0pyVUNVYXNWYmV2Q1psK2RUaWJjVno1Y2hv?=
 =?utf-8?B?UkNKeXUyQnlncFhmNkN1Q1RTWVkzdElSTnpiMnJnajFhcFEyZ1lzMUxNb2Nm?=
 =?utf-8?Q?6ZSE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU1lbGNXVmZtL3o1bmpBL0pjc3pnRmh5SlJMenN2WlRZZVF3Qk8wZmZ6czE5?=
 =?utf-8?B?Q1h2eUVCeVV6WC9yZjYyTEN2b2VsQ2g2MDQ5MWhHWCtEaGNwQW1uZHAyc1RV?=
 =?utf-8?B?U2dSQlhjbXg5dHRQa0FXTDF1SEFCekFEWHdBVXlkeFZYNC82bmxXRDVZS2Z1?=
 =?utf-8?B?bW5OeHlhNWZMRWNKRnA0d3czUm8wU1loYzMxSS9rV0gzTGN5MEVkWnZ5NGZC?=
 =?utf-8?B?S1dFU0Q4UmQvMDloMmxUTVllekZqVTVDdUdiNldGb054SDZ0YzY3MU9GQmoy?=
 =?utf-8?B?RWJMWnlGM2x3SG10ZWVkQ0tlTGZXejhSSm05U0hKK2RFWDdjYjZGdFRGdFZT?=
 =?utf-8?B?S09IM3Frd0g0QktqS1pPSFhjQ2dRVzdUbHFYR3hPODk4eXRkZmdsYTZEd1FN?=
 =?utf-8?B?OFRhZmlDY1dlM3Y2OENnb05uLzNwQ1BPSEpyUnhrSzA3WEx5Vi8xcXBTeU1U?=
 =?utf-8?B?anZ2bzZZM2RPcXNtK2NKQkpwUHVoMXJnQ0IyQ2pvV0hJSW5sRGNmSWVMNGY3?=
 =?utf-8?B?OFVNbkI1ME1jNHYyMVFXZTllMW9DcjFWUzVaYUJ5MFhURmxsQ1BYdjZFYysw?=
 =?utf-8?B?TGJSbVZmYmsrc29yUWdTcDM3dmI4S2NWMGpwcTJpWm5ERHU3UWZhR3k1RDBy?=
 =?utf-8?B?SU4wMTRvQU1QdzJBVEp2OHlCbTY3eGxYOGNLNkcyZy9SVXZpK1VMWlArc0p3?=
 =?utf-8?B?TTk3NlhvcHNUK1p5ZGYrelNPQVFjcXpDRmpUeWswbWU5QVpwVHpHYmRYcmd3?=
 =?utf-8?B?NytVamtScGJRYjZ1WC9sSVJYVkVaMHFUYThqVGFHRm56RHhSeWtxS0t5ZExs?=
 =?utf-8?B?bDBQZjl5SjlIUFdOUTA4TnhXb2JDUlRmaW1vZW5lSmJucDA1dmtYaWdncU1D?=
 =?utf-8?B?cmNPbkQ2YlRIazNMT24vQ3pQbEdQUXZaajl1QzZhTzAzOG5xa1lweXRWMURL?=
 =?utf-8?B?WTUzK2w3dFpUVlVVN1Q1a0UwVGY3QTA0WVhKNURTaGNGY1dKM0E4bkwrelNO?=
 =?utf-8?B?SWd6d0FzNS8yMU9DY29wUnAvVTFHYndYZDBRYW1PajFqSVJWWDhkNGNiZngr?=
 =?utf-8?B?dXdCRUZvY0Y4aUF4RWRRYXFYODAxdUFqVGV6UTA0TEt1ZVg5ejNITSszenRO?=
 =?utf-8?B?RTAyUExtWXVWejFxUG1HaS9hdCtzcVlWeHRBMzF5N0VuV1Y4c1RubEwvSExl?=
 =?utf-8?B?RnZsS1RrdERjWmZPNlp2MHFHcEtVdFBNRzhjVlA5Z1VuQ3hNakdvbGVEVUZl?=
 =?utf-8?B?NEt2YzV5RFdiZ0x6SXE3T1BPdGdiOEVubWJNRm9HTUJ0WUJKNU9VUkQ5Q1dO?=
 =?utf-8?B?ZWsvRUR1SWd5eFBTRmk2OGJoTjY5V0pkTDVrTllreHRVWHFQcVVQemZDaU5v?=
 =?utf-8?B?SDVTbzZjRm9xZWN0WkJJemNIdlBhRFZPQ3YrUVJzc3p0RTRkL3Y5MEtDNisv?=
 =?utf-8?B?Slo1SmphOFJZK1lFTzh2N2FMUk9LMUo4SEtXdDl0VWU1aytBZTRvdFdJbzBy?=
 =?utf-8?B?WHFkaXFKM3JMUFZHc2VIRTVUV25odm9TWTBuQVMvU1YvSVlNY1Z1YkJBeFdl?=
 =?utf-8?B?VlcxMUdkcm9uRU9EWnF1eWhPYXhZWDRJVWwxelAyWndvQ3loamVvTmU0WWtV?=
 =?utf-8?B?VXBXWklJSDJqQ2tCUitja2NscTVrcG9yUTBYS0xYRVF2bHhhYjFJNUpxM1ZZ?=
 =?utf-8?B?R3VRMmZaK3Q4dmltVFNKL1NCNUpZWEN5VmM4ekI3Y1RCY0FUZDE3Nm9pcFd5?=
 =?utf-8?B?MlBrRGkxY2hSVDM5RXN4b2ZLcVRZSlJROEl6K0MyakF4cTVMaGxEbXB4c3JV?=
 =?utf-8?B?YkZhYXVXeGt6SkxXYjZnbWFXdk9iU3dGN3BTU050VXhmbG54MG5XUXRKdStZ?=
 =?utf-8?B?c3pIZU1TbnFISE05VURibGh3WE5KbEdSeFpPc3BpUG5mSjVUMHVFM3J6c2NN?=
 =?utf-8?B?WEVzUGNWMWlzd2Q3S3gxeEdNaW50K1FpQlFMME1kdUMwdGtPMFNROEdDamJL?=
 =?utf-8?B?YlRhamxudExRUzl0ODVPNjYxSTcyNHQzQ1hRdTBUMHZPb1hDWVIySWhkVkJS?=
 =?utf-8?B?anlyaDEyQ1MrblU1YnlmV0lnd1pSVm8zelJQNmg0YWFLRUZIVFF4cC81QWhP?=
 =?utf-8?B?L3gwTkRDWGpKdVRZSzNHcUkrZ2Y5Qkx4enJWV3hiUWg4TW5ZRTdMRlZwbFBs?=
 =?utf-8?B?LzR4UlJtSEE0bEVGb05FdWlabURyOXZZaVZvMzJYYndiRjlCRzVzdnF1NU1o?=
 =?utf-8?B?dTFXQnl6bFJlSGJ5QzFuUGVpMWNZUHhBblVUM2duTEsxcUFabkwyRXFsOGdP?=
 =?utf-8?B?bGdPSXR3Z0NWWG1vdUtlZVduR0ZqdXBZU05aWVRPMk13bGR5bVZVUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 803cfde5-044e-4a58-05fa-08de5aab51fa
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:14:59.4926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: viCem0x4aAllO0OEG5bLeKN1b8jYeeCS0w7ujdprqTfXUs5U4/2s+2nVmTm94KgdPyzmJ1OguqUAv5wtUcdSww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5114

On Thu Jan 22, 2026 at 10:28 PM GMT, Timur Tabi wrote:
> From: Alexandre Courbot <acourbot@nvidia.com>
>
> On Turing and GA100 (i.e. the versions that use Libos v2), GSP-RM insists
> that the 'size' parameter of the LibosMemoryRegionInitArgument struct be
> aligned to 4KB.  The logging buffers are already aligned to that size, so
> only the GSP_ARGUMENTS_CACHED struct needs to be adjusted.  Make that
> adjustment by adding padding to the end of the struct.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs    |  8 ++++----
>  drivers/gpu/nova-core/gsp/fw.rs | 14 +++++++++++++-
>  2 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 766fd9905358..bcf6ce18a4a1 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -27,7 +27,7 @@
>  use crate::{
>      gsp::cmdq::Cmdq,
>      gsp::fw::{
> -        GspArgumentsCached,
> +        GspArgumentsAligned,
>          LibosMemoryRegionInitArgument, //
>      },
>      num,
> @@ -114,7 +114,7 @@ pub(crate) struct Gsp {
>      /// Command queue.
>      pub(crate) cmdq: Cmdq,
>      /// RM arguments.
> -    rmargs: CoherentAllocation<GspArgumentsCached>,
> +    rmargs: CoherentAllocation<GspArgumentsAligned>,
>  }
> =20
>  impl Gsp {
> @@ -133,7 +133,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) =
-> impl PinInit<Self, Error
>                  logintr: LogBuffer::new(dev)?,
>                  logrm: LogBuffer::new(dev)?,
>                  cmdq: Cmdq::new(dev)?,
> -                rmargs: CoherentAllocation::<GspArgumentsCached>::alloc_=
coherent(
> +                rmargs: CoherentAllocation::<GspArgumentsAligned>::alloc=
_coherent(
>                      dev,
>                      1,
>                      GFP_KERNEL | __GFP_ZERO,
> @@ -149,7 +149,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) =
-> impl PinInit<Self, Error
>                          libos[1] =3D LibosMemoryRegionInitArgument::new(=
"LOGINTR", &logintr.0)
>                      )?;
>                      dma_write!(libos[2] =3D LibosMemoryRegionInitArgumen=
t::new("LOGRM", &logrm.0))?;
> -                    dma_write!(rmargs[0] =3D fw::GspArgumentsCached::new=
(cmdq))?;
> +                    dma_write!(rmargs[0].inner =3D fw::GspArgumentsCache=
d::new(cmdq))?;
>                      dma_write!(libos[3] =3D LibosMemoryRegionInitArgumen=
t::new("RMARGS", rmargs))?;
>                  },
>              }))
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index caeb0d251fe5..89be26b597d1 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -904,9 +904,21 @@ pub(crate) fn new(cmdq: &Cmdq) -> Self {
>  // SAFETY: Padding is explicit and will not contain uninitialized data.
>  unsafe impl AsBytes for GspArgumentsCached {}
> =20
> +/// On Turing and GA100, the entries in the `LibosMemoryRegionInitArgume=
nt`
> +/// must all be a multiple of GSP_PAGE_SIZE in size, so add padding to f=
orce it
> +/// to that size.
> +#[repr(C)]
> +pub(crate) struct GspArgumentsAligned {

Hi Timir,

This is not "aligned" to GSP_PAGE_SIZE, but rather just "padded" to
GSP_PAGE_SIZE, so calling it `GspArgumentsAligned` would be a misnomer.

`GspArgumentsPadded`, perhaps?

Best,
Gary

> +    pub(crate) inner: GspArgumentsCached,
> +    _padding: [u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_AR=
GUMENTS_CACHED>()],
> +}
> +
> +// SAFETY: Padding is explicit and will not contain uninitialized data.
> +unsafe impl AsBytes for GspArgumentsAligned {}
> +
>  // SAFETY: This struct only contains integer types for which all bit pat=
terns
>  // are valid.
> -unsafe impl FromBytes for GspArgumentsCached {}
> +unsafe impl FromBytes for GspArgumentsAligned {}
> =20
>  /// Init arguments for the message queue.
>  #[repr(transparent)]

