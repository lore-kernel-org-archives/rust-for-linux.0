Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021082.outbound.protection.outlook.com [52.101.100.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8176E2253A0;
	Thu,  8 Jan 2026 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767882168; cv=fail; b=JzZ5iEzpN5kqQiqfJUncZrHwm9PWZo0RdoItfMm3w6DoXZGkBt9HUkCmqz4VRLMVraVfz4VVDsc4uzdNHXuizsdE1gUqYDZpucKBD+wI5AOaC4B6gHqgXHgM3LsWZ6ncC7o0+4CLY98y4L1NMjOSyUrKsONpVcwSJjQlaWIviLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767882168; c=relaxed/simple;
	bh=HfVC1nDm1XX4bLHVHz2/4Jo1FkASaAsNNMJYwTfMKPk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rWyhW8H7Tg1bTQIOjzN+ic1hlQNy1ine+1pUQdGF1BN4PL5eg7FhzK+HcWfixPmRD3HafaTFroTJl36Cl0PCEdbPlptynLiMSKbi7cdAqx3Z3/hQxG+I3HHRK0cGpQgkzaYZGw/H/5eRX/2DHvOk3gyFdmC8khTFSY/GBfpvo6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=rmHtadD8; arc=fail smtp.client-ip=52.101.100.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="rmHtadD8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kz8Fl+fU8kcVvRLQNkgGHO8ROTXFeWBlEvl8hxqxtZ5P838JGJMmbGzeX0+EiOFgLG73xp7p0wT0EmUv1PKuGoRvWRSRugHwZH2g6ZdCyQeKcqiHcZ9h91hVTi3a6FRXo8KvJfF10qlZWm1Va5vXYAySpTVwsyhCIZCaZnYtJBl6YIHOhZdD099CmK8llt7XfA3kwTn53yOIN5ra70kBZA1V7+FnB0F9BdVCSuOuXWAsb1Qj7LzY25xtwyH/PYgu5WR+8OCwhyElLSu8kAOTvXZuQ+EsuFoBcZyVdiOGgPAa6KcsTjClUwB10grSqVCStj5EjjRLKoYe4U4PQNcSuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyznazECRvDBve0E14UVfAiHAhpFBnk4sz6rGcc5Z8s=;
 b=FbBV8UHrtPXkBbLH1ET0jRWR4lB42Z5qYaWa48ITiOcIoVquFWnIwNpfc2+OWUXag9v3jNvlbyx0Z7iEWUwtozxFcsdrgMuI2tmsGQDVhYpGbPQlzeOYTTIsgtio4vyI7BkAFhxd3djSUaxAyJKYoxRBTTvHrrk7LEASwx7AEhimYXnoQekeiY0tOyvdWI4flzxk6Z1zBv38kfavvS2IDNRnuGSRZLG/6UC3D3WxLRmM+4ln1USBqE/axZolTE52OYh4okLxgms+HUD1SpE0fB2PSqkScKF2f6p9mI71q/dgG7ve3uKAJ27IFTZElD/gb5/Anoug5vVDck5DscdfpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyznazECRvDBve0E14UVfAiHAhpFBnk4sz6rGcc5Z8s=;
 b=rmHtadD8FYqjIxg+QG7GrCkN7xMFshh1i6TWbQU3QcgfwxuH9m3y0KRdlfBU7cbUvXxi51nbQQ+rB6GHqEGKiBnyxJ699zrKMCvGcE5fqrykiALUQp1dShLMSYEEDbjyjlW8tNZcgUHxnG8WpdPk4xPpEbipOxgBaqbcqnMjpu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3314.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 14:22:41 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 14:22:41 +0000
Date: Thu, 8 Jan 2026 14:22:39 +0000
From: Gary Guo <gary@garyguo.net>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Gomez
 <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] rust: xarray: add `XArrayState`
Message-ID: <20260108142239.320ea3b4.gary@garyguo.net>
In-Reply-To: <87h5sxgsxa.fsf@t14s.mail-host-address-is-not-set>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
	<20251203-xarray-entry-send-v1-4-9e5ffd5e3cf0@kernel.org>
	<CAJ-ks9koBuQabEc7VKAPt1kSLbLyv21NuaNkBOb0FGvZ2hBLPA@mail.gmail.com>
	<87h5sxgsxa.fsf@t14s.mail-host-address-is-not-set>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0529.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3314:EE_
