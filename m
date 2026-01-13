Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020090.outbound.protection.outlook.com [52.101.196.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FA92AD2B
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 01:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768266756; cv=fail; b=tm9G42R4kxvzjdcI7gPWHKJOhZ/9MbSvUC0gPnsGHCiwTuoIu1aa7Bm+S7h98sWofJxXals7lbt7ZJu2uFKq8ImIt1yPgiysAfj7a1BJn7I+/Iz9ppEn6x07+YcPq+rWcaa/uiybERhwIYXB8h/HjePYCgiNSlqvmJlOT+k5+Qk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768266756; c=relaxed/simple;
	bh=FDTYO4fq1FzW/sUUB3qeOCol/cadbG6ZQrLD6cPqCZU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=qWJ/mo8Haz6O4FcfUN7DKx0mWyJab67jE2vtpcUGJO2Ys4BorPr4Ev6h2USklqedjWh2qDr3ZWRWVSMBX/jNP9sxcNYN3LUuwIVImzZRpqf7ZMOfeblxxUe8z/4BWCU7/qvWPmxj3Tgjqeiajf64zofoYjhiRvoMfJYGy4gDuek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=wE0OCnx+; arc=fail smtp.client-ip=52.101.196.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="wE0OCnx+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knFlQUEWlqRA6vb0vNb6VRWOJoWS8WzFBP0GY0yxcmfOi+lieuLDS0w0e64gXq6trbFlUDkujn1zmWOpkWMs6rOaHeaggN0EEOkrQ4hFO08gNsLrnzpB2xukpZ+SZ4GnqiwtmgZ/vS6538+KYg9ZoM9opS6JKFvc1a0n+eE3g4hK2jDjVFXJjv9dLP+z7yMBpiogSqHlX5rfsueP51SPkNVSmY/j36A9W5WjbKhKjal3U7kz/xcL5fZbAZT7imVRnHtTGfRGi7O6zGj9VfjDZ5R5oM3K/GeCeJ7V03EPAofy139f2GH3wpXfnrT4QLznzaHdmIVALDu5AHrtGd02KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFR7/2g+4poGrZz3njdUMBWvjwkrGPc5U29erQtcMTQ=;
 b=Eyp1maoa8R5g+Sfg7iDmmHaa/0nGy2BdMGAdXfSSTN9I9JOYsvPwzNO7pWk6vYpMXADRI6LkNPooywD2cVqh7xh+6GYElb3GrJvDEGLCjoVz03L9GeLapom2AdLX6bra8YJTiNCrDtfGjRvFFvO0tyqkD4xpcfie5T4RaGCMT3Ec4piUEfpgRARnqYMoD/nVfXw6jT+0nnNuy6sWErZjM+h0Y5n6M/gYQeC6YIhQtcHI3kbg/hhy5OxQka8GqJsD7hcphnUikKapCX3W6xWLO0RdqiH+OVYHH1f2Ptpb/EYAruvp61UdRYOuRQNxAPDfHqR3xLe4AZqYqcgDo7IEvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFR7/2g+4poGrZz3njdUMBWvjwkrGPc5U29erQtcMTQ=;
 b=wE0OCnx+EJer0+YdhM6ftVkdfYq5muM08bzjWGcvlMAvtklTWXarw7kY/7Q9E0kLXBoMVyaLblPKiHfNKk2TsS8JmcxKDQcF2DEqAoNpz193QqIYN4qtjVetrmcptcnZKfYci6mIXk7okI42p9xuQoY3YhjlKyojak0hE3haLVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB5455.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:245::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 01:12:31 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 01:12:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 01:12:29 +0000
Message-Id: <DFN28YJ5LQ3K.LEWE16Z5EXYF@garyguo.net>
Cc: <boqun.feng@gmail.com>, <ojeda@kernel.org>, <peterz@infradead.org>,
 <will@kernel.org>, <a.hindborg@kernel.org>, <bjorn3_gh@protonmail.com>,
 <dakr@kernel.org>, <gary@garyguo.net>, <lossin@kernel.org>,
 <mark.rutland@arm.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] rust: sync: atomic: Add i32-backed Flag for
 atomic booleans
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>, <aliceryhl@google.com>
X-Mailer: aerc 0.21.0
References: <20260111050558.3147975-1-fujita.tomonori@gmail.com>
 <20260111050558.3147975-2-fujita.tomonori@gmail.com>
 <aWS8aPuBRTKIjTZu@google.com>
 <20260113.073003.1666900745205693004.fujita.tomonori@gmail.com>
