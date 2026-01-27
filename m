Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021114.outbound.protection.outlook.com [52.101.95.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC7F3491D5
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 13:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769522024; cv=fail; b=DhAX78cxC0WKzOBrIEbh7NokO9e+JEaq6LQSmGsf9CerUo/9ZP+ZDTTNlRsA02AwIYAfrQYNtgEn6XRMibZYxwfsRwmuSU1lncdBXb+3zkMLnJG0xu1nYpR9+JUge39a0ruYs5JdjTDpOU+Lyf4hJyjn2CWg8q5pQqteHYVEmp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769522024; c=relaxed/simple;
	bh=wWorrlOS41hDO2V2pJA4LCn945jz2+W9NbiRjsmyWZs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=fcs6JdFZxLre2Wb/LqE17MZEBfA6mldmcBYgILI/D+IoRl19GGEAvWlF2JUQtTG/7WhXaNl8rH2VSxuZzbzNLQHqKjGgRp47+mXuaTXSDrDg28TmRcf/im4GvuRW6Gwt0eQ94wT+AxQOXh1ZM8V1Ai1f+VHLwDXZV7bTzzyFV0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=p1yqs1F2; arc=fail smtp.client-ip=52.101.95.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="p1yqs1F2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JH684vomQaTgKdpRJPlgNUzG/NUsBhK45UuLrH+3gnSvPCW1qxfiVfysrNcbdHBART3c4CF4vI9D8dogXgQQa6rA8cI1LX7qJwF+ahCwI9+3IRH/Pq0rwLSym5YO4f6DCCUqQHcvY5NJi68u8vGGyIUQiJiUx+oUAAfQgpbWBFolZSEdwTC8MOA7LwyElHC4ObcEIXFNKCmVpAwE1wrfoFEto1NqO7KxaBIyj7sY/tT5itcZNH7nF/uE7Oz7bc6JWaq/qavmXi9DS5zzYiBiomLNoao3QYs7+3vX9b4XO87FIJsHXCGmV8gILZ2WJ3irePJ0x3BNWvh354I44px6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bp+sihbJ8cnUUTDT2N1Fe8khcvEosof17yqPph3L3ls=;
 b=qrapzvBEJyjFfQTiIOFFj7M6cD7TejS/NBbYtf7dtf7Bl2VP1opR5KEVpriS6AkhEuIxNBahQMyXmPWDPfCxc6M7zL7TVAWBObonnZXmBXHYSvLL45uxSoowY9swjcgKboikEoxQUXHjg2ttZspWxkFzAtc+ke0M0FDSDk9JnXhZrrWDnZTGPdj2YuQeODOQPbGI3rOVTSE+8wUVpABIZ7Uc/wJTfS+T0H/MQQSrcMl84oh2bjU0DxvUOvtVyTY6pmouEGQZMtkCkxeJoOYzTQYIxG6nrZcnn6vsK5fC+doWhsYfRlQKnn3lNTd9h2hP13LMHCGXh8FmCr5NYZ5wzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bp+sihbJ8cnUUTDT2N1Fe8khcvEosof17yqPph3L3ls=;
 b=p1yqs1F2KGz5RkRF6CQiWZaTHKY/zA0qWYk/ehsHPFFVZ5yNSk58uE7oQQHn8HLCVm98fSYqDcz5ywjUsx5rN0Flrz9PipjTQM0Swtmk9t3PfQD9JorWurcX/G1MGVJqcbRPG2Aw+yeK5eFdVEQB75mYv3P/fpzc8kr3gHsIMrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by CW1P265MB8928.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Tue, 27 Jan
 2026 13:53:39 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 13:53:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 13:53:38 +0000
Message-Id: <DFZF7D029HSM.30GD2XS63TQ61@garyguo.net>
Cc: <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>, <gary@garyguo.net>,
 <lossin@kernel.org>, <mark.rutland@arm.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 1/2] rust: sync: atomic: Add AtomicFlag::get_mut
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@aliasing.net>, <boqun.feng@gmail.com>,
 <ojeda@kernel.org>, <peterz@infradead.org>, <will@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260127125300.3656544-1-tomo@aliasing.net>
 <20260127125300.3656544-2-tomo@aliasing.net>
