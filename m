Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022090.outbound.protection.outlook.com [52.101.96.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B0B331A70
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 11:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769427721; cv=fail; b=IsIQ5uTkej5OeQXvREn9WMs5Bx7FPcOKUzFOSHg0sx0boxzuoMfWe4vOoAsbdsRH1eNIxj4gfJpYyA4j3/m/yymgGd6tszXrd/BWINRBNoiouhgJKrCeIXNghLW7RESNzHudMmJ5/VKS4dNab+hpROElw9R6NtxYVIR6B2GATG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769427721; c=relaxed/simple;
	bh=oqfCeGzXjPMP671JNQiIUlZ+31XDh1Wrq3FoSEScTfc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=dZfPIvYQ2v425Ngn9mAlyo4PhNprHewhCJw7W9Z2WYmpQPceouYiLf9Z9hS3CYzSB12oJYkh9pAXRj4YPbiAf3TNCYIg+N+hDNTWW4QHhBxKimJmbeObRBl0A7kjuOzJAzjBrcW3vUyeKQzIzMQamUIvagVChaDQBPCHir15j/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=TEqF8eOF; arc=fail smtp.client-ip=52.101.96.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="TEqF8eOF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOcYqPo6wvdNnEVhONTLmB1b8lZtAmrwEfJnK0EBWJMsjejJSxX099Ic6ob/w7PANlGMgWOwt11lsXqQeuedd4ykUn9EuYkayM9LxTTxTs4rugugPAZUjz9ebkPEgFF2PZ2o60WPI55FmcgE3xBwg3JOBVyjHQtu9ljLPNEt9zRTd1XYuzaPRFotvtVfYS57a4WqJicGZsD5EuphfMjG9ZeAu6M6+el4tYa3oJfevW4vy05JKSz7uS8cdZKMuCM0OEbXwTCvAOy8GYyRznL5go2SU5yq42RmkQypbyxrlt3PDG5F/9Nkc6AldVO4WpxeIpOXKlgr3jJ2geh/Nelbaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icbVQ1kfe/UzhYZrevPXjA+dQ2s//EkxrrbZF821xSE=;
 b=rHBHcwRBZoYPXOAtYQ726W6LY/k/TPYt2NQtNbpSgX73YFsz59+L9IpAWE7pUiJ4+q666ayeM+OluOJwyZOlwamcC/ISOqzjSteBUZW0WGNR3MwAnPBw5g+pQS8WUipGh1Q25pCMvm1VAFNDTtyTBLpGpv4Tb/oLRvMujuxLY5WWQvdlCRtpAUuUjQcjyQI5xBCVZD1eOLMDHXmDf3Ezm3xqDeVLdL6KTu2/WEegAjn13HnkmZFahU4sQBYbLmb3pvaNff6iaqwdXvUD9v1Ep+zV6dnkGEHHBeiKZBlglFUKWHsQvNncl0Au33pnYlg/zaXsj9DP6+ZaRkOvMm3dDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icbVQ1kfe/UzhYZrevPXjA+dQ2s//EkxrrbZF821xSE=;
 b=TEqF8eOFd4ebwkSl21aUfK583UYAEPcbsxgq4OdUDtCtEPLXtsQWqzFh9rod6FLBdH1ALTy7DBurcXOiJpmJR9QVmUgHYiSjJLcWPaEKefAA4JXvi1vkiiU/fdAEsGWcMOJe/Mf+55z46eZJvI1lnc3qcolAs+FPVPM2L9QH1vs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2743.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:89::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 11:41:55 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 11:41:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 11:41:54 +0000
Message-Id: <DFYHRY9IB2ZP.2Z70E6XMBMEL3@garyguo.net>
Cc: <a.hindborg@kernel.org>, <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <lossin@kernel.org>, <mark.rutland@arm.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] rust: add AtomicFlag::get_mut
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>, <boqun.feng@gmail.com>,
 <ojeda@kernel.org>, <peterz@infradead.org>, <will@kernel.org>,
 <gary@garyguo.net>, <aliceryhl@google.com>