In-Reply-To: <20260113.073003.1666900745205693004.fujita.tomonori@gmail.com>
X-ClientProxiedBy: LNXP265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB5455:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aecd48d-f239-44d6-5cd9-08de5240d315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2FWOHE3MkIxN1BQeTBXRU50ZXgwTG8wbE5oY0hPVm5OdzB2V2Vyc2NvSkZ6?=
 =?utf-8?B?R1FEaEdFNFlsUzF5cndXeWF5R3VBUm9GNC94eFcrUUlyM1lmVUxsbzgxdWxY?=
 =?utf-8?B?VVA3Q2wrd0hUWGMxR1duclBBVEVKekF1NVRCS0RJTDVYYXBkWURyajllL3R6?=
 =?utf-8?B?MkFHOHQ4dTZzK2w1d25KV0lMODFUVjlqVkljZEtjOEluVk5hYjNyZHR2Tk1R?=
 =?utf-8?B?R3dMc2tXVjkyMG5ETFhPUzNzaHRoTWg5TERYdEpwcmFqSHY0RWgwcXVEYjhT?=
 =?utf-8?B?MDNNbjJSNnVOYm0zWndXR0Q1TzY0YWduaE85K1Z4dXYwZVRGQmRTVkJydU9y?=
 =?utf-8?B?bnZobStZYVJHNFNLQXFvSXpDZlB2cDJKajJXc203VkVZWlZhQ3FHNEI3SEhZ?=
 =?utf-8?B?Nldlbk1MT0RDZjF4TlVUY0pkdlRtNVIxdVZrSXVuZEs3TjFnTGx3Ymx2d2Uw?=
 =?utf-8?B?MHIycU8vamluY2hNbERYcTdHUDhKKzdqeWVYNjNxV1NXVzc2N05qYXRELzZW?=
 =?utf-8?B?dG9YZWdYNHNBYzBiKzFZUXpCQjAremswdGlrNHRCbkJWUGFlOUFQT2l5M1lC?=
 =?utf-8?B?ZXpISXhpN3lmUWt2Z28vVmRQcWRON1JMLzRHeVB5NVM5QUVaT3l1MElPeU5Y?=
 =?utf-8?B?OGpnbTJ5WnV3QVFxRThTV24rOVM5bTNDMWxhLzVLM29zbVVHS3ZlM3VvS0Fp?=
 =?utf-8?B?dG40ZkdveTRaTVQ5bXl1clZHOFlDa2NIbXZVNHlkMFk3eE03QUR5eVhLeTRx?=
 =?utf-8?B?WkE4MkMwb2hyVi9JWmgwZU80bVl3bXVwQkNuU3M3b3A2aEtpeVFweURQK1U5?=
 =?utf-8?B?OE5OSGJSMjl4TXBvanoxZWFIZGFXdExXY0p6bDl4cDh3OWpiR0tnd2pZaTQr?=
 =?utf-8?B?d0M5SFdPY3RHcVBCU0tHaXYxRTdFOTFrRk14dzlMYkJjaDhCOHRtU09PSS8x?=
 =?utf-8?B?c2c3aXc4eXQxN1BSVXRJVXVncS9aUXA5TWg2ZytGZ2FwK2c0NExZNGxRb1Bp?=
 =?utf-8?B?ZmN1M213ekEwNlROWTd2cjJSbngwZC8vOHpSV0hldHRHUXlKRmY5cGNMU0o0?=
 =?utf-8?B?TDBQb2NmbTR4MjRXazlVY1F4bVg3UTNrQnlNOGVsSVNTdHh0Y1RMaDlIR3Zn?=
 =?utf-8?B?WDU1WEhmaFc4VjdvbkRXT2RveGtjbm9hR2xHZWEvVTNpV2NOcWlCNFBHR3J0?=
 =?utf-8?B?T0h6aE52b2JNYkc4TnZnZkpGTFgxcnVDdjJucVlUNWdHUGtmNDY2QVV3aDQr?=
 =?utf-8?B?TFJTWWprSE1Ra0xES3BNRFdjR3Rxc3F6MndJTGpyUlRpU1JPa3Z3dGVKMWpu?=
 =?utf-8?B?WHg1S2FYSW5RN2NEZ242S3lEWHJHZERNNWFtQ2xrdTFJTTNPelg3ak5vYVJI?=
 =?utf-8?B?d1oxWjVEMGRhWGE0VlV2MHYvcEwvUU1UeFIrNHA1bWZONE1wRTZzVXN2emhM?=
 =?utf-8?B?US9iSzlnQWJWL0EvTkpVMTZlb0JVbDZhYnpLTkJTOXc3UXVnd1pWUHZFMTBE?=
 =?utf-8?B?cXBVQm9wWFJHYjlFVnplRVNwNUtvMHUvS0lUNW81Q1RsVVhLSXJyWWE5LzAr?=
 =?utf-8?B?WThoalRSejNLNmQ3ckx0MnM3K1UrVGxmRFpDYm1RNDl1LzBRMitJamdhZUd6?=
 =?utf-8?B?WkJWU3V3K0JGakE3TXdwUE5RK08rS0xPcVE2OG5zSDNsdXNuUHQwTFgwNFFr?=
 =?utf-8?B?dVhVb0xRQmpvRm9uR1VIWkNiMXdaZmJjcmFnaytHMVEzYkErN3gwL3ZmUEFy?=
 =?utf-8?B?aTFQNC90bGFvbTc4YUZvNUtFZTBBYmR1NlYveGhENlU0VUp5RHFJNThsVmhP?=
 =?utf-8?B?endXSkZpb0pvVysyT1VwcjlveU95VGRJQ2pqc0ZnSDRaWjJsaGtDRy9MYXEv?=
 =?utf-8?B?UEJ5TTZpNnhNaHFxTzFBRldyeUVaR3JoSUs3dGhHUjdXMVdaYjFZeXNXRkZz?=
 =?utf-8?Q?oq4cZVt7wbiT36+WC0ujjRJOL9862N4V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M25LdVdTbEFyK25EQlI4TDBDZEF0STUxQmdCWjE3TmVDczA0UWp1aTI4akln?=
 =?utf-8?B?VE1aVkFPTzliTVRjZi9rTnFTZVJpSWMxaVFvT0NTVkRBNFlDQkdhc2l6Tkcr?=
 =?utf-8?B?aVFFd0xHM3NycmdGR2U1R3NmWEVrYWZHUk5ucmczbnhGTzkwY3VydVdmT1g2?=
 =?utf-8?B?V3gzaXI3enY4QmIvSUNIWmN4U2dYMStDYWc4SkxsS0FXbWZIcjhvVEZYMkxr?=
 =?utf-8?B?MFhTU3h6WDg5a3NZd2l1elhnMmR2T0ZPYlZvbS9jVFRCbUJtMHRpbmEvUFgy?=
 =?utf-8?B?emRSMVJUUmVPV0N0ek9leUZtVmQ0U1QxaVhpVmVsSlpLRWVZTWVUdkxuNjJE?=
 =?utf-8?B?K0tJcmpoY2JtV09KOWdJYjdTemtPbGFjbldSMEROeURZRkpDTFZmQjZwOVJR?=
 =?utf-8?B?MU8xajJBT2NKQ1pINFEvN0RubmMzelZzcUQ0U29hZVhBL1hlb0pIZUFyRDhI?=
 =?utf-8?B?dk8xSGxLSWhVZDQyZmV0ZHpzWTBiMS9RVWIwbEtjd0VWejlPOXNNTzYrZ2Fi?=
 =?utf-8?B?N09PVENlY2k0dll5ZktNWDJoSlhLNE9ob1ZQK05yRzlONWc3RzVuMGxhQ254?=
 =?utf-8?B?V3NFOHdSaEZGamJTTkY1RithYlMwQ09qa0w4TDljVUR4SS9pNEFTV2FIWVR5?=
 =?utf-8?B?UXB5cmVCcllybUdzYUR5TUhyVU1GNHdSUFdzdkVSWVNDbHhkTUJlblRTeFU1?=
 =?utf-8?B?cGNBdnU3Z0pwY1Z1aWhIU3NMWklVQm80VEhKU1ZtS1Vxc1hkSndKaS95cHdl?=
 =?utf-8?B?Wkl1aTNFQllFUytDRzg1NDJaTjQrdm1CNng1TnhyYmowYm9McFVJeUg3K05i?=
 =?utf-8?B?cmE0UG5DKzIyOW5FeDhrS1FFRUpyaFZTcUV5OHJHMmNXZFdkNTdmMmtVVkZs?=
 =?utf-8?B?OGh5ZE1lVHNzS0ZPM1RQanEwTVZVZkJjbUpFUEFDR2t3UnRwK1BBQVJ1R1Q0?=
 =?utf-8?B?bkV1eWcwNjJQdzBhRlgvSVU3UElSZXBQM3RyVWJRRzVySy9tL09OUUlMRzM4?=
 =?utf-8?B?cWxBbStIMERGWWovWWtCSUJhaFlHUGhpQ3JISXkyb2M3QlFzQWxxZ2dKSWRN?=
 =?utf-8?B?VlFPY2w1UTBsQ2ZOK2NEWE5KSFhwUE4rcmNIbDEwVnVGOGZ4aFlUM29kUzQx?=
 =?utf-8?B?SnRCZ0RKUUcyZXJBYmYyK0M5UEIrdnltcEg4OW80QVNXdEFFUTMvZXd5bFlh?=
 =?utf-8?B?TVZkbkkzWXYzaG1QQTVCR0NveDJHd05ldmdLVlR5emc4Q3NqR3VqY295UGJM?=
 =?utf-8?B?cGxSVlBTVFZ2YUZZSi9CM1JjVXBCYmZOYXp1M3I5eVRpazZ4LytXb2t6cmhL?=
 =?utf-8?B?bzBTbXdmeTVSQTFtbDVKcCtiRWdxK3pPaWJzZjdBYW5ldGFnZWhXcmVkaVNR?=
 =?utf-8?B?VEFNMG9wYmRYc1VQMVBtQ3hZaWlwWkFBSG1Cb2NUSWkvL3lNRkFxd3dJYWZp?=
 =?utf-8?B?Qy9ZS2YvM3JVWU1hYXZXUVVSV01ZK2VwUjJSNmFEWmxHNXdYYkhZQThXVTNO?=
 =?utf-8?B?SFovTllYNjZ2TUhDcG8zK2VrQmlrZEIxbE0vNDNlYkF2MUFPYXlkR3lJQ3NH?=
 =?utf-8?B?bzlmS0Zla2ovSDBRNmZreXFqTnUwSXNNeUViWm82QjlrOU13elM4elB3RGdF?=
 =?utf-8?B?MFdzL1JiZTN6K1hRVnJBR0kwQzI3SDZqSzY2Y0dtck1RV3lSakh6OWtLM0NS?=
 =?utf-8?B?S0hsdC9HUlZ5dWZxUG9IL2hGaWRnaGlzUFA0VXBya0tsNk85M09MTSs2ZE1j?=
 =?utf-8?B?M0FnYTVzcjluOTQ4VVcwWEhhUUxxcHFRV2JnZDR2WXRzdkRSdGtOaWZESllE?=
 =?utf-8?B?NFZQR3pVZDlZSk9TWXRET2Jlc0k0eU0wOVVFbmlwYVZtU09ZcE40K2d4RkRF?=
 =?utf-8?B?Tmp6VWVUamVEU2NvMTNZc2xyQkhDUEN4QzhiRzhwRkxCZ01jcTVTL252YlBs?=
 =?utf-8?B?NWduaVFyWEFCclppR01lQWxMb0xaRmJ3bnI4Skd5Z3RpR0diVW5xT0ZiWk1O?=
 =?utf-8?B?R3k1U0hJV0F1S0lKNjZ4dzFXMHJ2ZHM0bUYxQWp3YWhoTGhJdFVZSTNQT2x6?=
 =?utf-8?B?aGczUXUxNmk0dEo4VFg1Y0VzVHJPbkphOFFlTG9weERKdDN0SHlLR0M1K2FE?=
 =?utf-8?B?UXJQeDY3a3ZZdXlCK25ldzJCUGpqZ3ZBQUxKYWlqV3RVZXNIcEdSZ1J0QVlp?=
 =?utf-8?B?bVoyWkRLSmhiQ2l5ZUIrOU1adHk5QTIxaWVzeVNpaWtleG52VXJPVjdxVno2?=
 =?utf-8?B?bUwyUmliVEw3OXdBdFN5RWpCVk1xTDIwdHRPS2kwQUJNRDUzODMwTk1uQTZs?=
 =?utf-8?B?c0YzOTMvc3ZiMFhneEM4cVZQVURYK1RPQTFhM3NOUHA1ajFIL016dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aecd48d-f239-44d6-5cd9-08de5240d315
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 01:12:30.7017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Yp1Y476icbABLyxkZxpRfIUWtG1HLJbsxT/ule/gacMzZRlHnkMEzdR4V83H+o8RHUfnZGAZ7rdyf/1d5zl1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5455

