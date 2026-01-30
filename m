Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021117.outbound.protection.outlook.com [52.101.95.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6826534D394;
	Fri, 30 Jan 2026 16:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769789688; cv=fail; b=CVqLdqFJ1PoGvYtLuhRWm5Q5lktJyoFj2C1eq8axq7xkA2ExhEDGVjLxzRZpOeEy9erbbni2X8CtbfJ9yX2RjiIZxJLcbkV7wWXRWtzcSnzr7Ia1U0Pimf1WnF6JHZtbURuQKJGctMr9WrcQa7mREOcahT/0jnppL8clxp6PxY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769789688; c=relaxed/simple;
	bh=DH4Xc+dLye1s5njLS35w2iY6bfef5xXknWG0qWTgu1k=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Cg25OErcjYTpeVvJrwyQ4ZQH7XdWLS2pK7VLti+S9ohx4DTSqROxCjSWv1KvwVFs8jVsQoQauu95XXidksihNSGKF6vvsyQ6K3/R417Vb7O4g+5yN8VQexg2dHUNvRontLPPLfrNkklzjIFEk8gdHM/336Q+6azZQImwIInBQzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=n6dP3Pup; arc=fail smtp.client-ip=52.101.95.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="n6dP3Pup"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B30hQikCRt56WKls6EkU/VIVOdoDwlei4ASvGdUb0mzWoeEO/obebrkZxHxhb7ac4Nw4fCEg4Y4+SSbXa0GT6rEtYod7lrHqBD7hm7TcfCDcyhrlye89/ipZy5ZC86nfefUBFo/oe0GRGpOxlNxTmZWmXBcXmuHjS9UDSRejrY728KM0KlY9NbVk+b+/OBNfayDoFHEbfpvUsc0rOGsw8+XX82icWP2iM94MKUKtkbZZYeqxElGO2gf/jtT7CA7xwyVoB8EO2dHXrE3gcFQ1fqQMApT5q+vG+5GBb3NdppVlJXSdepqwEMVICzqNnhpenFR0Py9vckP9smYS0+vUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yI8ZYGum/TcMIExpyV+JHgr89EYisctpvHXU0Cyy34=;
 b=S39cHyMbqz+f6eaSi9hviF5anEUkG0iiZF37QmAeFzVdrgKpECfGgNYUnCJ9WwIz2IdyW++2qNDqgoFStt1XSgpb2aaKR3jF279tGUV6L1SZYK5vgyVGF1JQ2B1WGltnvan0w/iRsr1WxIzOxqXfPhfz2a1ptPT0jfiwDG0bwLM4MfyhlsNWpj4IPmUKji8NoFRAN6tOgCNN4LLexcsOqYQteqLKS1ikZXlFAZ1SW2ZdNtR+g2qExH3tLaAlvHe0li7CutrHbX94KHM78boyOPJ1MTRGHLPWihkq1xAk34zCVLnAcytM9jX7ugVKOjIq0+/zzxZqKQbjLlBVgdqt2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6yI8ZYGum/TcMIExpyV+JHgr89EYisctpvHXU0Cyy34=;
 b=n6dP3PupYejPcaN7vOCYCyvDrTFZXpx9zBloatn9bQbqo5Yslivez9KXKgjIS429DZCygnx+yQGpzUJ+RzRLtreDn2EMEkMka7kayR3D3B9GB4d8wRUaum4Dkc8g3AuxrgOZQrOscmk8xlMEZe92SS4u5yHKQBx0TvJ4G509cL0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB3418.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 16:14:40 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 16:14:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 16:14:39 +0000
Message-Id: <DG222YZ4WT33.21A5GG66K9X5O@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] rust: io: add `register!` macro
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-5-aee3a33d9649@nvidia.com>
 <DG0CVJN57L5F.2I6J4RXMJOGQ@garyguo.net>
 <DG0WY7S2QPQM.37S6PROC464QI@nvidia.com>
 <DG14TFQG2C13.2BFREQR1DV4I@garyguo.net>
 <DG1Q6I5CTD87.RYS7QBJCHZ7T@nvidia.com>
