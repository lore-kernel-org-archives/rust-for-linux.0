Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022115.outbound.protection.outlook.com [52.101.101.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DA03ECBF7;
	Wed, 21 Jan 2026 20:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769025672; cv=fail; b=SRsQR1YSxdQm10z6DniTkdWzKm9sXs2IInPTtM7/darEIdjHZlOlWGBF49PHpDQogBYqOnD5yNr2A8ZsxjoiEhlWqyE8R1TrPWOpQYGh2zyGEqKrgvrWbSR7TDO2w5rK4v0RN5IuvLaJ5bB9GSFE6yoLsY4Al7jwj5CNsplu3x0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769025672; c=relaxed/simple;
	bh=v8ox+eyOdr6Rz66173Ga6Z3VyChgd4oauJqpSlbOuSg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Osa8nraHHbvuA9dKsCPsGjU88YAoxievSYcUjqMp93HhAOMBtj3NxqvUixFpaF0cffyLzaMiK++T4jFlm9dhGIAgF5PSVZmO7kQIEva8Ia9jWT7WWk1gmloeVhaN13wv9Y70ug1IgxwF4BCof86fT/h/Yw/AKionGYkJVhNAWZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=MCzHJzoH; arc=fail smtp.client-ip=52.101.101.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="MCzHJzoH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sl7/OJi55vVHviO8hEbWdLpwdaiHiOqpevuXoq+KC3qVV7N0Qp4XJMplcoB7AypbiPiMSN72WyP50kbsufhtORTrCKXKLyLFyvYVcWXxxfJJwpUz5mTpFtCJnpVkzGH3OqYyuvZorYnmS/LUj4dy4NxyI0jpJLj+FizAB8LasoyeO6OluuaaYirWOOw8zEsjkdmIkc+9GexLYkr88j9TUIEGgocL8piQs7m1uh8TG5y5ajz+g1vR6mtjHE9OiLZSioCDYQp9iuhZtkMKyYe4CbdvinplO62rcAD3j/7JPJPFSVIVly5zNiyIrQY+F6jGsgTzFIAVqa890nQwZfDwYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msAMhTQxhQrTmA0VcspRSoeamY9WOcM2I3UkAydcJZs=;
 b=tYR+qhJf2x6okZsXAcwk90ZlplNvnIVJlA/55hYTA9yXUUsaEOYeKCynGsQETPSNArDt9xYv1FBQaekcXqvda2n48jBzA8GOtdnxJCyaIFvwCI6qc24U4lJ2tsrWAWOn/kihVVxJEtROwPVAV+JAA/wo9snIzFu5rUHlmdnmFEFrm3JP59A8KHoykPxaBdaqkii3MIIK9hJRlymt/uV3u6YLZT9+dV+zjNvgySYhKvzrLC7U5f8xjQed+vTVSj1981KYaGY/P+rLfTxs2rQulKQxmObBvun972HMQiqT3klmp4w65XuXiaoJbVoB5sGIrStg2/Le7Kze8k3TZqedRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msAMhTQxhQrTmA0VcspRSoeamY9WOcM2I3UkAydcJZs=;
 b=MCzHJzoH3Goi6aeyzvTcrH2RYYz2iwVOO2dtKORcumFoPFw0t6Gv74Tp6tKy47qU6wtNqBaUaHRMY5/4rUSWZslpduNqCQe3hY44WKUi2BCWaZXfykV57OfITHn7maiWkF05vAvLaNfDwEaHLh/4F+5IvkiZrHkPEdFso4i6+IU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB5761.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:262::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 20:01:03 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.009; Wed, 21 Jan 2026
 20:01:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 20:01:02 +0000
Message-Id: <DFUJ9ECRB2GJ.ZK9ZCKMIFQYJ@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: disallow use of `CStr::as_ptr`
From: "Gary Guo" <gary@garyguo.net>
To: "Tamir Duberstein" <tamird@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260121165835.4097975-1-gary@kernel.org>
 <CAJ-ks9=J564pjPbMBaq5MOHy2W5MhyghR-0B1B4XwWQVVnEOSQ@mail.gmail.com>
 <DFUH3PDOQCZ2.2QQSIB9IQIFO1@garyguo.net>
 <CAJ-ks9k30H8wWii-3MDiMiMQNzhA=TgvyiEkWnxkrrMqDUxyTA@mail.gmail.com>
In-Reply-To: <CAJ-ks9k30H8wWii-3MDiMiMQNzhA=TgvyiEkWnxkrrMqDUxyTA@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0144.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::36) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: ec116306-0553-499f-c15d-08de5927ce44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGRWWkNEdHpQSlFpbFVXMmIvVDhoeGdsUEU0eXVnY1lBNWtkT1pkRVMzUjc1?=
 =?utf-8?B?TkdiYzlMTHJSakRPY0h3VndNQUw1Nkp1V1Z6NEprbXlOSHdINkMxbkpmeHJa?=
 =?utf-8?B?SXZJT0w4L1A3aGE2aUZrTXdUODQ2WTZncUtlMEsxWW9rZWZDLzdsSk45TnUz?=
 =?utf-8?B?RC9PZEVPTDEyOHA4RklITXI2NTVKSG0zQ1FEeFMwc2VSVXNoaGpvUnVOa25x?=
 =?utf-8?B?Q3lzd2lOdGRLdnFIWHV4VGoxTEttVk9lbnpJWVd3Y2h3cXBNRVpGQy9GaHdU?=
 =?utf-8?B?ZnNZbjU0M3F5c0w3Q3pCL0tVVm9RaFFMaWR5UjBKL3J4SFJKRFFLWDI3d1l2?=
 =?utf-8?B?NUNWZFpUZkdGUWVQQndrK3Y4ZW1OUDNPTDQrdTk5WU1Jd2w0Uk5JRUxYYlp0?=
 =?utf-8?B?TVVIWkZLZHVOSTNYS3EyaGJnM0RnRDNJQURyWFZnakZQWHpuQ3JGTjR0WDF3?=
 =?utf-8?B?OGVpcUs5R3JhcU5zSWozc042RlZ5MXFtQlM2OGYyN0g3TVlKdnFXS2dNcVg0?=
 =?utf-8?B?cTBUU3c4MnFseWZNVkFTU3lSd1ZVQ2p2MlRZWWQ2N3lwbjhoc00zakhlcUlT?=
 =?utf-8?B?SFdTNmFLLzFjcklGVFUxZUp2empEMVg4M3IrMGR2bXRMOTVOa3hKclhoSGlv?=
 =?utf-8?B?QUoreFgzdnUzSU1HR2FLWEFjRHN0NXFPdWsvTlhKWUQ5Y29DUXNxTnl4emJD?=
 =?utf-8?B?VHhidXFDV3dGUXdUazF3TUM3cmdYa2E4QU9uVys2SFNIYjllb3M0TGVPRjdO?=
 =?utf-8?B?NzJ3dWlaam05M1VrbzE2VXB4Rnl4cDhvMlkwUXBuVHRkN1ZzQmtaOXlFV2Z5?=
 =?utf-8?B?T2dHQzhCdTIvdjRJRHIySnFhTmNlQW5vV01vNkNQZHFza3NJYksrL09kVFNR?=
 =?utf-8?B?ZXYzTjdiSGlRMGNyeG5UYnpyY29tQVNOUWtwL2xmMk94Mk5iVERZVTFodzhL?=
 =?utf-8?B?bjAzMWpHM2wrbExTUWZhOEZnUG5BU1hNSWo3VG9oWWdIS2J3N2NybWZDR3VY?=
 =?utf-8?B?NzlUM0xPRjZZUndYZ2NzM2VQZVhsb0lJYWxUdXNXbkJoZ0dLZEJ6c01pTFVO?=
 =?utf-8?B?aHNEdkpiSmdpb1V2WnB2cVBLSnZBZHQ4VGJKYlg1UnVRQ0lHOStxRFZzZ0JD?=
 =?utf-8?B?M1o0bVIxcS9HQ0pRNjh5Q1RHWWhWamRrcGZhYUo4amJ5TXFVMHVxNnFNNGZu?=
 =?utf-8?B?YUloYkgwZXpEc1ZCZ2lFby9Zb1IwOWkweStsTzRNdUMyRjJnK0REaGQ3ZDho?=
 =?utf-8?B?RUdicHAxcndJYW1rQzVDL0VRSnd4cUJwZmVDVXpHR1NxeGZsTEpnRDZZVnVU?=
 =?utf-8?B?KzlCbzFXSEU5Rmx4ZXF0TEl6ZWVIK2lVNDRLcjUwdlNxam9lMWRVWW9EM2Fn?=
 =?utf-8?B?NEVDcUlyK3ptS2pUcU9YeEpXaitkLzRicmQycVVGVHRFZ3lnQklnaXNvUlgw?=
 =?utf-8?B?RFRqYk5HUUJTTmJGSmcvWVVUOTVBeW5pVUVXRWFkaWhDOXRjd2lUb0VQZ2RI?=
 =?utf-8?B?YjRxaVFybndseVNJZk5qTUFPSXVwZ3BLalVjVXREeUxqSUhYTDl0ajFhVjJY?=
 =?utf-8?B?eFUxRVY5a21SZ1JLT0tHcVpwbEhwNkRVWVIwOEV1WGZ6WHdjK0VONXVVWWps?=
 =?utf-8?B?QzVNQnZ1NEpjNDRuRnpaOWZoVWQ2TWlrQVFWTFRIU1B1b0RNcEZTNk4wRUhH?=
 =?utf-8?B?cWIreEh4T1BzczJjd0R4Um9rVi9hSnl2QjVmZE1RYWlpR2RyREdxbEV2L3d3?=
 =?utf-8?B?T2thRGpGNXc1OWlHRWxKM0RmK3pzb0lCL3VPaHZUcTZJUmw3U2VNQW1EN3hk?=
 =?utf-8?B?anc4N3pmaHdpbjJwZHJZRC9BQzdtYnlKZnVwcW1WcE55dVNxNUd0RGZUY05H?=
 =?utf-8?B?ZEJvKzVrNnp4a1REc2J4TUs1Q0J2ZVg0RzE0TkRndWVFWFJMYlNLZTRTQUdj?=
 =?utf-8?B?bzh2SjBDOXh1R3V1VWVKVlJaOUZYd3ZlRTNuQ1FxWWhwOFpva3I4YlpiTWI3?=
 =?utf-8?B?T1RISW5MbTNIck5ZVllPa2pTeWFSc3lHc0VheXdNalVYMGQwV09GSnZ3SFJl?=
 =?utf-8?B?U3ZITGovWHNsN3YyWnNKcElESjVvQlU5U1ZheStUemdaMDNESjllaGV1RE5j?=
 =?utf-8?Q?GkT8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlBnVTRKWHpFcTI3akwvQzkxRmZsVkpFOHRYbDYyK1J3SG52L2hmS1BqYlUr?=
 =?utf-8?B?V2xyellzS0I3YXlNNXdZc21IMWVUSTZ2eEU4Q2ZyaVNKYXdsMEJFS0JHT2Qz?=
 =?utf-8?B?YUJPK3BESGNPaWdaTmFiVU1WaHhpTk1pQVhjVFQ2WnBneUprQlpQOEtseVkw?=
 =?utf-8?B?Y0xGUldNREQ4K0RHdEpqaE1rckQzNnRtbVhsYjV6eDdBV3J2NE5Rck84ZkRt?=
 =?utf-8?B?Yk1aWXJ3aitVQStGaDFHa2lWYWJIOGQwU1Q3MWR3NEVRelp6T0pMWHNwN3RV?=
 =?utf-8?B?WTFRa1ZUek1UL1pHN0wzWmJnOG5hWFBsNy9sL3N5QWpqZXo2Zys4OUFJR3du?=
 =?utf-8?B?cUN6R2hBbGV1ZGx6R0ZNdGoxS1pGTS9oa0dyS1NFRDUvOHNQTFdCVUw5bmNr?=
 =?utf-8?B?MnZyTExuRVRpZVJrM0pNVDdKblU5dThKZkJIcTNWOHcyVVBpdmpaZm9HTU1T?=
 =?utf-8?B?eGFGakRlOFBkVGFlYkEyMW5IaHdiTFN6bG9vOTBMZ1RQOTlCTWtjLzhoWFB2?=
 =?utf-8?B?MHZJZXFDenluNE5oQ2NraDZ4MVRQTlUxQWIwN04rbC9WZTF0ZVNoZG90WFBW?=
 =?utf-8?B?a0M4cC92cjE5K3lhQkRaWDlBa2Y0T21Rd05aTzJacUpFL3Y0V2tTUno2TUNH?=
 =?utf-8?B?TWhLamtQNnRsUkg0QnlkSmwrSThOL0czL2tLQXpWdkYzTnpqQzRTM0NVVHNm?=
 =?utf-8?B?emNEWUw0WCtwTisrVmdlMElIVkJkaGovRDhZQUhvakNrMTYvOWJYcVhmQUNU?=
 =?utf-8?B?OGJRY2FFTXRmaGV6dUl2V0ovcnlFbW5ka0VreDlGdVhRWGRqclVIMjNZS2lH?=
 =?utf-8?B?VEhsaWUzc09NcFRUdVVaSlA5eWJmZTFHSjIvV2tXNFJqaElhUHZkUkEzY2Vu?=
 =?utf-8?B?YndRdGIvQmFCdjZBc2oxOE9wTmhCbmpwTDMvMHN5WHRnL1RxWGRFdWNHMU02?=
 =?utf-8?B?aHdpYTk5cmpPbHdJVXRZbWtXejZTMllmR3dBSXYvOWNLRy9OQVh3cG5ubEtt?=
 =?utf-8?B?MkZNWEM2WC9QeEFPUkY1YVlTYVRrRmZVK3VYaHJNekRwZGxJckNkYm8zTVdO?=
 =?utf-8?B?bGNpTFcwZW92ZWdDM0huWm5NcHpBZFhja0VOc0VVYjFuTGxWdmsvcWNaNWYv?=
 =?utf-8?B?Q1JRVzF5WXdsUVpFVjI5dS9ueG14Y2JNM1ZlL2pLVnhvWlgyRmVaZ2xtdjR0?=
 =?utf-8?B?ZXEwTS8wVno2NXJIa00rbkdhNDVMNmJTL3pIdmpoWHl1YW5iT0pxeFU4dDND?=
 =?utf-8?B?U1lNMFBXT0hEcVBvQTE4WHBBUDR4V0VWbEE5dktBQmk3d1M0ZFVwVUN6anNF?=
 =?utf-8?B?WVpuOUJ6RXJvU2xmZVBFTklaa3pwSVNCNG5EbmcrajNpemluMjVZRkFxNlZp?=
 =?utf-8?B?dEJYTElFSTA3bTg2enB1cVZyTkZCQjJCbVNhOU9VU1NRM1Z6cWFDRGRCQjdh?=
 =?utf-8?B?TzdiSm1EUGgvcVM2Y2NHREovWDJkclJZbzloQjlOR0JFZHNPdVI4Mnd0WDdm?=
 =?utf-8?B?dmdyUmovYW1SRkpjVEI2cmY3aXNORSs5NmVCQ0t3anJXUzY4a0xoNmpvdjU5?=
 =?utf-8?B?UVdoU0hwWnRBdGx5OGg1MUhKTmUzdmpEcm9wMmZGQmk5anQzT3hOdVRRMnNX?=
 =?utf-8?B?bEdQTTVaakFkbEN1c0lNYzZ0Q3RRUEtSbnRpOGJTTjIwRUpnREZVZTY4Ty81?=
 =?utf-8?B?dllOZkFQNWVqM0pmRFg3ZytWL3RHbnd0M3AzQTJUbFV6emFMdCtsbzB3QVpp?=
 =?utf-8?B?eHl0MzRJeGNKYldERjBiZzVFdUJ6YTFpU3IvZUR6VWlpUG1pVmEyb2dWM1Ju?=
 =?utf-8?B?YjZoV1FwZDY2eTZ3aWkxOEhmZVE1VkJnVFpVTm04MER1QmNBTkUwZWV0aW5w?=
 =?utf-8?B?ZDNmNTVQQXlLTnNZQjRhUjVJNmhKT1hVRTQ2d2FUSUVibmZvekpERmtYUFpr?=
 =?utf-8?B?enJIeWgxeTNaOW5NNW5XUUJvWkR4Q2t0cmlnMng4ei9jaklhTE4rTk5lbHFD?=
 =?utf-8?B?S2I0L1RsM3ZsWm1GR1JheXJXVUFXRi8wWmRKbW8xZGdGTllsVGJqekVFWkxr?=
 =?utf-8?B?bFUxTUcvZnJUTEozaCsrdlZId1pMa0FFeTFHV3ZZa3g5Z3Z2RFJHTk9UUUY5?=
 =?utf-8?B?bFhybkJQMTJUUS9qQ3d6U0R6eFZpdFNESzZiRmI4dlhZMVVFQlNFcGlPeUN4?=
 =?utf-8?B?N2JLSU1vbm1oQ3k3aW1lanZadUgrbDloN3FURk9YRWlVWnVFclhpbFhxNEd0?=
 =?utf-8?B?cWRDdDdmVmVxRzAxaGt1M1JvZXRkdnZCOFpMRE84a0NnbXliOVVJWTJMWWhD?=
 =?utf-8?B?YzYyaGVHWFhycGVQM0Iwd0ZyVXZxbk95Q0owRTJLdjZHTzRPNXpQZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ec116306-0553-499f-c15d-08de5927ce44
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 20:01:03.3193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OK1m5TRl2gQcMu2tP7J5Wujs9uCzq43JYitSbnNwKMQAI9wj/1evDaprPN4MpDVQm0iKffXIpHqNNdW3ugJ4Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5761