On Mon Jan 12, 2026 at 10:30 PM GMT, FUJITA Tomonori wrote:
> On Mon, 12 Jan 2026 09:18:32 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
>> On Sun, Jan 11, 2026 at 02:05:57PM +0900, FUJITA Tomonori wrote:
>>> Add a new Flag enum (Clear/Set) and implement AtomicType for it, so
>>> users can use Atomic<Flag> for boolean flags.
>>>=20
>>> The backing integer type is an implementation detail; it is currently
>>> i32 but may change in the future.
>>>=20
>>> Document when Atomic<Flag> is generally preferable to Atomic<bool>: in
>>> particular, when RMW operations such as xchg()/cmpxchg() may be used
>>> and minimizing memory usage is not the top priority. On some
>>> architectures without byte-sized RMW instructions, Atomic<bool> can be
>>> slower for RMW operations.
>>>=20
>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>> ---
>>>  rust/kernel/sync/atomic.rs | 56 ++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 56 insertions(+)
>>>=20
>>> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
>>> index ca9cab77abf0..473d3c07e234 100644
>>> --- a/rust/kernel/sync/atomic.rs
>>> +++ b/rust/kernel/sync/atomic.rs
>>> @@ -566,3 +566,59 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering=
>(&self, v: Rhs, _: Ordering)
>>>          unsafe { from_repr(ret) }
>>>      }
>>>  }
>>> +
>>> +/// An atomic flag type intended to be backed by a performance-optimal=
 integer type.
>>> +///
>>> +/// The backing integer type is an implementation detail; it is curren=
tly [`i32`] but may change
>>> +/// in the future.
>>=20
>> How is it, could we make it u8 on some architectures without penalty,
>> and have it be i32 on others? Or is i32 better always.
>
> Does the following look reasonable?
>
> #[derive(Clone, Copy, PartialEq, Eq)]
> #[cfg_attr(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64), repr=
(i8))]
> #[cfg_attr(
>     not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)),
>     repr(i32)
> )]

The arch list looks correct to me.

> pub enum Flag {
>     /// The flag is clear.
>     Clear =3D 0,
>     /// The flag is set.
>     Set =3D 1,
> }
>
> #[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
> type FlagRepr =3D i8;
> #[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
> type FlagRepr =3D i32;

This doesn't need an extra typedef. You can just put `#[cfg]` on the associ=
ate
item below.

Best,
Gary

>
> unsafe impl AtomicType for Flag {
>     type Repr =3D FlagRepr;
> }