In-Reply-To: <DG1Q6I5CTD87.RYS7QBJCHZ7T@nvidia.com>
X-ClientProxiedBy: LO4P265CA0054.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB3418:EE_
X-MS-Office365-Filtering-Correlation-Id: bdba5964-ebdb-4d84-961b-08de601aac09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXhraHpIN1VPWHJJc081Znd4QzZaZHl4UzJYVVBWcm1mTmdGV2FBRDhtMDJR?=
 =?utf-8?B?djZ5T3ptZUUyNVlydGJ0NmNVMDRsOG9GeVJuTDI1WncyY1pLYVZKaHNiSU83?=
 =?utf-8?B?V0hSa05oRTBTOXdMdjVRemx2THJBS2lOaW5aUDFpZERPSXQ2N0VCUFZtK1Vy?=
 =?utf-8?B?aDVOUjhuK2hrdzZEYS9KMElBZFlGeURkb2lPNkhQTEpCMERPM2pCcUNlVGd5?=
 =?utf-8?B?R1lnYmkxNWZBL2dWUXozWmVPM1YxbFV5aUN3LzUzTitKcUs4NXNDS1YxeVNa?=
 =?utf-8?B?ZHloNElzaUxoRTU1QzYxZVlpVEwvT0labWE2TFNBSlh0U3lNSTFIRlQra1N1?=
 =?utf-8?B?RUd5ODd4SmhXdURIQk1Sc2Y1ZG1ld201dEh3b09SVHN3SkhzcGxhdCtyczVX?=
 =?utf-8?B?V1VnWlc5ZGFiYXNxQzNGNzdMc2xiTVJkeDhZdmxjMnM4RjgxOTFxS0EydSs4?=
 =?utf-8?B?VzhRZHI4amtkZGJ3WTA2T0pLa0RNWTFlUnJFcXJjQUNyV0ExbFZiaUdtZytl?=
 =?utf-8?B?NWRXcjdwRVpOOXZUclh0VnMyQmhsNkxiTTJwY0dwTDg4TE4vcElMLzlHRFor?=
 =?utf-8?B?RzQ3WGdkcVpkZ0ZoL0kxZG5OTkRBYTRIRXp6Uk1PZkwwakc3YWlmeEpNTnc2?=
 =?utf-8?B?M1BpYUM2ajQwd2dDRjdtaHlCYUdyRkVSY0xpVll4cHc2NXZWanlrc3pvMEZr?=
 =?utf-8?B?M2tGT1ZLdHdJRlkzMVRhRmd4aDBLRFNlcHJUeFI1WGFadGo2TWt0QStDa3pp?=
 =?utf-8?B?NDBOM1FxVFJOb3A5SEFyRVRVMjMxekhqTkYxeG1HRHVIeUZmeDVxcURaSGFW?=
 =?utf-8?B?VGlkV3cyTkNVWGJyNHIzd052OVp6aHRLNTcvdzRNd1g5VnVOamFYMURwRDEz?=
 =?utf-8?B?ZXY4TDladzgwb3NxYkx4RGxCY2dURFk4RVRkUS9INmNLMzZJSFh2ZUl2b1Uv?=
 =?utf-8?B?bkt3U3VrQkpjN0pMNDZZT2UyRFUzNUpSL2I1Z3ZqdHI3Z0IzTW5vZ0lMa1ZC?=
 =?utf-8?B?dzJLK1BnSWNLSGZQU0Z4a2hQNFlXeFVxYmFLS0gyb1ZDNEE0M0crdjgrS0dZ?=
 =?utf-8?B?T1d2SWxoYThWTHc3SkF5eTVSLzBDUElQQTlXcDNRa2RIZmtCYUVlWStkZldP?=
 =?utf-8?B?QzJTdjZFYy9FMGdZWTVYOG5idGVsQjlKS2lCdDYxNVQ4ODVRZzdqWkJ5K0kw?=
 =?utf-8?B?cmlzeUxhR3RIUWpZaUd5L2ZkQ3hOYUk2T3FPRmRzSkh4bjBVWU94bThQSnlo?=
 =?utf-8?B?VU5tdXRCZ21VRXBsVG5PVWExZ2NOQURrRXpRdWkzVTNuRUdEUlYrYzhqcWky?=
 =?utf-8?B?NDFreEtYejZXdzBLak5SUGh2UUxVYzRJQzJJRXdaYTAya0J2d2Z4Ry82MEgz?=
 =?utf-8?B?Nkk5RnpjSHpvTlhTejJZcmw3Z0xzczFRSUFRUVo2MVF6UmVoVDFNcWJ0eXNs?=
 =?utf-8?B?NkJCRUdNdVJzTU1jcE1PTzBHTVg5ZC8wVjdLdWFQK3A2SXJSTVZIM0FabnBK?=
 =?utf-8?B?cWRsNm5HaVJqU09ob29INmIzYnRHUjVXQ243QW1kVFhVNzREd051OXRyUXNE?=
 =?utf-8?B?d29uRTlzZE5rZngzcTJld3dTTTJrM09hV0NiR2YwWkxhaldmb3g5UTRRdUw2?=
 =?utf-8?B?a21mZHRJRW83ZTU1bnJZS2hMMW9INHlTZ0UrTHphUjFuemMzYjZOeWh6OFpm?=
 =?utf-8?B?R3VhalRNYzZhVXA1dDVrREVYRDR4MFZ5VHkrTUd1VmJpTENyQ1hYR01vODc3?=
 =?utf-8?B?VWZwVmgvQVg5eXM1RXF1WUpaeUsyY2d5VXpQam1VRTloN3Y4ditnNWxrOXFp?=
 =?utf-8?B?MTFmczZtMWt6WVdrL1VLbkVyTDZKQkFweFVQalh2OVdDM2phTFc5Ymw0cy9q?=
 =?utf-8?B?WHdHcEIwUGZVSnNuNEFHejUzWExVQmhCVXFFRDhkbXdCaTFaVEVvTHVKQ2ZU?=
 =?utf-8?B?RmRvODFJZ3FoYWh2dHRJTjg0Mnk5cUcxN1o1OXpuVWNxbGZ6Q2U4S05TalVr?=
 =?utf-8?B?Z2ljSzJTM1dFUS94UGNpOTYvUkI3STJRVnd6NTk1R1BIZG5qelFUZ1ZUUDNV?=
 =?utf-8?B?Q0ZFNUdVZ1psdGNjREphbm4yWWlWQXZmUk0wZFdMa1RjUDd1ZDczUXJFcnEx?=
 =?utf-8?Q?BW28=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmFOVjA5UElpakorQWljTkVWSWJhY1hYQ1V1eEpRMHc0ZEpWek9NRDRwWmdY?=
 =?utf-8?B?Q1Z2YnlXWFp0QTZVbkFySmZraGdNSStkNUMrUzlsM1FzRm80Z0tQNnNDY1V0?=
 =?utf-8?B?dWlES2xaRXRmYVRMdUV5bktMcURuUXd3SGlESmR4L1hqOU1PZXVXQ2x5bkYz?=
 =?utf-8?B?TVJrSjZPRjBJYnpqbXhxM2FLV2hMYlZkVm5FWUx0M2Vsem04N0hYTVl2M2ty?=
 =?utf-8?B?alJxV2VnWVQ0V2RtVFE3ZEdtYlVzTzBhQXlnU0NxZG53VUZ4ajBaakhRVXpH?=
 =?utf-8?B?d3M2SzQ4Szd4Skx5bFlGV3FkU3Rnd3FnWGlxOUxkQVVxbEZnOVZleko3K095?=
 =?utf-8?B?TEhPaHdkTHpwZFEzUjl4dnpWVkh5RmxmdjBzSHdUam5kOXhPYUJ1SFFoMitt?=
 =?utf-8?B?RzZwd0F6b1lPSmtGUU1tWm1oaUlxYitlYlhlZVRJRk12clYvN1NZSDhaamw3?=
 =?utf-8?B?RkxVWEpwT3Azbmd1dmp3VURwTWdSeGZBaStNNTcyaTVlUU4rbWJ4alRzaTNz?=
 =?utf-8?B?dURpQUNqWFNLNDhEcE9aYU4wR2FySERuenFsMjYrWjB6cVNiWWZpcDJSSzBp?=
 =?utf-8?B?UmFlSG5YdU1mNWlXWUlXN250VEp1OFFVVHBKZWExRjY5dzVkVCs0OEROUENX?=
 =?utf-8?B?OHF2bFZvK2UwZnhFRjQ0Wm40SDlHbjh0MDQzSHNIMWRSa2wwYzRLQityNXBq?=
 =?utf-8?B?LzNwelRGbXVYWmIwTjJ6RnZoNGo2S0tSRmQ1RlgwZjdpbFpoYjhieUEyL1hX?=
 =?utf-8?B?Q0pPcmhjMUpsTXFaYWFzdnJWaWJCcDlLZ3BTSDNqNGNyK0ErR3lWc1BPQWVH?=
 =?utf-8?B?M3p0czZ3UmRNM2dwajhKYmNDR2JJUnYyZTBSTjBkeS9MYVQyQ0hYMUF2NGFv?=
 =?utf-8?B?Q1NPWXpJL2U4OXJKVytDeHl6Sy9FZGVIbllrS3JhbktrUHl0dmx0KzdmT3Z0?=
 =?utf-8?B?bFhGNWRIQ1JhcGJNMDNYM2RuWVI0b3FKT3JFaEVkTjBBVkZUNUVMVDd6ZWg3?=
 =?utf-8?B?MVVZYUJMVUtUT2owYzg3MDAxMWFSMDhPeFNDbE9zRG5JczZhRnBJeDk1RnhT?=
 =?utf-8?B?S0J1QUpPbEJzbzFZY3gvUGhQWFZ0dUNyaUxPdUxtKzF5a3ovTlIyaTRSOWtn?=
 =?utf-8?B?b3IzeW9NUWl5VWlvRHRZV3dzUHR1UlN2dm12Y1NhazhpUHQ4TFJpRW1UblFR?=
 =?utf-8?B?Y2swVElOODNyWTJlaVdIRGtwbzlpYkt0ZWV2RE9IRHBqRTQ5dkVFdlFoQVAy?=
 =?utf-8?B?SGhhcWtKQkJlK1JaSmhEL2NnaTFRNkRoYWRMWmhZVWxCclRGdTVrbXFydXBY?=
 =?utf-8?B?ZHVmNmFEaDJDczJwc1RjN3Zxd3UzK0lHZ1dlYlpJUU5rNzk5TjhXK2ZqYVpl?=
 =?utf-8?B?Ky9ySEJLVWxZRHgzRUVyRDR6S0xLTFk2WmttMUY0TlMwdUhQQ3ZIcGM3Nmhk?=
 =?utf-8?B?UW8xRlFyekhTcGJ6WlJBeU9kY2s2RXowODgvaWFaRW5KKzhZaS91c29YTkZs?=
 =?utf-8?B?RXg3UkdDSFRlRE4reUxIR3ZkOFhoZFR0dHROa2hIeVBRcmdFdFJZV3lGZHVK?=
 =?utf-8?B?Y3pvRW01c3dSaGQ3allmWnhIVnVzclA2S01lUjFycklqN0IwcVJ6NC92VzlT?=
 =?utf-8?B?SUdPOXhDSGtoMGJuRTNISW85TWdoTGZiSDQ2cncyd1FRWmxMNWRZM1lRVW9L?=
 =?utf-8?B?OXE1NHBPR0dHa3RSNitJbUJJYTdTSWtVNjQyZjNJNEFCeEtFVzJJTU5hbWV2?=
 =?utf-8?B?dFlrVnc1SVdNN0xyV2lqdjRMOU5tSUg4ZHlFOTdkQjIrUVBnbTN2cFFoUjRm?=
 =?utf-8?B?Qk9lcVk0WlBVd1Vld1BSbDFDS1hMUitmK1dPTVVBU0t2ejJCRlEzYmpRczN0?=
 =?utf-8?B?SExuWUpod1JjOUhpeE9MN3RQSWd6bHA3WDdEZVROTGoweE91dHh3azFyeXMv?=
 =?utf-8?B?UkljbUNtUW1QT0VJS2pacXJlaU93MTU0OFE0RzRRUlIrT1BNVGlDbTVRMjRx?=
 =?utf-8?B?bTVoczlVL1RNNm5DUlFTSFpUN2lpSExwMS90YjZjNWFjNFk2NFErc2ZSTHlM?=
 =?utf-8?B?a1BiUGE2anpCZVZOa3pTVStuT1hHbnFqQzdUNXAzL0tpNi80ZWF6eE95WE9R?=
 =?utf-8?B?L0VPL1dkMS9XSk1rMFVKU1lIRGxVNDBUU2YydURyWVE3RVArR3AzTFNucmlX?=
 =?utf-8?B?bWRLMjVZQjZJOTYrTUh5OFFOWFVSd3VhaG92emxlbi85MWdHSmk4UkxMZmxv?=
 =?utf-8?B?NTFRK0xyVzZFczBtbjJaSTV1MXV5bUUzYmEwTTZGa1ZhYm84aExHc2JFUTBB?=
 =?utf-8?Q?0D40Mvgje9UqViK57k?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bdba5964-ebdb-4d84-961b-08de601aac09
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 16:14:40.6051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TAwSVbnZXpew5e2esq+Pd1RMAQnlb/lj8ngNdTLr+Gp4Mp3lwcddUW3BXD6u/pmNWNfW9NK8I+DlD9eX3P8Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3418