In-Reply-To: <20260127125300.3656544-2-tomo@aliasing.net>
X-ClientProxiedBy: LO2P265CA0508.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::15) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|CW1P265MB8928:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b4b12a-b96c-422d-9a47-08de5dab7966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHBUN1JTSG96N1dUZVpQcXlWNUJJTlRZaUVhL1VQeUhXWFU4MTRPSjNCdWtv?=
 =?utf-8?B?eTRYdHVWN0FVem5kSVFCcnAzMnFBSUpHbW9yL1AwMTJqVnFaaU1OR1VwRTI2?=
 =?utf-8?B?a3NnVVRKdmYrdGc0cWtZbkNzOW5aQ0thVTIxenFLVUNCT2ZpNVd5ZGhvM1Yw?=
 =?utf-8?B?T0JBV1M2T1liZGhNNzBRV0diU21obUpFYWo3VWVmbngzMXlMU0RmMjFnMHJv?=
 =?utf-8?B?Qk9pT25tYUd0TTlZZzIzYk01RWpHMGJ4dFNNUUVjanlHMVdQOERqZ25MTUtI?=
 =?utf-8?B?OGJ3S3hVL0V5ZWZGbXczakFrb0VBeTFmVkxyL1hhb1lsSkR1R0RTVXNTZGF2?=
 =?utf-8?B?d0JPNmI4SjZrdVdRcVRLUzQrOVBLeGFycVZrWitQbExPbmRLek84S0VTWWJL?=
 =?utf-8?B?cGVkYlpmRy80ZlFmQU1YNk5vcjRCNmdvbWg1RnBBNU1ydjdxdGdTZnJiYVR0?=
 =?utf-8?B?K1JPOW9MTjVYZkJhV0kwUHVUZy9QbU1rZHRLYmJoN242NUZyU1hqd3ozY3kx?=
 =?utf-8?B?Y1c2bnlsMytPelVNdUg2S2RlY2JydUI5MDBSS3ZSQjlkbXZ0MTBaTVg5TmdE?=
 =?utf-8?B?dGxObkErZ1F3KzlhRmZzWVo1eGlTcWZNK1kxMThJT0RScUtCeFJMN29DZ3Nt?=
 =?utf-8?B?Q2p0ZDk2QjNXUkZPbGJEazRYUzJKd0VRS21RNUd6aUVBSDlhUTU0MnNJRm1i?=
 =?utf-8?B?OTQwekVIQWM1cGwwMThEdDBsTVZKVnNtMDd3YW82cjh0dzZ5M3V6NVI1aTY0?=
 =?utf-8?B?UEhOS0dRc0hCbVBBck9wY28wM0h5YSt4NkpsVGxjVUFGRnJCTXhFU1dCaUtI?=
 =?utf-8?B?Q2tNQkdtM2pMRm5mNlQ1dElYK0U5ZDhoS1o4TG5MZTBMYjRJZmVtckRWRFlz?=
 =?utf-8?B?N0l6cERnTTZwWXdXd2x6WUFTZUlXWjh5TEV5dEt5ZWZnR3JCbkNRUlFlU25X?=
 =?utf-8?B?TThUMzQrOTVlNXNBN2J3Z1NRNUpDWjZmVjhJeFljOHBnYUJWNUxabng2RllI?=
 =?utf-8?B?akdqcWs1Slhyd1hYRlVNMURSR0hyRnhTSGZyQVJQZWkzSFpCT3dJUVFmSXYw?=
 =?utf-8?B?Q0NPNml1NWJ2dTBtM1M3R2FsU2Nod29aMUZrVUdFVFFWNWRNWjhaakpSREhs?=
 =?utf-8?B?Zk9ZcXRrQ0tYOHJLQUpuUmc3TC9SUHVpeHpUQjJiUmUxd25YVzY0VFB6cnJ3?=
 =?utf-8?B?Ujk2MGg1WUk3NXpSWVhRZWF0SktIR28vL0lhSXBsYzhVSGRVOTBReWRBaDVS?=
 =?utf-8?B?Z3MxU1lnZFU1Y1FTNlY3c1QyYWh5NWN0TENCZjA3aEc2OVB2SitMaDFrUFNh?=
 =?utf-8?B?b2FTYnVEWWJ5UjVORk4rcXZxM1lDa1VLMjV0QjZ5NlZnWFdLZVgza1lPa1lz?=
 =?utf-8?B?VG1Ua2FqQm5BbUNLNjlaMkxDUGYwaW5NTS9Ma3YwZzc5d3RRVXZ6MnRPVVVp?=
 =?utf-8?B?cys5Y3BPQmNLTXgzbC9HQURDRFk4b09xNVZIYncrZVpPKzR6UkpSTVViK0dx?=
 =?utf-8?B?Vkc3aHVvMkdKczdlTEJRVmt3dkNwU2grbzEwZ0s2RzBETm9nRWNUZ2lKQlZ4?=
 =?utf-8?B?WEE3WlJyQWVnSWN3a3dDYnpFRmUzdEx6SE9jQWJGRUlOaTNud25SdlpsNTRW?=
 =?utf-8?B?bVkwZEtiemVLNzI4NHNGeXBPeUk4alN5VTVtb2VHYU8vYXV4SUQvYjlNcGxW?=
 =?utf-8?B?cytwYVd6SEhjSXdYZVIyKy9oanJUeUZtcGJTRFlNY1BFa3BtK0kzN0tJUnBl?=
 =?utf-8?B?YnpTUlY2clJxY21HV1FwNGozNGg2MktSVlNYVTN0dHdVWm14azR0SmZtS0RU?=
 =?utf-8?B?LzNsTnhhZGZsQm5FNDlpMUdOK29RUk90dEMxZ2VZbHNPWWVHZGpsSDgrVzBB?=
 =?utf-8?B?WVQ2UStVd3RMSTBGbFI1eWplZHhzZ0d2YXhZL0VORGx1ekZ5bTU3Y0J6aFlh?=
 =?utf-8?B?d1N2S0ZYcTJucWZHcDY3cFdESlVrUUw5bkNXK1BCalBneEVlM3hMRUxuZnQv?=
 =?utf-8?B?QnRhQjBtKzVpVU1lNW5MaXV4REVUQ2thYWRBbEYrbVUrVlp0eGtoR0VXcVoy?=
 =?utf-8?B?K043a2hJQWRLVkxBL0pWUTIyUWwwVHpZcTF1MXlqVHBjZTZlS0FOWDhUZ2ox?=
 =?utf-8?Q?Jbwk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2tXanFKWG5ucEtQWkpUcnR2K3FqbWlTUjJheUx4RHdscDJDTGVTdkFmdjR5?=
 =?utf-8?B?ZTB6UVVLVGxxZExLcGZxdVpwWUVZdXNNVGx6TDZKbXFoWTJRMGMvWjc1ZjA5?=
 =?utf-8?B?Y2N0eFM1M1V2RzZhdlF2VFpZWGdoR1FmOWp3dnIyb05vVjFpdXdCM0hkTVFM?=
 =?utf-8?B?dWhXK3FUQmpma3JNVVhJcUpwaHVPcm5jVjdyKzFXNTRXNzFKVitZczR2d05u?=
 =?utf-8?B?TFZnd0h5aHJDcHZnaGlJQUppbUJ5eWhRMFVVakpSSXVwTEN5OHpxOUNUTWpz?=
 =?utf-8?B?Si90aWc5WUFmRXo4ZHhRcG81UDNORDJaMmloZk9vWXpmY210UGFPMzNIVXZj?=
 =?utf-8?B?N3hFaGRmVS95aWszNWNUVzZoN2xZR3pwM2tONVJNN1pLTzUzWWtoR1pSSlgv?=
 =?utf-8?B?UldHb0NVNWlza1pWWjEwTk81WFRIUlNuQnJyZXhBMkwreGRDTUhlL1lLVlQv?=
 =?utf-8?B?NGY0NkZSV21jT2xwUDhmUDBPRStGVU1kQlRXcmxDcTlFLzVwNXlZbTdqNG4y?=
 =?utf-8?B?RG53UmJkUWxmZ0VablVqSTFjZlFDN1pMUERLUkppZ0RuNVFCMFZXS2VCeWh1?=
 =?utf-8?B?RlE5YVBiU01HOXBxM0pTNlR0MlVCZ2c2Z3FuRUp3YWJnYWUyc2djS0JSZUFZ?=
 =?utf-8?B?d2VpRlM4VDlSbm1XbFR2SXYxWEd6VXJlLzFheVpjTlVWMnAxQVVONGRMT29a?=
 =?utf-8?B?SzBUSkZGMGNtbXdvOWJrRnZHOE1XRkZrcWU4U0tJaWpPWTUxTTBUVWRYS25Z?=
 =?utf-8?B?ZmdOM2dXVlg3bVZjTVNtMmQ5K1dCL3FnczgrdGdoUmJKRTd0OFJVTjN2VTBI?=
 =?utf-8?B?RnRnaXFac2lhK3VNZFhhNDNZczZhZUloRDRHSTZwNWVJUUk2RXlRdWt0cWov?=
 =?utf-8?B?bjdlWDFMaDlucEFFcHZGV2dyb3J1VlZybCtsNzVSSi9jajBBYWJUVGZrQTMv?=
 =?utf-8?B?c0piMFdGSGNJK3FCd1JQcHkweWFaN0hyNGJLWmt1SS8rTnovajJVVmVDbkx5?=
 =?utf-8?B?Uit3ODVCZlNnU3dFeW9tTEc0VDJKM09OTEd1Y05OK09QV0Jmemp1L3JiSmgy?=
 =?utf-8?B?SjdPQWF5NkJ2SVNibHFlWmRUY21qWi9pQ0RBek10ZGtlb2hUOHVtUzEwU0VK?=
 =?utf-8?B?SE5uQUlIZzl0M2RCRDNtRHJ6aGVMelpoelJkeVlqSTFVdkRKbHBJQXhVL2pD?=
 =?utf-8?B?ZnRoZlhUYkYxWC9ETExBdnhodkhVL3VpS1FoZXJnSEo4Z0tPemhsQlBnd1do?=
 =?utf-8?B?QjFaSG1qWjlqci90Q3pPQW1HMlJEV1VidFdDdEpTbmJtaVlMZXQwREJ5M0ZJ?=
 =?utf-8?B?amhJN29uTjF1UUl1cDZVR0tud3JtS2tCMkpjK0lIZm5WSVBaeWJxd0JrUC9K?=
 =?utf-8?B?eDY0Qm9RQzVxdm8rb0E1UWk4M0NBbWtaZHZFMGVNYmNVcm50dFhFYlFteXg2?=
 =?utf-8?B?dFdUcUs5SXpIaFgvQ1U4SUhDUHAyT0xBV3dBRHFuTWF4MWp6blRWN1FycWxS?=
 =?utf-8?B?ZVRCSDMrR3N4MkhCWk5GRUZxVU5PRnFlcG9EQVlBUEtSRzJVcnNyYTdMd0N5?=
 =?utf-8?B?bkJjampCQ1hOcHlWalFMQjNpaEhjMk9mYnpBRnFYS2FlSERJMmY1SldWVVgx?=
 =?utf-8?B?Zzl0ZVhONlNEbGphVFBSb1VJNGFZeVFWRDEvM1cwaU1wcTZWTk9BOXc2alhC?=
 =?utf-8?B?VG9FMTVaRTFUWGl4c3dUdzJNRytLVUJkOUpYeWY5ZGtrSHZhMkk5VkFEZFA0?=
 =?utf-8?B?b3JSdzduZmpTM2NleHljKzhDdUQvK0lGVU9Yd2lUazB5aituWDc3eGVvbTVw?=
 =?utf-8?B?UU9VaWtRMFZaaENHMlIzNTJXV1liMm9RVUl1d083bU9lcFBHV1VQb20rWG1X?=
 =?utf-8?B?NkNGSHlaT1pxR2VoSXJwTXZHb3VMMmhwdUs0Qi9HMzl0Z1RkK3o5WDNnYjg4?=
 =?utf-8?B?bmEyb2JzVnkxWVdYUWtXNnV4Y3crN1lidFlyVHVISXF6OU9Dejc4YkdwSG16?=
 =?utf-8?B?VFFPeHZ2SnpMZHRqVmZyMGx4ckxvM3NwTzBCcStyYnR2VjFydDRaUlMzU0gr?=
 =?utf-8?B?WEhqSUliVUpyRGh0QytJanptUlJHb29qb2lXSXpVNVNhT28yN21mYjdaNWJH?=
 =?utf-8?B?WWs2ZlhNOXhuSjZWNklzTWp0ZFZoUUtoTUxhTzFPY0sydmg3RTRaL1ZzVmQx?=
 =?utf-8?B?aE1ycjRVbVkrTGF5ZE1oVGVKS0pTQkhHczE0VTBEdTdON0h6Qy9hMW84MzZL?=
 =?utf-8?B?dVQxQ2x1RWY2QUNyYnpCZG0wS3dwbzlGc3FLdmNreUNHTW80QVpmMG9zQUJB?=
 =?utf-8?Q?VIUmZZAY6sdFo5qcij?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b4b12a-b96c-422d-9a47-08de5dab7966
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 13:53:39.1584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8J6k3y2SXGM5sGN/4XOrc1gzLhbZ0TkU7aCJOHswKAy40A+l24mmRU5cIGDZQXgg/bxixwsudERDOYU3kf9zig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8928

On Tue Jan 27, 2026 at 12:52 PM GMT, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>=20
> AtomicFlag exposes a bool API, but it lacks a get_mut() equivalent to
> Atomic<T>::get_mut().
>=20
> Also add kunit tests for AtomicFlag.
>=20
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/sync/atomic.rs           | 20 ++++++++++++++++++++
>  rust/kernel/sync/atomic/predefine.rs | 17 +++++++++++++++++
>  2 files changed, 37 insertions(+)

