Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2049.outbound.protection.outlook.com [40.107.212.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD413085A6
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Jun 2025 20:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750277135; cv=fail; b=TbHM+tuOIJxNTZFFZ7U2zaQRW0FcHnlGuihtK+78pYzqf3ovjyme8ViVAepnf1lW/RqQgGMseOd0PqDLso3WPXC29W2KPFN0pYuw40E1wRcWCiSbS5oLo+d3AWJBcXHwMY5gloyJbnP7/mCWzaI4GJyYbHhjs+XoRxw+Hvo7lBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750277135; c=relaxed/simple;
	bh=GGcqbXGCWH11CLsKh2+CVJOKDJWUcDrHdvlXRqeVRdI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aQCHlkEeH7E6i9asLVYbwNQ/ta5FmDN0WH8PhaH+YbsgPaVulRgpDnhVI3/dOnIJ3MvMmTPJO/k/Ky1i9ePzh6ocDDHadoVXtdwsZf0ipXwZEr2KgzsovqsnOy4GAf6H6fWHBEeAkW/3/fAwjnUmtS4w/cJGwnr1iL1a6y7Oi9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HpP2Cyv0; arc=fail smtp.client-ip=40.107.212.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HpP2Cyv0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItXv/GAug5my0BCF/QbQhU8K3Ica+xf/lJm2S/OHc2T2HkOHIWQxb/YX45cJEBfvX2eAe+dQCsXNJhZeQhw5vxg8NfsD1TTs5rNGOLwmcQVaTwVK6WjXl5gRWaSsmKPHubUDbBDl1jugXFMYU2rZI3UltYwZ8RmIo0RXT6x8D/JIm9MM+fI/1cNge57iJpRdPL3Q7BJ9KxhkkQ3sBnRWRqeiY7b01TkRwTM2272BWGm8Lk2PYPwg/i2GOUly0dyTWvJpF7uTPZvPuivYQCdtBNyjK6e2hqSVeGc9Rk2P5p6g6Y250Cg8ioipFD6YHUzF7qehHYFX7npyNApXl2q6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGcqbXGCWH11CLsKh2+CVJOKDJWUcDrHdvlXRqeVRdI=;
 b=wgGsB/HOCq3NRlyt3YIYlynJkUL2EXzPs6HaL0VlDD7aAOIS5Zsokt8ceOJY3rPNyuKUmasJEwFszbI1l+5fFbGYTtrLcQpAcJ8mB+hBTYIy8OhiZDmxXI4NU4/1U6VMdauxb8nIP/VDrtksyRpR46y2viMeuT7JxWynzSzAndshRNHILe5rYYEz9h8+5xmr/ET1H0i9sx1Qs4GUwrZ3/4+ZeoHyzH+kWxcIlORCwQ32Q0siirHD4pnRETpxIOHuJf3HCEc6ouqoDKDfsHDmzag52Bioyacmu/IBj2wRv5S9l2dpPdO859QJVCl1FETMBJ2Yd8HWLxVRPv/m36acow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGcqbXGCWH11CLsKh2+CVJOKDJWUcDrHdvlXRqeVRdI=;
 b=HpP2Cyv0Si7/F2rd6NiBcV5kV1+I/9yWWhmTgSZM48hIz15sp6Sx7aq28w1hi1igOYdzSj5/VXvSVP0kIcBhcOoDexgXBCsjmM/44y5wJ80L0NcaEU8qXcNJBLVkEhhZDqE8R80AHLW2V9HLdqElb2aNdK+9LZoIhYDcw9auQZnSFjwUgdcaALN6sdQ6V/O7ArCIKdCyASW9d51WPTodfpEB/xNituWQ/vi16PRWdEh23RGh3Fv7dmE74fobpKLjy9rklr/VygLxYRjkWR6rJC9U5COlWH+TpHVKXkP/OOlkB9QWk+hesmpTdyi5Lc1CzFCGjWCX7bGhIqBGtIgrnw==
Received: from DM4PR12MB6542.namprd12.prod.outlook.com (2603:10b6:8:89::8) by
 PH0PR12MB8029.namprd12.prod.outlook.com (2603:10b6:510:26c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.28; Wed, 18 Jun 2025 20:05:31 +0000
Received: from DM4PR12MB6542.namprd12.prod.outlook.com
 ([fe80::1b67:141b:3703:a608]) by DM4PR12MB6542.namprd12.prod.outlook.com
 ([fe80::1b67:141b:3703:a608%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 20:05:31 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "lossin@kernel.org" <lossin@kernel.org>, "miguel.ojeda.sandonis@gmail.com"
	<miguel.ojeda.sandonis@gmail.com>
CC: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4] rust: introduce sfile macro for succinct code tracing
Thread-Topic: [PATCH v4] rust: introduce sfile macro for succinct code tracing
Thread-Index: AQHb3vXap/xDjuhkbUS6ehJ2bgZmCrQGRkgAgACu0gCAAAb2gIACXrGA
Date: Wed, 18 Jun 2025 20:05:30 +0000
Message-ID: <579273832b4accc4cd989d5182f3179c9950966f.camel@nvidia.com>
References: <20250616193433.2643407-1-ttabi@nvidia.com>
	 <CANiq72=cDk5rVEiAoudaQZUhNL_rne1EEjSEfiNuo_gkL3HOZw@mail.gmail.com>
	 <DAOMQXNTLSGR.U0QOV8BU1I5V@kernel.org>
	 <CANiq72moqFBWeS9RL6y8wzpxURvhdz4D0J8WfjaOBp0XSgufdg@mail.gmail.com>
In-Reply-To:
 <CANiq72moqFBWeS9RL6y8wzpxURvhdz4D0J8WfjaOBp0XSgufdg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB6542:EE_|PH0PR12MB8029:EE_
x-ms-office365-filtering-correlation-id: 574cd099-1221-463a-81ea-08ddaea37a44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SXlCb3JoU2FITjM5a2FzazVSelhuTzZwbjh4Z082dkc2TXJSNnV0N2hUYnVw?=
 =?utf-8?B?Vzd2dzJFK1FKWjFLQU1oR0pDVGw4NGRaSDVobEUzQlkwZ1R6Smxvb21HM0p3?=
 =?utf-8?B?ZnJiMHpWckNVYXV5WWYrM2JFZHBETVZaVzBtb0RhaHYzNTNVZ3dsT3I5Qkxx?=
 =?utf-8?B?UXVJQXVWdGtwQVl2cG9VSmZITEJDMm5xWitzbUdxMVBVNVJkV0NCNFA4MWI1?=
 =?utf-8?B?QkUvU0dpdGtpQXA2ZlNsWmlIV3pMTDNnTWoyNHRGS0ltWU03dVIyMjBnT0Jv?=
 =?utf-8?B?SnVmNXVTN1Azc2JjVWE4OVZiQXZNbnZGam9wOS8xckU2SUtPekwxZlludzBC?=
 =?utf-8?B?V2xrWU1CUlM2bXFHcHAvK2RvTUhvT01UcXc3TUZkOGJOOWVxeThxM2p3K0h2?=
 =?utf-8?B?YUZFUVZoYUlsNlVVa0xkaWZPcWFzUGNLTVAzeFJEMXg4RUpJNTJGaXA2WklR?=
 =?utf-8?B?N0l3bU9zWW9Qb1djY3F5M2hQK29zelk5eURZY1pKMGhyUmpJYWwzSGJ2MmVZ?=
 =?utf-8?B?RzlqRnE4eDlQdVF1YVdRM2kxZGswZDJjK1p3Wld5NndoSFRFcXdvQUQ4VndJ?=
 =?utf-8?B?QktkVE5UUGd1T2lHMGpJVEYwRC9xN3pQNXJaQlQ2NmdrYUUxempTdnV4aVpu?=
 =?utf-8?B?YzhoaS9RR0NNV1k3czJLbE50WUJXcGFZZTZPazE0ZDUxZVZLTWpFQlF1d1ZH?=
 =?utf-8?B?bzVLQ0hhQnRBUUlvaUZydmI0dW9Hak9saTdoL2lBZmtUNWFmczcxekdaRFNV?=
 =?utf-8?B?aERjZUU3U2RtWkxweW1KZWYwVmJ6aFJxb1hrU0JoVEtreDl3VmZaVHVDUmRU?=
 =?utf-8?B?a0o4UE5XUXNVWmVXYWhPNFlmZFQzaHBBY3R5L1hxQkd0SXVLYUdlRUkrSkh2?=
 =?utf-8?B?d3p6NjNheFkydVBNemFobWExTGJmTFpEdGtsQjFoc0tHRUoxbGE5MXduVlNi?=
 =?utf-8?B?aHpXOVpYZElwekl3M1FKSjVVVXNscUJaMnNOd1lOWUszNGV5Vk5jOUw1MFZ0?=
 =?utf-8?B?eFE3WDJFOU94WTYzems3SnI5Q1JpZHh5SWZ2c1ZtcGZUMVRTNHdvZUxHbUJo?=
 =?utf-8?B?RUIvZUtubVpTOGE1YlBLdjZxS3ZpYitaSkxJUWpQV2dGTFo3Q3JCcyt1ODlR?=
 =?utf-8?B?RlFoZENZRFVBMDdqWkxSVTdHeDFqZ3RlMndvdEMrdGNZZXlvbXhMQlhOOXNG?=
 =?utf-8?B?eVd5bjI3a0drMEIzSjJWc3RRWFFzYkxKL0VGYUczTlZ3QkJyMzhoWDhZclI5?=
 =?utf-8?B?SWVVakZZTWRHc0ZwYlFaUGwvNTFqaEJQZ1BHeE9GS1luQ01TMjlHNWZYNjNV?=
 =?utf-8?B?UTlUSGF4TmFnUjZHNWVlRlZxZzNBci9qNmdtZjhFMHBwME9sdnVxVk9tRlhO?=
 =?utf-8?B?RDdnL2lrY2RPU0RwYmgvUzhuMGMxY3hZR0tCNTNOU1hORDltT2Rwa3ZLZXNn?=
 =?utf-8?B?L203Q3FuaVBUdmRXR2Q3dmpkbk53R21qTlAxRUc2MmcwMllmblFpMTF2bXJG?=
 =?utf-8?B?bzMyU256Z1VmeklRMmxVbXNoK3RBM0xVMEJ0NUFocWROaHgzc1p1NnovTVFD?=
 =?utf-8?B?NXRpMHBURHppS1VEcEl2eXo5Q2xNVk1mR2wxRytTYTlVa1BXUTlHa0N4RnQy?=
 =?utf-8?B?RVVDU1VURFpZd2Z0b1g3VCt1cVphY3V4TWY2QmtjajZwYXZoWEJGZVdWUDVM?=
 =?utf-8?B?NU0reWRTL1hlMkpkUDBxd2F4LzNuNk4rRkQxZjJ3d1dyd0JhSkxNN1ZzQ3Nz?=
 =?utf-8?B?cWhmZHBIeGNhaUdRVnlIRlNKNjczRGFTL0V4TkVTTThJcmp6NVIvTkVZY0lP?=
 =?utf-8?B?L3RxQk1BTXBld1Q3bGlNeEYrbzQzeFRIY2QrVURyTmpYTDBuQWpSK0lJQ1FU?=
 =?utf-8?B?NWJWRVh6RlpKV2tvaTdINW9hdC9hVjZrSVFCbmVSaHFJa3ZEWlF3cVVLOHkz?=
 =?utf-8?B?bnRVNFluTXBiampiTXg3MXpsNzltQ1ZORlJtV1orYWpOUXpVY1RvRzdLa1Ru?=
 =?utf-8?Q?a64jRTEjeBF3k5GChVeUqModRvzGh8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6542.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y0xyakFCRHF0a2t4RnhBY1l3VDY2a29Nak1BVzl3Sjd0NzFvbWNiOFJWTnAy?=
 =?utf-8?B?dWdEN2dwdW1ERVhUNThGN1FZdzNyYU5jQU5RZkpYV2FMMmQ3OXJTR09ZT1A4?=
 =?utf-8?B?a3NIVjE2ZkRLc09sRjVtdUdxdVd1QlJkVFFVVnExazdocVByWStIMnNYY3Bl?=
 =?utf-8?B?WTNkcWVJek9TYjYvQXRXZGVJSHlsMWxqaHBBOEtzbzF2Q2tIOGNOd0NzN1Vn?=
 =?utf-8?B?amd3S0ltWHRqanRqMENDczB5UGxLbTdnVGJpTnFNOTRUZUJ0cTIzdE8raEoz?=
 =?utf-8?B?ZXFpb3F0QUxZQUN5aGhmNnVQbEpUWUJrWWtHTUZUMTFyRk9wcWVpeUZZVEl2?=
 =?utf-8?B?akU3aXZqZDlpWUlRR0VYU0dRRkNNZ3JRcXdFa3VhdlFsZklyaWVuZnQyUVB6?=
 =?utf-8?B?ZU04R3g1NG90QVNSUmkxTVZOVGpRYVp5bDNTWjJONGY5eGJsTlQzSXRvV3Fl?=
 =?utf-8?B?azV6eERHQ0FtamRCcy90QWZVSmlqMWhwb2pTSzhQTGZIWmd4YUJaaW43cVc1?=
 =?utf-8?B?TDZSdGIxQTBKNS9oaFRDdnhZME1NbVN6OUFxaXV0azFxMGNJRDVERW1SV0U2?=
 =?utf-8?B?bUNsUnY2SzFrRnRYSzlkL3RMY1lhUGFOL0FCS214Vnd4NCtLVlhVQ20vZ09C?=
 =?utf-8?B?NmdSNHlLaC9zSllBMjRXRUNmK1RRY1RJWi9VZHlJZzhHdnJ5OHNVNXM1amx6?=
 =?utf-8?B?MFMxOHFnQi9yZzFGeEt6Vkh0NmFIbWhVYUtjc2VDdGZUSGk5YmF4UUowTTJK?=
 =?utf-8?B?YzBYNlpXU2tqYmtNQVl6UHVVczRHMVI5czJPb0phbmIzdHF6SG05QlpXT2E1?=
 =?utf-8?B?QUROSXFiZ0NFMXM2aUw2R3pRZjVybTE3M1pDWjNkUWZJT0RFTnBoNURsd0VN?=
 =?utf-8?B?ZW9NNTVQUEN4Z0hUMHlxb3BHNUhOOUpubE0vd2o0K0crSkk4NFAxRGZxMGFW?=
 =?utf-8?B?bEFoSnp0czA0UTZLeDJUZVhnZ3J6b1l6OVJkM2hyS0hPSkZwRHQ5VDN5QjFU?=
 =?utf-8?B?YWpMOEg1WGtCWVBhZDhjMFZyMlpJZGZicmtiRWExaGlETmhjb0hsRnEyWmFo?=
 =?utf-8?B?RkRjRGV5TWZPUFlNK21lL1hHbWVpMS9TZXpqWVcrN1pHREszSmdSVkhhWjd3?=
 =?utf-8?B?ZUtwVUliRmx5MGtzeGhHNExLYk1CM0ltUGhoS08zUXo4aStTQ0txbTQ5cXlQ?=
 =?utf-8?B?cEdqY1c4SmJGVUNvYUVzT25JbkdxQU5wbmkvOFFpYTM4SWdNNjQ2bkZ0dGlP?=
 =?utf-8?B?ZkZtUzBSamxZUkMwWkJZL05QdWtMSDE1UC8rV2RhREk1MXgwb3dHSDR1OXlh?=
 =?utf-8?B?c3hpTWUxNzhrb1lUYjhhdnFZdGxYdXI4b2NFNWE5TXlkTGlVWEJQdVpiWklD?=
 =?utf-8?B?WjRuVHVVNE9USGJESTVqOG5VeEZYdVNHdXBGK2oxUlBOeGlMMUJNTlFUdDUv?=
 =?utf-8?B?bVA0UStLYmVIUFNYUHIyT0NrSWFGYVBldTRLV1Q3K1hENm5OaHBRbmg4c0tm?=
 =?utf-8?B?S2F5elM1R01oVDl2aStXa29jWGRaYjd1TWRaZVIzRXoxdHRMRXNCaFJYbmM3?=
 =?utf-8?B?bkx3QUxSejZGSVpsNEc4bDhGdWJyM3Y0VkZPQzdaczVoSkJhT0tDYW11VjF4?=
 =?utf-8?B?UCtqK21YdXlKaVdKRERqQnhpVGZ0aUFSWlA2c3lKL1d6WWdjbEZaNDQ1bE8z?=
 =?utf-8?B?cjQwNllZZDRpUkx2dUFEb2JwazQ2Z2k5RE42b2gxWWZkcFZ0aVZsN2xSMmcv?=
 =?utf-8?B?N1ZEdUhuSlBjTjJ5NmQvcHBMUHR1cGVIS2pPVU1iL1BrR3RkWUxJZG1xUHow?=
 =?utf-8?B?akdVNTFKb3ltS1VjaUY4VVA2U0FHSFVITm82cDRmZk5seHNDbDJQOTdhS0ZP?=
 =?utf-8?B?RVdUVXpjbGdweUw5RVR5aEhneWVuV3FZNDAycURobkNVbWEvejIvRFJ5L0dW?=
 =?utf-8?B?QUhjbDgvVzdQbGJVa09Gc0NFUEpXZWk4SFg0SDVzL1FnM0RobERpMm9qNHRE?=
 =?utf-8?B?M0dMYUh4S1dOYm9oSThyMnhUYzlMdHVLQjNHdlgwL3p2RjVYVUZFeXlLdjRr?=
 =?utf-8?B?MjJNYUhySWtHNTlGQzhMZkVlRS9DbnIvT0Y0R1VyU285OU1GQmcxaDd1MEdo?=
 =?utf-8?Q?j9TuLtosBqQIeik1XAs1oyxIp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <105215BBEE45A84DBEDF7B84960910D6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6542.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 574cd099-1221-463a-81ea-08ddaea37a44
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 20:05:31.0295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2SZfYaBMcFdLlYj0mLlLA6X6kvbI8qOqCGr6v01uXWpl2aEE0ny0pO3jX6cUqJBk9hXc+t6/uu0tmWc1gHh37g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8029

T24gVHVlLCAyMDI1LTA2LTE3IGF0IDA5OjU0ICswMjAwLCBNaWd1ZWwgT2plZGEgd3JvdGU6DQo+
IFllYWgsIEkgbWVhbnQgdGhlIGBjb25zdCBmbmAsIG5vdCB0aGUgbWFjcm8sIGkuZS4gcmV0dXJu
aW5nIGBPcHRpb25gDQo+IChub3QgYFJlc3VsdGApIHNvIHRoYXQgd2Uga2VlcCB0aGUgY29uc3Qg
YmxvY2sgaW4gdGhlIG1hY3JvIHdpdGggYW4NCj4gYHVud3JhcCgpYCBpbiB0aGUgbWFjcm8gKHNv
IG5vIHJ1bnRpbWUgcGFuaWNzKS4NCg0KSSdtIGhhdmluZyB0cm91YmxlIGNvZGluZyB0aGlzIHVw
LiAgSSBoYXZlIHRoaXMgc28gZmFyLCBidXQgaXQgZG9lc24ndCBjb21waWxlOg0KDQojW21hY3Jv
X2V4cG9ydF0NCm1hY3JvX3J1bGVzISBzZmlsZSB7DQogICAgKCkgPT4ge3sNCiAgICAgICAgY29u
c3QgZm4gc2hvcnRuYW1lKCkgLT4gT3B0aW9uPCYnc3RhdGljIHN0cj4gew0KICAgICAgICAgICAg
Y29uc3QgRklMRTogJnN0ciA9IGNvcmU6OmZpbGUhKCk7DQouLi4NCg0KICAgICAgICAgICAgdW5z
YWZlIHsgY29yZTo6c3RyOjpmcm9tX3V0ZjhfdW5jaGVja2VkKHApIH0NCiAgICAgICAgfTsNCg0K
ICAgICAgICBzaG9ydG5hbWUoKS51bndyYXAoKQ0KICAgIH19Ow0KfQ0KDQpJIGdldCBhIGJ1bmNo
IG9mIGVycm9ycywgc3RhcnRpbmcgd2l0aCB0aGlzOg0KDQplcnJvcltFMDMwOF06IG1pc21hdGNo
ZWQgdHlwZXMNCiAgIC0tPiAvaG9tZS90dGFiaS9saW51eC9ydXN0L2tlcm5lbC9wcmludC5yczo0
OTI6MjINCiAgICB8DQo0NTYgfCBtYWNyb19ydWxlcyEgc2ZpbGUgew0KICAgIHwgLS0tLS0tLS0t
LS0tLS0tLS0tIGluIHRoaXMgZXhwYW5zaW9uIG9mIGBzZmlsZSFgDQo0NTcgfCAgICAgKCkgPT4g
e3sNCjQ1OCB8ICAgICAgICAgY29uc3QgZm4gc2hvcnRuYW1lKCkgLT4gT3B0aW9uPCYnc3RhdGlj
IHN0cj4gew0KICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLS0tLS0tLS0t
LS0tLS0tLS0tLSBleHBlY3RlZCBgT3B0aW9uPCYnc3RhdGljIHN0cj5gIGJlY2F1c2UNCm9mIHJl
dHVybiB0eXBlDQouLi4NCjQ5MiB8ICAgICAgICAgICAgIHVuc2FmZSB7IGNvcmU6OnN0cjo6ZnJv
bV91dGY4X3VuY2hlY2tlZChwKSB9DQogICAgfCAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4gZXhwZWN0ZWQgYE9wdGlvbjwmc3RyPmAsIGZvdW5k
IGAmc3RyYA0KICAgIHwNCiAgIDo6OiBzYW1wbGVzL3J1c3QvcnVzdF9taW5pbWFsLnJzOjI1OjM3
DQogICAgfA0KMjUgIHwgICAgICAgICBjb25zdCBTRklMRTogJidzdGF0aWMgc3RyID0gc2ZpbGUh
KCk7DQogICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLS0tLS0tLSBp
biB0aGlzIG1hY3JvIGludm9jYXRpb24NCiAgICB8DQogICAgPSBub3RlOiAgIGV4cGVjdGVkIGVu
dW0gYE9wdGlvbjwmJ3N0YXRpYyBzdHI+YA0KICAgICAgICAgICAgZm91bmQgcmVmZXJlbmNlIGAm
c3RyYA0KDQo=