On Fri Jan 30, 2026 at 6:55 AM GMT, Alexandre Courbot wrote:
> On Thu Jan 29, 2026 at 11:10 PM JST, Gary Guo wrote:
>> On Thu Jan 29, 2026 at 8:00 AM GMT, Alexandre Courbot wrote:
>>> On Thu Jan 29, 2026 at 1:16 AM JST, Gary Guo wrote:
>>>> On Wed Jan 28, 2026 at 2:37 AM GMT, Alexandre Courbot wrote:
>>>>> Add a macro for defining hardware register types with I/O accessors.
>>>>>
>>>>> Each register field is represented as a `Bounded` of the appropriate =
bit
>>>>> width, ensuring field values are never silently truncated.
>>>>>
>>>>> Fields can optionally be converted to/from custom types, either falli=
bly
>>>>> or infallibly.
>>>>>
>>>>> The address of registers can be direct, relative, or indexed, support=
ing
>>>>> most of the patterns in which registers are arranged.
>>>>>
>>>>> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
>>>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>>>> ---
>>>>>  rust/kernel/io.rs          |    1 +
>>>>>  rust/kernel/io/register.rs | 1287 ++++++++++++++++++++++++++++++++++=
++++++++++
>>>>>  2 files changed, 1288 insertions(+)
>>>>>
>>>>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>>>>> index 056a3ec71647..112f43ecbf88 100644
>>>>> --- a/rust/kernel/io.rs
>>>>> +++ b/rust/kernel/io.rs
>>>>> @@ -11,6 +11,7 @@
>>>>> =20
>>>>>  pub mod mem;
>>>>>  pub mod poll;
>>>>> +pub mod register;
>>>>>  pub mod resource;
>>>>> =20
>>>>>  pub use resource::Resource;
>>>>> diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
>>>>> new file mode 100644
>>>>> index 000000000000..fc85dcd1f09a
>>>>> --- /dev/null
>>>>> +++ b/rust/kernel/io/register.rs
>>>>> @@ -0,0 +1,1287 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>> +
>>>>> +//! A macro to define register layout and accessors.
>>>>> +//!
>>>>> +//! A single register typically includes several fields, which are a=
ccessed through a combination
>>>>> +//! of bit-shift and mask operations that introduce a class of poten=
tial mistakes, notably because
>>>>> +//! not all possible field values are necessarily valid.
>>>>> +//!
>>>>> +//! The [`register!`] macro in this module provides an intuitive and=
 readable syntax for defining a