X-MS-Office365-Filtering-Correlation-Id: 97dfb444-f970-4dcb-7825-08de4ec16213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWpwQmVqdmRLbEhTTzd2VVA5Z2xqV3Z5WUdIZGJGbFIvdC9tcy8wTXZ3T3Nu?=
 =?utf-8?B?bko5QVFWMjNEN01Fdk01TDhTZHA1emtTVnlNSzlobkpPK2FaYWkyZFNFMTJO?=
 =?utf-8?B?Tjl6TUJDeW12S2JVZTZuWlFaM21jN3VwRlAyZXRpNC9vbTlTektGNXhOb0Y3?=
 =?utf-8?B?b2FYMVQ3TW0rcXc5NmI5dkRCVGJZRUxxanZGeUprcWYrTm9ndHgxd01USE9p?=
 =?utf-8?B?WlhSaE9LMXU4NWFmVFVmM0lTMDk3VldQZTRPSWJnQzd0TWM5VERzM1h6T1FL?=
 =?utf-8?B?bVlzMSt1b0lBcXJtODFnWWQwUm5NdHV5WkVTbUNOdUF1MTJSTmExdXVleUtC?=
 =?utf-8?B?QWZlVDAzNjFNS21mQ0RZYjBuYkJQNW0rTllieGtKS0tRcm1tNlNhT1VXbmlB?=
 =?utf-8?B?a0RNaFBwQnVCeDRJS3N4Z0o3WDhWZHUyVEVIWWc3TS9yT3MxTVhINEpEdnRG?=
 =?utf-8?B?bWxCcTR6N1FOblRYTUQzMThjMitYQUhRRVhzUlp0ZkZKV3ZSTDNPdnpNUHkz?=
 =?utf-8?B?VHNkR0s2NUJwT3NPZ3FKNmZtaFBqQlE3c3AydCtSRHVOQWtyb1JVRjRvWFBD?=
 =?utf-8?B?RnBFVE0wMnQ3V3JQYU1tbVZicDdvbUdWRzVpelhYZDRkUk1PN1BHTEdCOU5C?=
 =?utf-8?B?YmFBZGJPMWFUSEo5Q0VCZmc1V05FY0hsUng5djZyWmpPYnRiZkZpQ1FpYVc4?=
 =?utf-8?B?RnJRVFQ4OEZsVEpJcGNVcWxBMHdrRGpEcFFQdGVmMGp6cWJXS094SkppcDN2?=
 =?utf-8?B?Y1BSd2Z2UzVJTEl2NHZRekJoSEJZT0NVUjFMZk9HUVpZQzNMTGxjbVF3VFBn?=
 =?utf-8?B?dkJKUXVCb2t3ZWd6d29CcUtTaWRtNmhWNkU1S0plWTNSNzUyZlVVR3I2R0Zs?=
 =?utf-8?B?T2JBZFhBbmVMZ0Z5UVZMNmJaQVRWenE1emNjb1lvb3M3RGh6dU8vQU9qLzVk?=
 =?utf-8?B?VXlRYzVhNmNHV0JtcnZmbEJ6alh0V2lqNElLa0J4aTFYK1BwRjY4QlhrSWhl?=
 =?utf-8?B?QisxTTY0VTRtVVM1VXp6QS9KdjE4bXZIMjUzdnJseHFKTFNGbkYzcHBCM1dx?=
 =?utf-8?B?TDBoZjBrWTZIV29lbG9vY0pKSVhMTmJHclN2YWlTN1VUalJjbk9Qa3VKVEJS?=
 =?utf-8?B?MUNaNld6cDVlMGZUSFhNQ3A5Wkg0TlFlZzlxaVF1OWNYcWl5eEcxSGRxY2JP?=
 =?utf-8?B?dGhGSzJsV1RlMnZic2hybmNuQkNTbXpaT3AwZlc0RVNoWUxWcDRSK25tbzVj?=
 =?utf-8?B?SnZpWm1jVDVWQXJQTGc2eFB1c2Nibno4U0o0WmJoVGNJWTBkZitVQ1IwSU1Z?=
 =?utf-8?B?SStQOU9sc2ZGOWJZUUxSNWk4NFFkeExvWGFIR01HbHBqMUJrd1FaUWZRMXcv?=
 =?utf-8?B?NWFYa3dyenZHNnYvdTB4aDM4TWNKUGJkN1ZwSFNSM0g4alFCVFhWV0dMaUdY?=
 =?utf-8?B?WUlYWGZOMzk5ZCt6SzJBcDBpN2t2WGpBM0pRa1ErWWhRTmI1WEZTUjFQYXhL?=
 =?utf-8?B?UGFtMml0UElROE4rQ3ZnNDFDNngyY3BpR3FpVmJoNG14MHo4a3FvSnN3aXgy?=
 =?utf-8?B?dnoyZUJrTWFob01nWU10NFFaOVFncUswUVRlRldoZXdGMC9iMVVEbG9QL0tN?=
 =?utf-8?B?ME5QRGhFRytjNWo2TDFWTWRXS0pHUElpcVVWZ2pJWElaSU13V3dQTGs4S2hm?=
 =?utf-8?B?aE9OUG1zdHRZSENzNTJlQXFsSzlxSmtaQ2EyR0VmR2NrUFAvN1JCT2FNdndj?=
 =?utf-8?B?SXhXWk1hYjVOOEFSMENpSjFtZjM3YU81NlRIMjNOU2FiWnlMSmVYMWViRzFi?=
 =?utf-8?B?Ry91bXV4bHcwYWx3T2xPQU1UekxFcXRNZnhla2MxOGtyVFN2SzNFQTg3M2hr?=
 =?utf-8?B?eWJoci9YZkR4ZVhLWHV3ZzVWRVJKUTdOT3ZtT053RDhrbDR6QVQ4alVaakxU?=
 =?utf-8?Q?1WndGmx32/kUpkxFxHcN2r39GIXeV+m1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzQzTkYxZk5FcjN6SUZNZ3E3LzNTWGorcC95MXl0WDZ5dk5Ka0FqdVZ4Nk93?=
 =?utf-8?B?Y1d4NFNIeDYvUG9RS3pPSFJ4RW43cjQ1bTBGYzRsODdLZ1hucmM3R1BPWFJt?=
 =?utf-8?B?am5iRnlTMGhrV2lJaE1nZElhK0I1WSszODVvQlJpS0ZMUmtyZGlKSnF2Vi9w?=
 =?utf-8?B?Yk1vLzhqQTRJRlFuaE5yTUVTZFR4M2l3elNKZ2hWVkRLM3o5QVZscTRSUjk2?=
 =?utf-8?B?TnNDY2NKYWJWa1prWWdEUnFwZUJqaXh3VWoybTVIcXZ0V3hKMllzTmVLWjJy?=
 =?utf-8?B?Um5idHB1MGhZb3Btdnd6L2JkZ2xTbG4vLzg1OFA2a3piQVdzd2ZFY2laT2tQ?=
 =?utf-8?B?a09nSGY2S24rUHd6RW5BMEFSNmtJcHdtS2RvRW5xYkNadEp0VmM2Q0sySWJn?=
 =?utf-8?B?UXFXVS9FazY1WTRDQXkrdkxwMWVsbnYzWjcvdTZnaUpKS1JXc1ZJWVpCZkE1?=
 =?utf-8?B?cnQwbkpucUFncFlBZ3dKemRwWUhkUmRBalltREtwSTBtNnJ2ZlNLSk5vNjY1?=
 =?utf-8?B?ZDZDM21MRkJVczJJbmdaeGJOTE9Ib0lQbmVYUCtmVlhDSFJBU3pTOTBJUFVr?=
 =?utf-8?B?VitXdTBnQTJST09ZK1hrUWM2VzdERXlUaVZqNEM2NVp1bzljbXhFbWxGekxh?=
 =?utf-8?B?YXJNOHhyaURXalk1ZUc3dmZkNDZjUDVCQUUvck5LSlFOT3RUSEt3ZFVZU25B?=
 =?utf-8?B?aTlCZitpbzBXQm0wM0kxZ2hhU1hiRlhDVXcrQ2J4R2NXKzlSdzFicVN6YjYw?=
 =?utf-8?B?dWJZUmc2aCtVQlJONjlJQ1ZZbXVBZGtqZ3l1cHQ2Wk4rczQvT2FtNDZvaWxn?=
 =?utf-8?B?NnFXZ2tVVE9MaFdrZlJsTXdmdEltUVBBaEtZS2J3VjVlcldZREw4UVI0NmpK?=
 =?utf-8?B?aDB0WTVpb3BqNW0xVTMrbUg4L2wvYit1T0ZUaFRaVDkxT09OTytxT2dZR0lt?=
 =?utf-8?B?TlVuN1ErM3hQRml0T0tNdmZPV0Q0SzlHV1JxVlpUVWc2MitQWGJGOWtRbWRv?=
 =?utf-8?B?bzRWN3BreGM3NXBwQXZQYTkvUW02UVZmZnZRV09sYzFVeW9zbk13WXJxMVdn?=
 =?utf-8?B?TXJ3WFlaVHd3Wmp2NDRSRHBxd1l3bDk0MGVXcmxyNVBmWjJlaUE3dUJZWnJk?=
 =?utf-8?B?bmJTR2NuOFd2emo1aU1venpTZG8rYThYNUw2TTJyVzBKR3VHSm4vRjQ2V3Nl?=
 =?utf-8?B?OHlWRlNBa0hnaWxrLzdadWNuaFlBVXlvSTVBQ2lRWkorbzBWY1RKTkdhdVBm?=
 =?utf-8?B?LzA3K3h6cm1BcDNlMlJ0a0tEb0dZU3F3MVRuQm5NZlhxbjZSOEpMRzMwSXNF?=
 =?utf-8?B?NGVTaW9HKzkyZEZMMTVqNEx6U2xjVW4xVDlNZVR2NGMwakFnbDc5R0tqazNW?=
 =?utf-8?B?TkxTTFVJOG5ZdzJLSnp2bC9sT1MzdkM2OGFmUVNOWVB3L2VnQnZmM1gvVmk1?=
 =?utf-8?B?K285VTNadlFKMXBKNnRoMFN3UkdwRUkzWWcrM2Q3c2YxNDY4b0JrUXlsL2NP?=
 =?utf-8?B?azV0KzQ4QW14b3pDeENpZ3BSNVg0dGdPeGM2cTRlSUloY1Y5eDEwYUZZVGJv?=
 =?utf-8?B?VER6Vk5PbXZsNC80dk1DMVE2d01YU3pIZ0gxNHd1TlZoc1h4djB0ampZa0Zo?=
 =?utf-8?B?U0k5N01VVHFoM3hocU5HQ3ZxMnVKL3piREFvOGZjWkhIQjlIUXNNSGIwUlpt?=
 =?utf-8?B?K2FuKzlkTWpKd3hlcUFqOVhlandmUU9jVWxlOUV0Wk8zOWFjRFBaanRPcHFC?=
 =?utf-8?B?dUtMWUluY0xFYzM1RVYwZTJkNmE1WGVVaXd0QWFqbk1uVzVqbFR0WE90S0Rk?=
 =?utf-8?B?VC83bTNRemFDL29iVXA5cWZ6eUJFZDNBbk4vSjVEUjhjUnV6R0RmYnQ2bWV4?=
 =?utf-8?B?aXNxVjhkVXA0VEExV21pUEtYN2FiRzZsV25YS0Y0dzArV3pzN3BDL284aTVx?=
 =?utf-8?B?VytjR1dHcm1zaWlUTVRsaGRHeW03eEdYNDlWSGxicHltYVgrM0VKajZjYlhC?=
 =?utf-8?B?eUVaejM2T1FiQ0hpeG9Ja1lnUUtQSk1BZ0VpWGlIeDlhejU0TEZFM1dEZU9W?=
 =?utf-8?B?Zzk5Vk9JdFJXam9pOWppRDF1SUlmNk5sZy9yd3QxcW0yVEM5STd3YThBRHZt?=
 =?utf-8?B?ZkNYQmRWcERwdVlNRWRMZTdNTkE3Z2lYTXA1TEtHZmtlTXUwWnZSOXNTTWlC?=
 =?utf-8?B?MjVOSkdjblpXbzExYXNyeXJTZGZvYk54YXdZUDZqS1ZnbzRBdk9wR0V3Q04r?=
 =?utf-8?B?cHhFLzF4YjVKUnBkdlFsUVNZZXdvNkJJbXF1R2NPVzFXWFp2Y2I2V0pJT082?=
 =?utf-8?B?MWRzeUg0aURpcE52TVRoSmo2cy95Tm42dHUram1zNjdyb3E5Unpqdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 97dfb444-f970-4dcb-7825-08de4ec16213
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 14:22:41.5227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ahQHXWgTsX1Lc8IElzou+AVzCA5XRjRNtoJS9BdKa5X1lYJEH+ISTyvI9ADx77PoYST2xDtglhawijXFjLK0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3314

