Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020092.outbound.protection.outlook.com [52.101.196.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65643CF02B
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Apr 2026 20:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776716855; cv=fail; b=iZxeujSr4UGviPH4W//87ZfYZPWxpzLUKy1rwq6LBfEr/phbkrZjwYxunSmdfhxaA/Aa4EpD6qdNsT5lPnZN5BB2AhKFOPMp9c1jdCRK5OzUfFTI+5oSInhFZHGJD6wMzMav4/WD51YVjZh90hRsnA4RuxvDFizuKA6LkYk0iH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776716855; c=relaxed/simple;
	bh=I71sgQeiXtVoddehEpEsToMOgG6noz2CLeqONCOsZP0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=XHE8hzQxdSukHrEavxgME/2QE+cWlxDQ0vOXRRIN/5BZTRrC5pBbPjtAVxJUeymybacGVR8qpuHynOvQcXTaJhUsp4BPfcWpcO1O8PGxcoKG9bCDyRy4hwV89Zf5LE+o5R4eW+AdMKq4+3lnRq3x28PRTpoHy8xwV/DCLdvlTf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=gABqEIFj; arc=fail smtp.client-ip=52.101.196.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="gABqEIFj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2RWPzSZYY7h+TTxF2sEzAaIkSnfbIWUKUjB6Krxr2O7L1uH/BR72KnJ2bOLQqw0KN+Nr45KmRmuS/6fOrlkvmw1l0FVXAlyH3bWUwKApgTNM00d1j6xBx8zVWWVz/ISWSj7O4BaYF/bsWoxs0uFbA9Vk8vD+m0TMBShyYHLpqnfcvUXySbVIBI57B/tZUugydVpsQxJ11+UleTe9/mTs6R07VaoJmNJLYtm8FiZH1m794sVTapB1B71oTL4kMrxiMYqSx0F00e29lNrqJXY265hpWFCAMeT/wH9Ag7/54BE/tJMh15CKYUH/nMdpW8LbweMx/eryLTHYd23RqjuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDErGW8q06yFYaMl9m5EHdT6PI4bdHO5xlDZYvk8JIg=;
 b=xfxboY2PXdqQXfbwaUTEuiMTcsKxqzoIIu+EbVF01hQ1gcFtOkKgU74PomvA5YDKadiGjgmlVS6iz3LBACEXscAFMLLzN1zCz6ez5jID6rzbFKeto6pHmYBpjf+OLTUkoOFhfPtLRvs2ca0har8kQ2QO3DqgefujLc7zMHxUicgrGbohFMHjhACwm2sZkImSWVxOlxY333nWj/JfcmYWc1zazxijp5Iu3Xd2bX4++AKA73NGrVJ2N1AiTVcrbQFKx/IhS8Ug2ePAXLzkbDMdKp4SboXsFS8Q9Dbxt6/eK6J8vDKXkkqOnvac8NXoXk6Fb5pTLI//OS3z+neP9evOVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDErGW8q06yFYaMl9m5EHdT6PI4bdHO5xlDZYvk8JIg=;
 b=gABqEIFj7a/oEfbSL08aeocgZ5jwwVtQyjC00JtGPbNZFNMWi4U5hDIU80u6PmOBDhiXeJw9qZ5/nt2sYlIJCrG+evOZrti8hDjHo5fjWBO7bUhxAyYIZsMd4dR6qiDf5yUtsbZ3HHVKKqfnLnlFRcGlfEJwVxyCS52usjyJpYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB5496.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 20:27:29 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 20:27:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 21:27:29 +0100
Message-Id: <DHY9K4KOTNP3.1DU2132JVNLJU@garyguo.net>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "Eliot Courtney" <ecourtney@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260417191359.1307434-1-ttabi@nvidia.com>
 <20260417191359.1307434-5-ttabi@nvidia.com>
 <DHXE2MBVLV2S.3AUM31VR2XC0D@garyguo.net>
 <DHXLC2ZLHLWG.1Z3SQHOEYMYH3@nvidia.com>
 <DHXWPED46OYC.U21Z21V0PM3C@garyguo.net>
 <DHXZULC2O3CE.2PNA9P12ZPC2B@nvidia.com>
 <a2bb46f8cb312643ea5997ab4b58042850554a0c.camel@nvidia.com>
In-Reply-To: <a2bb46f8cb312643ea5997ab4b58042850554a0c.camel@nvidia.com>
X-ClientProxiedBy: LO4P123CA0459.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB5496:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ede838d-0673-4ef0-3a0e-08de9f1b3e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JJBY8DbZSNnVlbdFfObF3oJS4KwllJSjnIfdzOXhNXFOsV6W3IaqDx+x4BWv3Tdf6OV+pI1rr9WZABkUat/vImAZM5J7eKKMzqpF4W+4Fh2sLjX5xwYa8zjMa3/D1oSe0641GGFBZZR9rns/sFq38SgihxwHB9tNRxqiwEltZpZFO036izOdMn319KEDLxPv7LAHrKstpgTFnSDVqaRH6E0b1FqGvNMhZ1KGjPlQ41GdcjqyXGDzUm2pGzYMZwJ0ru5yFOdHEl0d4QkAtS2JpPoZNNL5ATmUxcgNtsSixd4AGs5NQhZvOl97LZJRFSskZ63vbAefIAVjsqDcaYQwdGtSiYIsV9JBd8Gss3Yn7vR+VKkTx9phhALY9SQwfYABDwn88lBV56DxVxwvM/e/P7fLQ0FlueqQWiWhTy67Og5Y4IQ9w3ebY2xlOWhALeiLXiqXyvRlc6wOBYPCgOvKj98XBZ01QRhm+9hbRZcNt5jnI891iHril/hT4If05GUMP9KrtVAMeeMgfuY+oKesY7MnZUVOmgojRfxLMPNd2IWdPzcoYshNfYr6GkhKi1GQmFOQga4wd6eA8ujnIwi1u0C05GZyUVODRSY0XY8nEGunqYi5OiM3wKGc6rgQ1o8XyGQJPLhpBVZxxZSvuPeMgMMnNaAzyviuKBlzUnZxU44MFXLevS5PNMCI46ePgtxVHCLU0KGlQVoDWnfoI4KYGx3kZ2Rzbcsr4/L0owHl5vM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mkhha3hQTzhuYmk0ckE3WHNWY2VDY0lFTzhZMGtoSFBjaU5DZThmeDliWjNS?=
 =?utf-8?B?bGR2U0szdjl1ZkZkNUFGWllLWUdUTUFPZDFhM2k3azE3WEN1VkZYR3JMcW1p?=
 =?utf-8?B?UWdadnN1SWk1S05ObU1Kd1BDelpGdE1LbWNScE1WNTVSMDRtVTBjOFYvQlEw?=
 =?utf-8?B?MmlURDBDRUUrTnpFV2l1anBVT1BMTXR0RlEzTWg5ZWwzSjBCRnljQzBoL3Rm?=
 =?utf-8?B?TmNBMFgwYTNrb1RvSEtySlYyNmNrTFZJeloxSUJWMGwwTmkwcDQwU3hDNWZz?=
 =?utf-8?B?U1BIU3AwRnlPeEFGWGZTYzd5RGp3QzdUbm02N3lkOTMrZ0pEam9jcG9YQkor?=
 =?utf-8?B?dHVkeGIyVWo1cjExNFRBRUVJWWhXeWo3bTdLS0lFMk1pOGp2T1FFMnRHZ01X?=
 =?utf-8?B?bnJ5bmNHR005NDZXSnVSNEV1VEN6blRBc1YzNHJ3S0I5QWkyeUo1TXpSMFIv?=
 =?utf-8?B?THpyUTU4L21EUkk5dG5MQnZBY0FHTWVJMUs0eDVVRUpySnVBaCsrTUJ4SWxy?=
 =?utf-8?B?K1ZlWjNpcTdHVWRxNjErMThBSmNzSnpPRE1xSU1CL1dLSGNwZkFmQmR4UWhB?=
 =?utf-8?B?ZlhLRUc4bVpaSllXcXNGUXJiTzdESUExSnhhQitxcHIzU0pBSG1md093bmMx?=
 =?utf-8?B?ODlGNVd1YXFLdE1vbUpHWkpZM2JLcDBWYXNJaGpLY3RnTjlLWW5VRVhHYWl5?=
 =?utf-8?B?YVlBZmgyL08vY0xmMWdaSnVhdHUyZmhxSFVVTDJWVWU2ZDR2dXdIb2huY1JT?=
 =?utf-8?B?Qk5aRGR2SHVPSmhqUWVzcXZ3dUgvV05DQkFqb0Q3cFEveVBPYWdmT1JkNjJ2?=
 =?utf-8?B?OWkvcG82QXpNOW5VZnNTNnpqdnlLUmJsdHN0MFkxU3BHWXgvVEhsNlNLdmti?=
 =?utf-8?B?eHhQT3k1VmxpQS9FOFZ0Zzk0MkloM1AyeWpqVDB3Q09QSzVibFBhNGlBMDcr?=
 =?utf-8?B?TmlQK2dKSzdHbEpqTXg1OGIxVDNFRUxybnVJRHdNUVZGaW8vK2FKdDFUOTFt?=
 =?utf-8?B?N3NJcm5xYWkyWDdvTUpnMFdUUnVCTk1RNWlhOXR2NVFhQmZibjFzNjk5aWhP?=
 =?utf-8?B?OFhqTDBkV0ZKTVJyakhZalZqbmFMT1NjY29uZy9FSnZ2ZDdlWGFDNjBGM1Z4?=
 =?utf-8?B?cEpBTE1SWXhZVFlJR2FLcmV4bTlFaUZRUnpvRjNqcm1WUFM5TzRNTDZnN0pp?=
 =?utf-8?B?ekhua1ErbWNlOFRoNGtwRWQzOTQveGozb0FoVUZHNGF1ZG9panA0SzNhcldX?=
 =?utf-8?B?UWIxdXNVTnp5L0M4VkZMMkFrU2tOSjIwc21TN1d6bDNVUXgzK05mK1hwNm5P?=
 =?utf-8?B?cDUxempGZHJQanZsaFRKbWszMVFydkIzUGxRc2h6aW10VEFkRkx6Ynd3M0l0?=
 =?utf-8?B?T3dnTjM0VDMwNGsvZHhnNVJ5RXRIT3FMUk1tbGVsZ0N6QmRKTGRDUEJyMERr?=
 =?utf-8?B?N2R2ZkwxbTdmWnkxcVRBeHVQRTc0cWk1d0tTcllUS1RZVWR6ekwrUWRpUi9C?=
 =?utf-8?B?c1U2Z1ppdG1FQTVhZ2ZwQzlmMUpQTTU5YXhKbEpBWUgyRURBSEJFZG1rYmRU?=
 =?utf-8?B?U0h3cVFlQnNWdm4rcTlvVlZ4elRXZExoeTlSN0VCeGpJTkZEM3hIRjRnRW5M?=
 =?utf-8?B?cERuVml4bEI1c3g2b3dGcGlwWW5WTlRRQ1lKU0QwbGovK0FwamJnUytHenJT?=
 =?utf-8?B?ejlnSHc4YUlscXdscDYvYndmbGhXWnFickFzd05ubGxaVldSd0grT3RiRHdJ?=
 =?utf-8?B?NEU3NjVia0NVYzF2SWphcVNwTm9Dc0t3NnZVN0JRaHJIUnZXalJvZUZnUlVW?=
 =?utf-8?B?WXJqR2xpdXFycmk0ZStZR0lPUGozZkVhcmpuWUJ1V01Fd1J0Y1dSYUdyQzN3?=
 =?utf-8?B?ZUpUV0NCYnhSNThpeVIycHBPR29YM0dDUm42L1NGY2Z3TW42ZXN1WC9PV0U4?=
 =?utf-8?B?Q2VSaTk1NzN2YVRHTjBGVU8vOFgvdFEzRTdRL2NoTHN0U2NOeiszT0NwR3ly?=
 =?utf-8?B?cmtBaGRaMnlFZGxFcnY3QXVDZVBISzhzOXN6cmhsb2pzMFI4aFZ1S3JEcStk?=
 =?utf-8?B?a2xoU3VhZWR2Rm5XdEhoVmhlQ1BMOC9YeEVyZEVzVCtwSUFPWm0zSGg3TmRQ?=
 =?utf-8?B?UHQ1WnJFWG1BNEJGYVlWb1llTGdwZ1FRa1d5WVcxbGdCVDZSd3ZqMlhsYjZu?=
 =?utf-8?B?VHVOT0xqeEhuek5jc1ZEMkQyMFZST2lWNkpQZE4yL0hzaXpqY2JUeVR0NGJQ?=
 =?utf-8?B?bytjRHo5SlBrNGp0Mlh5MXV1dmUwRGMyb0orSDJBQjh5Qk4zSGQ1VkhkL0d1?=
 =?utf-8?B?L0F3UFE5dFd4V25iQmJCOEkvbFRCQXRmMDJzMExpYkErdzFiOXBrdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ede838d-0673-4ef0-3a0e-08de9f1b3e86
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 20:27:29.6081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zU1Z2HmRXOf/TuXau94BQ5Ftn2I8LJR7R6fRqrYVFJLtFczIl4HJClHThJ81O0ymq1XPTsTWkB8qrVIQR3h75w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5496

On Mon Apr 20, 2026 at 6:51 PM BST, Timur Tabi wrote:
> On Mon, 2026-04-20 at 21:50 +0900, Alexandre Courbot wrote:
>> > Or better, use a boolean, I find Nouveau's C code clearer in this rega=
rd:
>> >=20
>> > =C2=A0=C2=A0=C2=A0=C2=A0 /*
>> > =C2=A0	 * Calculate FB layout. FRTS is a memory region created by the =
FWSEC-FRTS firmware.
>> > =C2=A0	 * FWSEC comes from VBIOS.=C2=A0 So on systems with no VBIOS (e=
.g. GA100), the FRTS does
>> > =C2=A0	 * not exist.=C2=A0 Therefore, use the existence of VBIOS to de=
termine whether to reserve
>> > =C2=A0	 * an FRTS region.
>> > =C2=A0	 */
>> > =C2=A0	gsp->fb.wpr2.frts.size =3D device->bios ? 0x100000 : 0;
>
> So first, this code in Nouveau is actually wrong, and I have a patchset p=
ending upstream that fixes
> it.  This is the new version:

Ah, I see, so this is what the "supports_display" refers to in the commit
message?

It's not instinctively the same concept in my mind, but it makes sense now =
you
explained it.

>
> 	gsp->fb.wpr2.frts.size =3D device->chipset =3D=3D 0x170 ? 0 : 0x100000;
>
> So this really needs to be a HAL-specific implementation.  For better or =
worse, we're actively
> trying to avoid code like this in Nova:
>
> 	if chipset is X or Y
> 	{
> 		// do this
> 	} else {
> 		// do that
> 	}
>
>> >=20
>> > so we could simiarly do
>> >=20
>> > =C2=A0=C2=A0=C2=A0=C2=A0 fn has_frts(&self) -> bool;
>> >=20
>> > Or
>> >=20
>> > =C2=A0=C2=A0=C2=A0=C2=A0 fn has_vbios(&self) -> bool;
>> >=20
>>=20
>> The boolean-based approach might make more sense if there is really no
>> other possible size for the FRTS (which the Nouveau code seems to
>> suggest). I'll let Timur answer that one.
>
> I think there is something that everyone needs to understand.  99% of thi=
s stuff is completely
> arbitrary.  Someone, somewhere decided that FRTS is normally 1MB, but for=
 some reason on GA100 it's
> 0.  It's not because GA100 doesn't have display hardware, because there a=
re other GPUs that also
> don't have it but the FRTS is still 1MB. =20
>
> So there's no reason to believe that in some future version of hardware a=
nd/or software, there might
> be a bigger or smaller FRTS.  If it really were an either-or thing, then =
it would have been defined
> as a boolean in our firmware data structures.
>
> The other thing to keep in mind is that a lot of this code is based on Op=
enRM.  One thing you need
> to understand is that RM is GPU HAL-happy.  We have this weird in-house o=
bject-oriented C variant
> that makes it trivial to HAL-ify any code.  So as soon as there is even t=
he slightest difference
> between any two GPUs -- boom! make it a HAL!  There are a bunch of places=
 in RM that are implemented
> as HALs that could be implemented more abstractly, but just aren't.  So i=
f that's how RM does it,
> then that's how Nova is going to do it.
>
>> > (BTW, I suppose the FRTS region really does not exist, but the start a=
ddress
>> > matters because firmware does some checks on the start address to ensu=
re it's
>> > within a specific region regardless whether the size is 0?)
>>=20
>> And that one as well. :)
>
> The FRTS region *does* exist, but its size is zero.  This is because the =
start address is still
> needed. =20
>
> Some parts of GSP-RM will look at frts_size, see that it's zero, and then=
 bail early.  For example,
