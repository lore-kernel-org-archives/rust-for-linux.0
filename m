Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022109.outbound.protection.outlook.com [52.101.96.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB131E7C27;
	Wed, 15 Jan 2025 11:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736941124; cv=fail; b=O77dLQ1jjUI4Bt7fKK4fL7fHQBhHewHVFB/c5cv48WrhXLfmSZ/EcSfWwZWyfdjXrt6/+wTslLFLNbDLWoEmf+L5AfhGQJ+MeU4fQ+GBedH20P1xUJlbWLm8KzWznPVIErZNpbY591lou7n1qpXWzDq1cUX0J+ycJ5N0kiByAAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736941124; c=relaxed/simple;
	bh=HNk+n9SDKWqJHp6xWM8jKImeBaBUzcZ3bEGRkeCVLP0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JbdSuVAcyRqFnvmOZ5WFopo0B2kyqziiT76rW/nd6QLxKmq4XmWDz60gT1UM3gvWY7cdmBnliMu5hyyjSBOXhigosLencSbn+yVA4HFOcE8c6sJ85xg+nIWpaWFh7z3m7yjQw9smDzYueUQ0FHC/F3ROujzuDn/SEVKiP8qjZ38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DsZYStTj; arc=fail smtp.client-ip=52.101.96.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DsZYStTj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loBRDlhGWrpGMFnIaXuE1bxahuJs30SK40eD45ok+rzOvdi9abl6DUsrm4AzaogDXTfwQEn9OrqL+og2SQBOK6EOH/o4eCFG+0BaPiAMyvzgFJMvXcLWuB0KOdCaUN00tdar+tV4u1PnVhpp6KOQsTMhO2Pr1kDzdbQFrtJTH09a/7p4+ztsxqHLRR1khJUZllkRpm9TswnDtTsh0NHOk8sWVUf3CBDQ01Y/iKvTYOOzHrVCTIlo98NJt+0POUAbI+fy0bVu9SHjX4Kwql+EBPklpZdXbKp80iOCXNNoMeEpd0knZtrSf/RqC+rie/EIdLrQQ1HLhFWoQO5PjSlpTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNk+n9SDKWqJHp6xWM8jKImeBaBUzcZ3bEGRkeCVLP0=;
 b=IPQNBF0bZ27DrtLReyxc3SLNrA0EaOHau6dcgITFefOgGbkZ2fsEOc5ExZf56y4uzXHnIsMNbjvI9dMtjSRaryxfFIY64fD2u/R0ppdTIj9vDLLPYwSW6jbn+zmXuZRdcsdAiIa/EF0FNQgYmRkHFbKWfDDSsoH4XFhN0UcYm1H9eiobdxixqQciyWA6GaYdD07xcq5zGnZ+wVvaLTzhf4QmTe5LzdP9daIeWn+JX0nrr5qUx109pDOgu8epTyOgu4U2VusEQvDfzVZy+C5Ckb4otYBTL6SwboNHmIMVEBOW7wXQFsJKLVFmMTgu2PMhMox03zzF9LX7FomERlPLTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNk+n9SDKWqJHp6xWM8jKImeBaBUzcZ3bEGRkeCVLP0=;
 b=DsZYStTjj2e2r690n4//gXRHGFjXuuSECwGGqVXlfaZttoy+JmNteWX+86706f+O3AFXZ92uVSECj0skqhMX57AO55tumE4qIX95XLqkMC9XaEFwJ9rem5Q1PxacWg8dUEt+/bt5ifv88jqko0YGLo0DnmeftCS+mVoKdvWVKs8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO0P265MB7331.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 11:38:38 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 11:38:38 +0000
Date: Wed, 15 Jan 2025 11:38:36 +0000
From: Gary Guo <gary@garyguo.net>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: irq: add support for request_irq()
Message-ID: <20250115113836.18992e92.gary@garyguo.net>
In-Reply-To: <20499935-B328-4DE3-AFBF-B692FA3434E5@collabora.com>
References: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
	<CAH5fLggjAu+YPBxJh0_K933McnnSC=pEBhVV9YxMbUGzukE3ng@mail.gmail.com>
	<04864DC4-FA5B-4D7A-8EE5-BDA1E8F88007@collabora.com>
	<CAH5fLgiaVg1+PZxGr0Y_oyu9pJfTSRuN9n4EomFGhnvnZXC4cg@mail.gmail.com>
	<20499935-B328-4DE3-AFBF-B692FA3434E5@collabora.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P123CA0058.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::19) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO0P265MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: c2981c57-3595-4fd2-6a4e-08dd35592757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWxUa2RmNmo4TGtQcVB3OEtZb2FCNHJJMFdVUmhRUDFFZWNkN1dNMExZcHB1?=
 =?utf-8?B?c3duckpTekpQV2IyWXMrcGpraGFaaS9vSnZQdnU1bktmcU1KQnkzdDBWdFYw?=
 =?utf-8?B?OXg1aEZwdkg0Z2kxTzBsWEdKWUw4M1doWHJybmE2eTZ0ZEpaWFdxYURuVnZ6?=
 =?utf-8?B?QUQxLzNYZFd3S2ZWVWhkWFhVL1ZidGtGYUErR1NTVGZydXprRnd6UmFaKzZX?=
 =?utf-8?B?d1U1b1k1eDFsU3BUZTRxVXd1cWJ1cXlqN3R3YzM1UmI2bG5WcStVRVlHRlpU?=
 =?utf-8?B?d1lNK0RzazJCYm11eFdxVURoU3EvaEExK0NBblBNbXpodnlGaGJtLzZZa05w?=
 =?utf-8?B?dGxjQzBZeEFSanpKczNIcjVFNmJQU0RpdFNXa05EemxSV21uZEFoQ2RPcXdq?=
 =?utf-8?B?ZkY0dVpZaHZkaE44R1ZTZ0dIQkl1TEEwV0NSQ2hKcW9UWWp1TWlTZXJNQzdM?=
 =?utf-8?B?ZUhlR29uN1VIMXNnNitkMWpGb0IreW5BTHl3RHZiTHU3SEp5VUg0QmVoKzhw?=
 =?utf-8?B?SEkvV0VRbmtUMFI0M3dmem9zSzJLWldpZXQ2OTdXWkgrdGFHM3Nmb3lwbmlo?=
 =?utf-8?B?NVFmWUQ4OW8vZGFsRWhBdGxEM1l1ZWN2WGl5TUM0dnBrUjdvQit5RTZyTWla?=
 =?utf-8?B?cDMrQ0x1SVNyTXFlRWdIcjdGUVNCRDJ4eGZtNmxTSkNjdHNNUXVESmxhcnRu?=
 =?utf-8?B?RmpTQ1VBa1o0NWxYdE41Zk5HZjlJVitmeEExbXp3Q2ppNlpBQkxaelNZMThw?=
 =?utf-8?B?TTBISWh0VUFLS295dXp5Mmk4R3Q5bWp0N3JHT0FiSVhTcTRVSXhPRTNCV2Fz?=
 =?utf-8?B?TFNTZEpid2k0dlNpSVFPQzdoL25jLzBNTHVBZHhSTnpVdkpTYlFSQUpiN2Nh?=
 =?utf-8?B?ZFhiU0ZUQnBHQmIxa0tRdjFzbWhOazJLN2lWbkxocU8xQ0ozUm1ZSnBUUmJE?=
 =?utf-8?B?RDN3VzZENXUrbkdrOVg5NDdkM0MxT1VvN1FlM0kxNDBqVytNZjRndWZVVXNj?=
 =?utf-8?B?TDJkU0NDRk9neXM3RUdOSkdQYklrWThmY0srYUIvZmw3OFhvZUdZdWZsMVN3?=
 =?utf-8?B?RUkwMEFEbGNqRUFSS0hiODh2QzNjb3JNV0x2ZGFUWHc5RHc3UndWR1JVVmVO?=
 =?utf-8?B?RWdyTDdLdEdHQU5nam5hVDh2QjFSR2c2SDFjT1FaaXhZenJrVUlrZG9kMTAr?=
 =?utf-8?B?dExWbGFMWnlvVVFzVDllamRlN05jT2xSYXE3SnYyMVRUaHVPckw0NlN4bm42?=
 =?utf-8?B?RUdiVklxWmJCYUNFQitJdENqaVpkbUVhSEYrWGJhYWFhUjE4Tm4rZVFkUVdk?=
 =?utf-8?B?S1pVWVZCUFFjU0lnTm8xbVFuWEFOS2dUSmFzQUw2OXJZZ243TkxSR29mMTl5?=
 =?utf-8?B?dXdQNjhRai9tWVRxYng5aG51ZWlEVk9oNU1vY1llV3l2MVBwZzRQRDNJUlFz?=
 =?utf-8?B?Y0J3MkR3VDdvODE5MzhUd1Vqc2s2Y012eStFTXhtY0s0N09qajdYcXRtbW80?=
 =?utf-8?B?NGp2Z3dNZUltL0FBd2VTaEJoaDl0VDkwekxmTWhIbWM3Zy8yT0VQeWhxUHFX?=
 =?utf-8?B?ell2aS84dEZkZ3RUWmt0OHpocFhmZWltcnNPaDYxTGtkcUx0WFRyOTJIN1dp?=
 =?utf-8?B?eWVVSzZWUmpSQ0pBSnZSRHc3NGYzdTVrOU1jWHFXQjUwOFlWMk5VZHNUcExS?=
 =?utf-8?B?bHp2bXpoZzNSeFNMVU1wUUVQcnZtbU1nS1JHSzJ3RWdHbE44NlpoR09PQjBP?=
 =?utf-8?B?cUdzYVlwbGhOb2RaTEd1bzZ2Z01GSXJkbnNQQ2VOcG5PdnJzNFExV0pCUDY3?=
 =?utf-8?B?QlRkVlJaVUppd2NvTGlhaEI4Z2xMaTBVeERVL1JKSGlYNEkybXE3eWFPQmVw?=
 =?utf-8?Q?nnIvx9oHYoXhU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGkvcWdUSm9OMTRPb3IrSXdkOHVtRElEWjBHdUtzdVlEZWo2dkFXUExsRHhQ?=
 =?utf-8?B?ekd2cG0zZDdTQmtqZ0NwSTNPRE1pN1VtWHJMUGFCMjA5cVJlRmRkTWF0dFhK?=
 =?utf-8?B?bnM2TjZ6N0VBd3dScTlzTFMzeEo1dE43ODVVY3hKOFJybS9qL1IybFh5Y3Bl?=
 =?utf-8?B?UDRFbFZTNVl3czR3QndvbHF3NFRzYnpYTkhRcjVhK0JRaExIZlkvOFk0Rmhp?=
 =?utf-8?B?dW9ROSs1VHRYNDQ1WXpVcnlQT0R2cEFhbDNPOVMwMC9IdWZxYmdXUUUzaHE0?=
 =?utf-8?B?cnlqcWZWSFkwYlhUT1pJL29aaUpWK2tvQXE4ckNSRzlzUjRZNTJsM2FFaGJN?=
 =?utf-8?B?TzNVaC9WZHgydjFSSlcwa21pZGc2czNkNlFDdy81VTJZWHloVHd1OUwvUVZK?=
 =?utf-8?B?Nk1GbnorUnF1dVpqeWNoVm9MMjlGRkJIaFROZ2hhMnUzWS9PNE5HVC8wWDJH?=
 =?utf-8?B?TmlsY2d6VHVJZFl0bGI2WG1qU05QbU5zTC9ndDNHNnM2MU5Ud3JrSzdORGk3?=
 =?utf-8?B?OXE0cXJzSWJsQlEzck1ybGFTMlFlNGZ1UmVSSUt4YkVSL3UxVDEyZlZ3Y1p4?=
 =?utf-8?B?U2tsR3BHK2gyckluZ21vVGhKQTZ1aVAvc09FN3pGYzRPMXpYRWVPOEJwaDJp?=
 =?utf-8?B?T2c3YWVuYlJPNGJQUXpXNGx6MUV5OHpZajZRbGpNWFlwMm9GK3FiTWxaa3Ux?=
 =?utf-8?B?Q1VFZFNzNWFNNTR6K253U1g3T29RTmQ5MHZLZ3haeHYxTmxZb1N5MnhrOUdm?=
 =?utf-8?B?QzQ5eVBlZ1VqanVJOWJJckVwQ2ZFT1JCMVlJUU0rM1h4OUZVbWtFQ2syMVN3?=
 =?utf-8?B?eVBCamxsSWNGMVYyQWI5dUo1bW1pUHc3aDJvVjZhOU03ZFpadXo1SER1US9l?=
 =?utf-8?B?cFk0VUtkaitIZXpMMC9Hemx2eXhLMzVVd3hSQjRvalNZdEpyeGFIL0pMbno0?=
 =?utf-8?B?UFBJYkkraGQ5aUFaR25Bc25vTG5KUlhWaWFjMU9NZzhsZ2d0UmdhVlRJdnV2?=
 =?utf-8?B?aERDdUpaRlVGYVM2L2hBdjZNaUMrYlJjNGQ0RkcweG9DK3FMRzdSNklFdGNV?=
 =?utf-8?B?WlRyT002MXdiV0NJb1ZoRFNHTVNHNUdOR0NvMGpta0Exdkx5RGJwa09NUFRS?=
 =?utf-8?B?WUhra1hNejJUd2x4amRiWHJNNVh6QTVhbXpKSHBNWllXYTJmZElrU3p3cWhw?=
 =?utf-8?B?MDNMYXE3cElBbDkyRVZ1OXFlOFhCOXRpTFllMGJBYjViTFFTNVA3dW5Jc3lU?=
 =?utf-8?B?TkpEYVB6c013S1FPb3VJZTdNV3VBRU5zRitYQmxQUTBncXFHaE1DemlHb0wv?=
 =?utf-8?B?THQyQit2WEdOb094VGJ2S0NlaWVRVENhSnlpSnhZdUlUSzhvSWtSMUFjaS84?=
 =?utf-8?B?WUIrZ0ZSRjZ3WGFvdDhIdjJvMXNpSDBhNzdidGtxalpPNWF5US83d2J6R3d0?=
 =?utf-8?B?MUtNKzJrWW5CakNMQldsYXZubitIeGtRdFBhYzBsYmM3QkN2U1NrZWJHQlRK?=
 =?utf-8?B?dU9wVTh1cUdhZUwxbkN6cm9YTjhZTDVrTEliSkdZaUtGMGV0c3h3R2xrZG0y?=
 =?utf-8?B?Q0N5NGg3UTV5ci91TDBtOG82dWR6YVFjdUl5QUFxbWFYRnpRSis0YXVUU08x?=
 =?utf-8?B?ZnEyS21BZ3VnVDdFUzJxOTVucEdtczdZcHd2V01icEtqdDJHeVRaeGtRV21t?=
 =?utf-8?B?ZVRPMUtuNVBXc0IwYjVhZGw5b3BvTWxPRldLM0wwWXhkY1hiUGZwYnFrZXZG?=
 =?utf-8?B?Sk5CWldzYUxyaHpJaUwzK3BGWEJGL2wvQjlBdTByWEdTc0pkcUp2RkVQNDZi?=
 =?utf-8?B?OGxqNUEweFpja1dydTEvT0Vhd1VKSFNsSEp3QWZrekpPZ2lFdHMxbDVBSTVw?=
 =?utf-8?B?aGxreklveWtFYWJuRms3SEMxZ1BGSVQrRlNTTElHV3UzNHk0QXZLd1MvYVZk?=
 =?utf-8?B?ZWZ0a0wxK0p2OWc5NFdxaUdvaXBKOWh4TDh3UTVNc2MvQk52QkY5SHU4cXY3?=
 =?utf-8?B?RWNPQjlTYkRzNGdxNWpwS2lRT2lXTE1xUm9DRThyakl2M3FhV1UwdGVTVlVF?=
 =?utf-8?B?bDk4Y3JaZU5EVStEOGVSTUtMQzVXUzVSSnBBUVNadUxaeGVxZjd5ZnhWZnQ3?=
 =?utf-8?B?S1loODF2SXVDRkVkM0crOVh2RFFJNmprSCswTWVNQTFTUTFMSTdwblI4ZTRJ?=
 =?utf-8?B?Tmc9PQ==?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c2981c57-3595-4fd2-6a4e-08dd35592757
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 11:38:38.6596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHyY3K8heDGJAf+BkjketxxjAREFds1KhZJh+l6xxIj7f3qDK9tULPsMJEVl5WwLQOHmQBs4YLQyN6iXzhf1NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7331

On Tue, 14 Jan 2025 15:57:57 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> >=20
> > It's not the pin_init! stuff, but the Opaque stuff. If it fails, then
> > it runs the destructor of Opaque<T>, which does *not* run the
> > destructor of T.
> >=20
> > Alice =20
>=20
> This is pretty unintuitive if you take into account trivial examples like
>=20
> ```
> struct Foo(T)
> ```
>=20
> Where dropping Foo drops T.
>=20
> Is there any reason why dropping Opaque<T> doesn=E2=80=99t behave similar=
ly?
>=20
> =E2=80=94 Daniel

`Opaque` means that "this is a blob of bytes and don't touch it". It
can be uninitialized, so no meaningful action can be performed when
it's dropped.

Best,
Gary