On Wed Jan 21, 2026 at 7:45 PM GMT, Tamir Duberstein wrote:
> On Wed, Jan 21, 2026 at 2:38=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote=
:
>>
>> On Wed Jan 21, 2026 at 5:55 PM GMT, Tamir Duberstein wrote:
>> > On Wed, Jan 21, 2026 at 11:58=E2=80=AFAM Gary Guo <gary@kernel.org> wr=
ote:
>> >>
>> >> From: Gary Guo <gary@garyguo.net>
>> >>
>> >> As kernel always use unsigned char and not the platform ABI's default=
, an
>> >> user should always use `as_char_ptr` provided via `CStrExt` instead.
>> >> Therefore configure `disallow-methods` feature of clippy to catch inc=
orrect
>> >> usage.
>> >>
>> >> Signed-off-by: Gary Guo <gary@garyguo.net>
>> >> ---
>> >>  .clippy.toml       | 5 +++++
>> >>  rust/kernel/str.rs | 2 ++
>> >>  2 files changed, 7 insertions(+)
>> >>
>> >> diff --git a/.clippy.toml b/.clippy.toml
>> >> index 137f41d203de..fd934bc04242 100644
>> >> --- a/.clippy.toml
>> >> +++ b/.clippy.toml
>> >> @@ -9,3 +9,8 @@ disallowed-macros =3D [
>> >>      # it here, see: https://github.com/rust-lang/rust-clippy/issues/=
11303.
>> >>      { path =3D "kernel::dbg", reason =3D "the `dbg!` macro is intend=
ed as a debugging tool", allow-invalid =3D true },
>> >>  ]
>> >> +
>> >> +[[disallowed-methods]]
>> >> +path =3D "core::ffi::CStr::as_ptr"
>> >> +replacement =3D "kernel::prelude::CStrExt::as_char_ptr"
>> >> +reason =3D "Kernel's `char` is always unsigned. Use `as_char_ptr` in=
stead."
>> >
>> > In the disallowed-macros section above we seem to use sentence
>> > fragments (no capitalization, no trailing period).
>>
>> Ok.
>>
>> >
>> >> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
>> >> index fa87779d2253..08b8e2ebc8ad 100644
>> >> --- a/rust/kernel/str.rs
>> >> +++ b/rust/kernel/str.rs
>> >> @@ -189,6 +189,7 @@ macro_rules! b_str {
>> >>  //
>> >>  // - error[E0379]: functions in trait impls cannot be declared const
>> >>  #[inline]
>> >> +#[expect(clippy::disallowed_methods, reason =3D "internal implementa=
tion")]
>> >>  pub const fn as_char_ptr_in_const_context(c_str: &CStr) -> *const c_=
char {
>> >>      c_str.as_ptr().cast()
>> >>  }
>> >> @@ -334,6 +335,7 @@ unsafe fn from_bytes_with_nul_unchecked_mut(bytes=
: &mut [u8]) -> &mut Self {
>> >>      }
>> >>
>> >>      #[inline]
>> >> +    #[expect(clippy::disallowed_methods, reason =3D "internal implem=
entation")]
>> >
>> > Can this be inside the function, on the `as_ptr` call itself?
>>
>> You cannot apply attributes on expressions (yet). If this is to be moved=
 into
>> the function, there needs an additional block, which I think is just
>> unnecessary.
>
> Thought so. Should we add a TODO that links to the relevant upstream
> issue, or track it in
> https://github.com/Rust-for-Linux/linux/issues/2?

I don't think we really this need this.

If Miguel thinks this is useful then he can add it to the tracking issue.

Best,
Gary

>>
>> >
>> >>      fn as_char_ptr(&self) -> *const c_char {
>> >>          self.as_ptr().cast()
>> >>      }
>> >>
>> >> --
>> >> 2.51.2
>> >>
>> >
>> > Acked-by: Tamir Duberstein <tamird@kernel.org>
>>
>>