On Wed, 07 Jan 2026 19:48:49 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> Tamir Duberstein <tamird@gmail.com> writes:
>=20
> > On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote: =20
> >>
> >> Add `XArrayState` as internal state for XArray iteration and entry
> >> operations. This struct wraps the C `xa_state` structure and holds a
> >> reference to a `Guard` to ensure exclusive access to the XArray for th=
e
> >> lifetime of the state object.
> >>
> >> The `XAS_RESTART` constant is also exposed through the bindings helper
> >> to properly initialize the `xa_node` field.
> >>
> >> The struct and its constructor are marked with `#[expect(dead_code)]` =
as
> >> there are no users yet. We will remove this annotation in a later patc=
h.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >> ---
> >>  rust/bindings/bindings_helper.h |  1 +
> >>  rust/kernel/xarray.rs           | 41 ++++++++++++++++++++++++++++++++=
++++++++-
> >>  2 files changed, 41 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_=
helper.h
> >> index 2e43c66635a2c..86bca946faff0 100644
> >> --- a/rust/bindings/bindings_helper.h
> >> +++ b/rust/bindings/bindings_helper.h
> >> @@ -109,6 +109,7 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT =3D X=
A_PRESENT;
> >>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
> >>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
> >>  const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE =3D VM_MERGEABLE;
> >> +const size_t RUST_CONST_HELPER_XAS_RESTART =3D (size_t)XAS_RESTART; =
=20
> >
> > Can we avoid casting it here? It's quite distant from the site of use
> > which makes it difficult to understand why it's necessary. It also
> > suffers from C casting rules being quite lax, which means a change in
> > the type on the C side would likely go unnoticed. =20
>=20
> Yes, we should probably use `*mut bindings::xa_node` for this type, then
> the casts at the use side in Rust will go away as well. I'll try that.