>>>>> +//! dedicated type for each register. Each such type comes with its =
own field accessors that can
>>>>> +//! return an error if a field's value is invalid.
>>>>> +//!
>>>>> +//! [`register!`]: kernel::register!
>>>>> +
>>>>> +use core::ops::Deref;
>>>>> +
>>>>> +use crate::io::{
>>>>> +    IoCapable,
>>>>> +    IoKnownSize, //
>>>>> +};
>>>>> +
>>>>> +/// Trait providing a base address to be added to the offset of a re=
lative register to obtain
>>>>> +/// its actual offset.
>>>>> +///
>>>>> +/// The `T` generic argument is used to distinguish which base to us=
e, in case a type provides
>>>>> +/// several bases. It is given to the `register!` macro to restrict =
the use of the register to
>>>>> +/// implementors of this particular variant.
>>>>> +pub trait RegisterBase<T> {
>>>>> +    /// Base address to which register offsets are added.
>>>>> +    const BASE: usize;
>>>>> +}
>>>>> +
>>>>> +/// Trait providing I/O read/write operations for register storage t=
ypes.
>>>>> +///
>>>>> +/// This trait is implemented for all integer types on which I/O can=
 be performed, allowing the
>>>>> +/// `register!` macro to generate appropriate I/O accessor methods b=
ased on the register's storage
>>>>> +/// type.
>>>>> +pub trait RegisterIo: Sized {
>>>>
>>>> Is this trait intended for public usage or just internal detail of `re=
gister!()`
>>>> macro?
>>>>
>>>> If it's the former, then we should probably just put the method into `=
IoCapable`
>>>> and allow generic-read in Io. If it's the latter, let's `#[doc(hidden)=
]` this so
>>>> it won't get abused.
>>>
>>> It is an internal detail of `register!()` and not supposed to be used b=
y anyone
>>> else.
>>>
>>>>
>>>>> +    /// Read a value from the given offset in the I/O region.
>>>>> +    fn read<T, I>(io: &T, offset: usize) -> Self
>>>>> +    where
>>>>> +        T: Deref<Target =3D I>,
>>>>> +        I: IoKnownSize + IoCapable<Self>;
>>>>
>>>> I think generally `Deref` bound shouldn't be exposed to user. What sma=
rt
>>>> pointers are involved here, and can we implement forwarding impls of `=
Io`?
>>>
>>> Removing the requirement for `Deref` in the `RegisterIo` trait is simpl=
e - we
>>> can just call `Deref` in the register IO accessors.
>>
>> The issue with `Deref` bound here is that now you *require* a level of
>> indirection. If something implements `Io` directly, you cannot use it wi=
th the
>> method. While `&Bar` is accepted, `&Mmio` is not because `Mmio` is a dir=
ect
>> implementor of `Io` and not deref to it.
>>
>> A `Deref` bound also does not help if, say, a type is `Arc<Bar>` which n=
eeds two
>> level of dereffing before it is Io. For consistency I think it's best to=
 avoid
>> `Deref` call all together
>
> Do you mean that `Bar` should implement `Io`, `IoKnownSize`, and all the
> required `IoCapable`s? That's a lot of boilerplate I'm afraid, and that
> would need to be repeated for all other I/O proxy types.
>
> No, I'm starting to believe that the fundamental issue is that the
> register interface does its I/O backwards, and that design issue is only
> exacerbated by the recent I/O redesign. I.e. instead of doing
>
>   regs::NV_PMC_BOOT_0::read(bar);
>
> We should really do
>
>   bar.read_reg::<regs::NV_PMC_BOOT_0>();
>
> Because that way we can use deref coercion.
>
> That's quite a big redesign though, which means I don't believe
> `register!` can make it this cycle... I'll give it a try though.

Hmm, that's unfortunate, but I think this is indeed a big design change tha=
t we
should iron out before merging...

I think you're right that if we put the methods on `Io` then all of the der=
ef
issue would just went away.

BTW, there's a tricky that would allow you to avoid turbofish in this case,=
 i.e.
you would be able to write

    bar.read_reg(regs::NV_PMC_BOOT_0)

Or

    bar.write_reg(regs::PV_PMC_BOOT_0, ...)

The trick is to note that the same name can present in both type and value
namesapce. For example, when you define

    struct Foo;

you create `Foo` type in type namespace and a `const Foo: Foo` in value
namespace. Similarly

    struct Foo(u32);

creates a `Foo` in type namespace and a `fn(u32) -> Foo` in value namespace=
.
This process doesn't need to be automatic. So if you create

    struct Foo { value: u32 }

then you're only creating `Foo` in type namespace and not in value namespac=
e.
This means that you could do something like:

    // Use PhantomData as example, could be other token/marker types.
    const Foo: PhantomData<Foo> =3D PhantomData;

    trait Io {
        fn read_reg<Reg>(&self, _: PhantomData<Reg>) -> Reg { ... }
    }

    // Now no turbofish!
    bar.read_reg(NV_PMC_BOOT_0)

This trick is heavily used in `syn`, so you do `input.peek(type)` instead o=
f
`input.peek::<Type>()`, which I find quite handy.

>
> <snip>
>>>>> +        $vis struct $name($storage);
>>>>> +
>>>>> +        #[allow(dead_code)]
>>>>> +        impl $name {
>>>>> +            /// Creates a bitfield from a raw value.
>>>>> +            $vis const fn from_raw(value: $storage) -> Self {
>>>>> +                Self(value)
>>>>> +            }
>>>>> +
>>>>> +            /// Creates a zeroed bitfield value.
>>>>> +            ///
>>>>> +            /// This is a const alternative to the `Zeroable::zeroed=
()` trait method.
>>>>> +            $vis const fn zeroed() -> Self {
>>>>> +                Self(0)
>>>>> +            }
>>>>
>>>> All types that impl `Zeroable` automatically have the `::zeroed()` fn =
provided
>>>> via the trait.
>>>
>>> Yes, but that method from the trait cannot be used in const context, an=
d
>>> `zeroed` is the starting point for building register values from scratc=
h (and
>>> thus constant values).
>>
>> `pin_init:::zeroed()` is a const function.
>
> Ah, I thought about using `Zeroable::zeroed()` at first, but indeed we
> can use the function instead.
>
> Strangely though, I expected to be able to do
>
>   const V: BOOT_0 =3D pin_init::zeroed()
>
> and have the compiler infer the generic type, but for some reason I have
> to specify it explicitly:
>
>   const V: BOOT_0 =3D pin_init::zeroed::<BOOT_0>()
>
> Not a big deal, but a const method would reduce this to=20
>
>   const V: BOOT_0 =3D BOOT_0::zeroed()
>
> (for variables `let v: BOOT_0 =3D pin_init::zeroed()` works fine.)

That's strange. Do you have a MCVE for this? I can't reproduce what you
described.

Best,
Gary