> here's one code snippet from GSP-RM:
>
>     if (size =3D=3D 0)
>     {
>         return NV_TRUE;
>     }
>
> But elsewhere in the same file is this:
>
>     rmLibosConfigInfo.gfwSrMem.pa =3D wprApertureStart + pWprMeta->frtsOf=
fset + pWprMeta->frtsSize;
>
> So I guess what I'm really trying to say is that I've done a lot of resea=
rch into how this code
> works, and it's written the way I wrote it for a reason.
>
> As for using a Trait to define a default value that is just overridden by=
 GA100, that would be okay,
> but it wouldn't be any clearer or more accurate.
>
> I personally don't like `super::tu102::frts_size_tu102()` and I think bot=
h tu102::frts_size() and
> ga102::frts_size() should just return u64::SZ_1M, but I don't care enough=
 to make a stink about it.

Thanks, that's a very good explanation how the reason the code is written a=
s is.
With the information above, I'm happy with current approach.

Acked-by: Gary Guo <gary@garyguo.net>

I think it's important to note that not all of us have knowledge (or even
access) to some of the context that you have, so something that may seem ob=
vious
to you could require some additional background or reasons to be added in c=
ommit
message or comment.

Also, in the commit message you mentioned

> Introduce FbHal method frts_size() to return the size of the FRTS
> window.  GA100 is a special case in that there is no FRTS, and so
> the size must be set to 0.

and this probably should be corrected.

Thanks,
Gary