I don't think bindgen can generate a pointer-typed constant. I think what
you did the original patch is correct, as XAS_RESTART is supposed to be an
plain address (without provenance).

Best,
Gary

>=20
> > =20
> >>
> >>  #if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
> >>  #include "../../drivers/android/binder/rust_binder.h"
> >> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> >> index ede48b5e1dba3..f6e610b059625 100644
> >> --- a/rust/kernel/xarray.rs
> >> +++ b/rust/kernel/xarray.rs
> >> @@ -8,7 +8,10 @@
> >>      iter,
> >>      marker::PhantomData,
> >>      pin::Pin,
> >> -    ptr::NonNull, //
> >> +    ptr::{
> >> +        null_mut,
> >> +        NonNull, //
> >> +    },
> >>  };
> >>  use kernel::{
> >>      alloc,
> >> @@ -319,6 +322,42 @@ pub fn store(
> >>      }
> >>  }
> >>
> >> +/// Internal state for XArray iteration and entry operations.
> >> +///
> >> +/// # Invariants
> >> +///
> >> +/// - `state` is always a valid `bindings::xa_state`.
> >> +#[expect(dead_code)]
> >> +pub(crate) struct XArrayState<'a, 'b, T: ForeignOwnable> {
> >> +    /// Holds a reference to the lock guard to ensure the lock is not=
 dropped
> >> +    /// while `Self` is live.
> >> +    _access: &'b Guard<'a, T>, =20
> >
> > Can this comment explain why this isn't a PhantomData? IIUC we just
> > need the lifetime, rather than the actual guard. =20
>=20
> This can be a PhantomData. The use of the reference is leftover from
> earlier prototypes. I'll change it.
>=20
> > =20
> >> +    state: bindings::xa_state,
> >> +}
> >> +
> >> +impl<'a, 'b, T: ForeignOwnable> XArrayState<'a, 'b, T> {
> >> +    #[expect(dead_code)]
> >> +    fn new(access: &'b Guard<'a, T>, index: usize) -> Self {
> >> +        let ptr =3D access.xa.xa.get();
> >> +        // INVARIANT: We initialize `self.state` to a valid value bel=
ow.
> >> +        Self {
> >> +            _access: access,
> >> +            state: bindings::xa_state {
> >> +                xa: ptr,
> >> +                xa_index: index,
> >> +                xa_shift: 0,
> >> +                xa_sibs: 0,
> >> +                xa_offset: 0,
> >> +                xa_pad: 0,
> >> +                xa_node: bindings::XAS_RESTART as *mut bindings::xa_n=
ode, =20
> >
> > Odd that we're casting it back to a pointer here. =20
>=20
> Yes, full cycle. I'll try to use the pointer type for the constant.
>=20
> Thanks for the comments.
>=20
> Best regards,
> Andreas Hindborg
>=20
>=20
>=20