X-Mailer: aerc 0.21.0
References: <20260126081013.3616346-1-fujita.tomonori@gmail.com>
In-Reply-To: <20260126081013.3616346-1-fujita.tomonori@gmail.com>
X-ClientProxiedBy: LO4P123CA0149.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2743:EE_
X-MS-Office365-Filtering-Correlation-Id: caf60655-13bf-45b4-1913-08de5ccfe7a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmhhY0owZzltcmxCK2pWVmFiQXNKSXNJdE45NXNuQWt2TElWWGEzQkhxYnhS?=
 =?utf-8?B?TFEyZ3pFTGNYaHZ0MGljQWZHSllqSWZmdXhySy84Tk45dmpocmE5ZTFoZnVS?=
 =?utf-8?B?R1A4VkFtYlNKSXF4eTFTWjFueExoUURKOG1qMXk5TEZrWGQ2THpPWU94VmVH?=
 =?utf-8?B?K2pVc2hrV3UvN0wxYTJCVHpXS3Y5clpMUUg2cGxLc1A3eXJ4dUhYK0w2UnFO?=
 =?utf-8?B?RWppZGR4WC9WS0hldktuUW5acDZZeXRtNGpFYi9JYUQwWkxCZG53MW5CUGZF?=
 =?utf-8?B?bzVNT3E3Y3h3dmpKNHh4RTlnZFgvU1VXRVZpdWNqU0FYRVZlK081YURWRXp5?=
 =?utf-8?B?Rm1vMGVUU1MxZVI2N0tpMlNjOXZaU0xCY1lQZU1xQ1pwLzliSXNoZE0xTEp0?=
 =?utf-8?B?bDFwRUNPdUxhcndhVlIwdVF2T3JVQVgrUUY4YlNKeGMxdXBLUmN4QmdiTFFX?=
 =?utf-8?B?ZXp1amRzZTFMVkYvWG5NVXdrY2pSUXZFTVZjclhvY1BWK0VKQTJTRUJTMTc5?=
 =?utf-8?B?VUFCMXZyWGJBSHM2SGpSd1FGWkZOMWFXOHhveEtxZFBZOFVaYzZKYU4zWDQv?=
 =?utf-8?B?aFNibFBzNFVSRWRuTkg5dC9ubW5PWVk3Tnd1a0paU3R3aDB6SVRTLzBOaWFr?=
 =?utf-8?B?U3pnS0s1TDZnS2cyRFU3SVc2dTBLWDRJSnQ5WE0zTzZoa1AzSWNua20yODhR?=
 =?utf-8?B?RzI0L09Jd2p5MVVOWXNBdlFrTVlmcWUrZTVJckZTeFMzSDBvV1V5eXd0c3RB?=
 =?utf-8?B?TytyRFpPWHd1MTk1SG0vYmNLQW9HbUtMWVIrcVRnYUx0ck5FM1JGZ1VUNklk?=
 =?utf-8?B?OFFsSTJBakNFTktxTlpaU2dDbmhhVnZHb29KemdFbG1Sb1JIclUzOWh4YVkx?=
 =?utf-8?B?TkNKZnp3SGVDaU5rYU5uRllWODBLdnQ4TFI5R0RUd3FNL2JzTHR0bGE5dE5Z?=
 =?utf-8?B?Z1dOU1d2Y1BncktYeVFqY1R0SDcyM1lXS0NOQmZndWxvek9raTNVaCtWUVR6?=
 =?utf-8?B?ampkdmtwdWFYOGp2Wm51Z0Y3aTRTYUEybWZZczU1VDU1Z1psWDhtZFVJeHU1?=
 =?utf-8?B?STIxYVB5dXNzVW9GSDgyWE5vd2tjREdnM3BXQTM2YmlDTHB6M1pEUHhNclJV?=
 =?utf-8?B?SVg5SVRUTXpZNnJvQnBkQVBEUVZPWEJIb3hWZ3VHdW5zVlViUnlxMjVibWhE?=
 =?utf-8?B?Mm9WMi9OTnBSU0lGTUt0YmN4QVhITWdzdmNIS3pLL2tjK2J5SEM1UFB1bElU?=
 =?utf-8?B?bzY3T3R3QzhtTDJWWExOVE5PQWJJQVRsVXo4RjZRM0NUcFpaU29WOWt4V09i?=
 =?utf-8?B?M0szWFM2Ui93ZitTNUo0MDQ2TVM5NjZtazhjRk1wbXMvTnFuY2cyVjlDWGZ1?=
 =?utf-8?B?OURNaDRYZEdPMVVHQ05hdFpEWmVNdGRIeXBORjNQbjU2T1VUMXoveDRFZXhz?=
 =?utf-8?B?bG9iSjRXeVllcEFYQ2syYTNzTEFIL1R0TnMwM1N6K3lsUTFLZnB1czFtWEVY?=
 =?utf-8?B?TVhKZlBoMFVrbDlkTUNjV01Pa2hwV1RwVTNqRHpObHV2NGNZc3NKQnJBVlcz?=
 =?utf-8?B?RFZBZGszeFN5ekRKWkxDT2lJRmZrZ1dNNVpGaWhiTEJnSU8wcGk2T013bSs5?=
 =?utf-8?B?QnBsN3hvSXFyNlI4WFNzSC9qWnB5OVZuME5LaDFKdnJOaEZDT1JsTCtJemZK?=
 =?utf-8?B?ckVCamE2M2xMMDRNR204LzN6eEZjWXV0RlpWV1lGRTBncnFsTWNQNGtvcEJ5?=
 =?utf-8?B?UXM1Y2pZNzlWUzFpNDEzdy83VHFZTFNCRDZ2K29MWDU1SHJuK2ZKb0I2QWRU?=
 =?utf-8?B?RnM0WS9iSG5HR1FBYVFZVmI3VHN5dXRRd2J5WnJIUUQrbUU3WUd5bm4zV0hK?=
 =?utf-8?B?K2hoOXBLU0U2b0prTzNON0NRZC9KTUFvOERTMXo1emFHRHBSMHBqZk9zUTc3?=
 =?utf-8?B?SkEzZURGTDVySitXWHFZam9lZU5PS3pBYmVTM1ZJVGlZMkZuSTlJdUJKc21S?=
 =?utf-8?B?NHlrbmp1K2dBcFNlMEd2djI3eTB5bGVYOGVMYVAxd2M4aUd2Q1MyOGtoUkxT?=
 =?utf-8?B?dEsyZmRMcHlaNmZPRmI5Q1d3WnYxWXNaM08vMDdvUjQ0cWhPRW1XRE5NcThj?=
 =?utf-8?Q?JWJ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmZsWjNqSmFpUnRCNmhZVU95Y0oxOFRlaXhia1hGSUVReGNhdG84UWVDOElF?=
 =?utf-8?B?VHBIbXM5OGlGVVhsNFpNbFkyRldpaTA2ekliSzNiRGFIQlgvbXVIUFZJSmtl?=
 =?utf-8?B?TjU2b3FjTndZdkRQZGhaNDF1ZVJpc0hRL3RzOW9wQ2d5MTZOUythMXVhcnJ6?=
 =?utf-8?B?VjNPZ0QxTk5MZW9DSFN0S24rdmNRN3lJTDlhMFlqWXVMRzVtSGthM1l6UTBD?=
 =?utf-8?B?YmFWRkNKeTNiY0FNZ2hWb0M1TnlyY28rdVY5Ly9NSmN6T3NhVW5XQTRUc1dq?=
 =?utf-8?B?alo3SHBhQnpNOTg0a1gwMGFCV2xZeG9hOS8rNGtsQjFlTTBpRWN6M3FYL0Vz?=
 =?utf-8?B?b1lSenpRSHJMSFlGU3h4MjZNSVZweS82UkdtblBjZG1nczYweGlmNlNPb0w1?=
 =?utf-8?B?UHdWTEpHZlZYUmZzZ25KOTNmcTNHd3ByWVVPK0hQc1puSUxXQ0t0S0Q4UERm?=
 =?utf-8?B?TDlnNkEyZ2VjYjlNMi9ISUZrcDcrbmdIcU5nNDBWdGliU1dweWxJYXdQWGtI?=
 =?utf-8?B?b2FLWFZCVUpQNjhFYkltNi9kWTVuR3M2T2RXT1RCS2dNVHBXL3NkUjJjNFAx?=
 =?utf-8?B?d3BnSmlkQkRrSjA1alRjNnhWRGVUK3NVTVVEbU5rMHZLcmlHQyswWDJoZGI2?=
 =?utf-8?B?RHVrSG8vaXRQdWY2UXZOVnliaFhaL1VyOUtjOGNKa0xTK3BuM1lRdTd4azUr?=
 =?utf-8?B?YUNrbk03dHRRdkg4NXBZSWVZTzJqV1cxWUZXMlNjbU4xRDFxbjYwUHBLenhy?=
 =?utf-8?B?bzlEMWNPc0wrU2FHVjM2ODYwUmRidUJqYzlqdHkyb1RGQ25ZMlQyZEhCcFVa?=
 =?utf-8?B?aVU0WE1veFVaaTlndTMwOXJzZWlxVXg4RlVmZGh1S1lxQi9WZ203Z0I4bnpL?=
 =?utf-8?B?L0RsZmNLNE9lcS96VGQ0STg1Z2x5amtnR2VYRXQzck9RNXdEaERtNFhkUWta?=
 =?utf-8?B?bjFQWERVZHdZWGZHU1hZU09tTWd1eWtMeWZHcStIdEV3VnZGbUVRVG9UUk54?=
 =?utf-8?B?dDIvMWoyNVVhQXM1cm5MdENhOHdaeURNY3Foc0NnNkZvOWRSZ2pwdUdsaWdY?=
 =?utf-8?B?QUliOTJseXZZUnVobXpJWjg2cERLRVAvb2k3TGRVSFFia3ZKYmt4ZElkTXF2?=
 =?utf-8?B?ckhMdTNwZVk4SThrQW9QWGhQUDZmNkNXYWk3ZUlJcTh0S3dFV0FRbUZFYk9E?=
 =?utf-8?B?MTNCRnVaWDZ6ZHYyb20yRHczaFZSaHZESmkyN1lyYjcyU3VSRnVjRTFXcVFF?=
 =?utf-8?B?RHVTcC9sL3VkajF4WGpsVW9UZDJLYUZseEx5NVdwQ2w0ajNuRWJreWRGa1dW?=
 =?utf-8?B?UlZibTQyVnNKS2EySVVjV2VwQ1R4OFdMYmtHNlBBSGg1NVgxWnVQWWI1WnNN?=
 =?utf-8?B?R0Rtd0s2c2dwM3BadlRFNDU0VGJmakd3bno4NCtHVUo1YnJMRzY2SHQ1dnhD?=
 =?utf-8?B?UzRjLy9OSmErOC91VW9aQ2RyaEFsVkF0SlYreFEvZGpUbTllTzUwN1VWaGZI?=
 =?utf-8?B?d2ZBWXdUR3l4MjRrZ1pZbVBPWWI1cjlDY2VtWndoTnp3eVMzZzFxNU5ONGJo?=
 =?utf-8?B?TGtJUFpuU0tHRTJIL2x0NHdRZ3BLMjd3dFkwblpOaFFQc3YyY3BTaUJOcm9i?=
 =?utf-8?B?MGhVMVRvTkZRQlJCaVlvTkVtdGpkVnFBZzhWdnRhdWdBeDNHMERXcVBxVmFy?=
 =?utf-8?B?aHF6YUpWYXBEN2NjUGR1aHpqbjQzQzRjWDRIMDFJWTE4WkdSbi9QdHlxRzBv?=
 =?utf-8?B?OEJiZVEzOURMblNuNENONzFaK0NjY3YwUGdVSE9YcHFXcVJnL0lnQ1FkNVhn?=
 =?utf-8?B?ZkV6TDYwNm40OXljWHJGRTdFRFUzTjNkV011V2pBbDNWemZTRzVGOG9YMFRm?=
 =?utf-8?B?TXp6alh5VEhydkFPSWNxZ3VTUXhYRlk2VHAxVUtYQ1dQZWxSV1ZjVk55UXJr?=
 =?utf-8?B?NGFKTktMNFlvaDJrUWVVK01KL0J2ZHlvY1NFUWNuT25pU05DV0RiRWx2SUNP?=
 =?utf-8?B?WkNVd3JCcjk5cldyMXBab1pZOVpVYXhoSHN1TDRobm8yRzZrZkJyRE1jRHdS?=
 =?utf-8?B?bDU2clRTektCZjJVanFkbWpiSjBpSnAzOTJ2VU5LZGp4UnBBWmxnVmpFWm1S?=
 =?utf-8?B?bTRJTVlIa0V1cWl5cE83cFZWQ21lcW9hbWxiOW9uUnczT3RPdzFNT0FEcmM1?=
 =?utf-8?B?dUFmUU1EREc2YjBPeDdOa0FORkVWVFRZZkY1YkVmSDFrNXRqWFhxNGtSbUZ0?=
 =?utf-8?B?Rzk1VVNWaVdpbloyVmxNcG1BQ04vQjd0Si9icnliSUF6WTMyZThReDN3T3k4?=
 =?utf-8?Q?Jm+MVNHwA10B2GltTM?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: caf60655-13bf-45b4-1913-08de5ccfe7a9
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 11:41:54.8840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyCU++fZRrTKnhBYLlyEBwaCsx0HIZLAPn3bACDYDzaJrV0/HdwxgLRxY4XIwq2+ARWujjTh21EpyisVvKt+lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2743

On Mon Jan 26, 2026 at 8:10 AM GMT, FUJITA Tomonori wrote:
> This series adds AtomicFlag::get_mut to expose a bool API under exclusive
> access, and switches the list atomic tracker to use AtomicFlag.
>
> v2:
> - Add AtomicFlag::get_mut()
> - Make AtomicTracker use get_mut()
> v1: https://lore.kernel.org/rust-for-linux/20260119231757.3460885-1-fujit=
a.tomonori@gmail.com/
>
> FUJITA Tomonori (2):
>   rust: sync: atomic: Add AtomicFlag::get_mut
>   rust: list: Use AtomicFlag in AtomicTracker

Hi Fujita,

I've not had the first patch in my inbox. It appears not to land in
lore.kernel.org either.

Best,
Gary

>
>  rust/kernel/list/arc.rs              |  8 ++++----
>  rust/kernel/sync/atomic.rs           | 20 ++++++++++++++++++++
>  rust/kernel/sync/atomic/predefine.rs | 17 +++++++++++++++++
>  3 files changed, 41 insertions(+), 4 deletions(-)
>
>
> base-commit: ed45fc4e7712dabca517bee9f73b91e7da0030a6

