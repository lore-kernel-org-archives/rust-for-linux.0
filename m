Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020102.outbound.protection.outlook.com [52.101.195.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81923370FA;
	Mon, 26 Jan 2026 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769432935; cv=fail; b=JZFY4Euy0eZlWE1T6MUBo87yROV2qpDyXWxK190p1yEdcpaN5GNbKK0C7zWG42/pOw5zw63xAlFIwe0dkxU4BSvPA+Prsn5n3cdy0OnfpKZBclDo/hAv6wLnkwKvtq32M4RgIL/N54U3P058lZCPh+7W99vKHH1IWH56IpCgs7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769432935; c=relaxed/simple;
	bh=wWuGOfqoajDmmvKMZcK1PoQzskNCkRA4MKGgreBxZW4=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=gcIFLLfhlO+Aa6IA8+E5IogX0psnRNERkkAtcFDF+orosc0G5rCU/QOd9hsVZ0cC8TG9UFNMSu5/Qhs/Lpi7pC0flL4TE4wE4OXheuKfj9JD0FJC6EbV4XQDcAuzKqvH3ebza+rPvKzaGmMfpLP/W2VRZtd9QxyWqdfcyboMdYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=SgsDm5ly; arc=fail smtp.client-ip=52.101.195.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="SgsDm5ly"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJzV5tSS6l8E1NzBeTdrcBqMf5gM8hAGlIQ1C87vEKZTss064oWM80qBRUG7Xk1sZGpsqI9BXbp8Nd0T40mERrEWD4hP0S6L3pqlgtt/DAHMeIoUEhoCO3Z+9oJcrbvNrB9pcTTMcSW3Qw6vVJoNZiSONLFikjDBjlgtCzx5+dEaLt6vpWwJ6FmM/aFl6hm+28S8ld0GA4It7vTb4m8TPo9gtjO9BO4NMjdTIiUbvf9QvJ0vk9HUC/iVaMPCNGya4tG2UhpDky6LMHwjNcT3sBwUi9Ic11Vs8v1gt/8ARSHRWv31eBAoBFD8NX18uAww4bchllk5784OpNRR9/MxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QU/Efp0vXP4XCygrGWHEsPNXoS4+DlWDNC7d4ta5W14=;
 b=Agq3GBkOgrUxxFJX8rrSH8vAr9wEIhvm31R25oxV7rcQEBCPg0dPyF0tPlBBFWyOYKuBmLujESyiZj3//uA+Wy5US9wcFR03lRPTkinX0UtTbLU1d/kJK8o/2MNcKU04i3aySUZLSXE0MrL6ZiUeCSNBqA/MtcU9wj8VXONbEfKG5A7S/7ZY4EvWr5174jt2Ml3wHCz0WIhiryJpCjK80gYcsd+UkAiUI9dCuVRGBHRqQVcrVDE3+jGsuMjesatQvfKP9Kvi3Sem/05TVUl0Ewv20t9K+e6Nx31pri6sEFrfhjG7ua7t0tNBnUIkAMa0kVQQajWAhNtO0dELPLNpMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QU/Efp0vXP4XCygrGWHEsPNXoS4+DlWDNC7d4ta5W14=;
 b=SgsDm5lyioJ+nX0vQ5ANWyDzxmY3loI8XfSaOTYySnuX+hhk/lSlNLmy6WhGoZkBaDwRyW3fUMovLb2b53SurHYuLpXOTZmP1j6olrncHlx6QVkq8wKaQRYakqQUTlbDwfMLwoSccxNY85DbH7t4aEN1KeR0FqJy0nIfCp3jkNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2022.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:83::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:08:48 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:08:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 13:08:47 +0000
Message-Id: <DFYJMH9S9RHC.34AA6HRKPMC6X@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Gary Guo" <gary@garyguo.net>,
 "Danilo Krummrich" <dakr@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 29/31] gpu: nova-core: Hopper/Blackwell: add FSP Chain
 of Trust boot path
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-30-jhubbard@nvidia.com>
 <DFUEWBKOLFQ1.3NSTFO4L97503@garyguo.net>
 <01b59562-9d90-459a-905d-56de1bc05433@nvidia.com>
 <f85c4bb9-2fb0-4dfc-9a07-992762df0822@nvidia.com>
In-Reply-To: <f85c4bb9-2fb0-4dfc-9a07-992762df0822@nvidia.com>
X-ClientProxiedBy: LO4P265CA0212.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2022:EE_
X-MS-Office365-Filtering-Correlation-Id: 88a96d0b-5ccf-47e2-0e94-08de5cdc0b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emdmYkd1Y3BVWkd5K0JVais4UDZDNWNYVmlvMW9SV0d3R0pKRXdXV2FuWnk4?=
 =?utf-8?B?THFnbmxRWU50aS84a1ZJbzZEcHNzcGliWkRQWWxuRFJyZjhtUkxKNGgrSzhK?=
 =?utf-8?B?OEcyT0c0M1FCN1NWeUxJSnZ0ODFoaHhlZ0xQWTF4NzdtbUFCbnpNZHpYSmQz?=
 =?utf-8?B?cFBZRndVUFYvdlZTV3Fpamlwc3BpMlcyTnlMV2hrRjcrS2RGUnBrelN2d29z?=
 =?utf-8?B?OWZpWCs0cU9wMzRHclgwQ2lwdWhrMmRlc1dhY3hicHk2OUhLK3JGcEtvemdy?=
 =?utf-8?B?YnRLNmNMZGRVOW45aE1sSEtxelVLdm1GemQxUzc2cnRIdk1sRE5wWFp6eDgr?=
 =?utf-8?B?NlVwaElMTFg3L3RpZWhFMDBEb3UxT0xoMi9hMmkzV1lFSk1vUkd0Q2hHUm9C?=
 =?utf-8?B?eHJxRG5iVTFkS1ZNT2NnVDBPUkdlNldqQU5DMDNmRkZKTEh1QWZzNHBUY3Z4?=
 =?utf-8?B?Wm40RDVRMUdsb0NnTE00R0pYbmx3S3pNREpFMGFOeDh0OEFXUzR3MlRJaU9Q?=
 =?utf-8?B?OEJBcHVCU29iRDFwREpFT1pPNGpxOGNTeTQ4M1Q0Umt5ZXZ3TkJnREJXdVZs?=
 =?utf-8?B?akRJbmlBRlU4NDVZY21hSURadHBsRmVVcm5zQkZmREh3WHFPTHFHOVpsYTJD?=
 =?utf-8?B?eVpkOTZjb2huQWpMVHorKzFrV29rR1RTelNSZTMyT1ZvYXZROHp6OWdyeCtj?=
 =?utf-8?B?aFpYem5lUkEweisxT291akN3TTNzWUF0bU1ueTNPRGRtRXp5eWNReUxqWkVC?=
 =?utf-8?B?THh2M0hyaUZ4NFVVRnhGZTVVR1o4Tk5EcG5uUnFmRm9nUXN4RG8xZG9aOURT?=
 =?utf-8?B?bWxRaEVndnJWVEE0MXIvZkVrL1ZEYS9nQkhCOVFYdy84cUNOMkFmQk54ZWtD?=
 =?utf-8?B?L0t5N09hTjFvdnIvMndjNE5jNi9VbWdIbEI3dGJxNTdmZUhtQldMWEZ3UFNF?=
 =?utf-8?B?VHNibDUzclJFNFRpZWNpTWUyRnJNaHg5SWlqa05nbW9UeGVXLzlPdjAycGVZ?=
 =?utf-8?B?YzFJdy9wRE4rcjNvaGZUZ09naERkS0JndzNsdDQyZWxkZ0FXZjVXOENWUkZT?=
 =?utf-8?B?SXAxRVY1d1BkbEhTcmh6RXV0dWM3aU1WSWo3Z08wT3A3YUt6YURPVy9pTlY3?=
 =?utf-8?B?cDFqVSsraTN4VkJUb09DZ0pvVjFhQWhiR2RUQXBOVEwyblk1eHJYMlRXa2JF?=
 =?utf-8?B?bzRJbWFicXh0NFNHTTE1aElyVktocjNaNTk2eWpadENjL003cUVjVEZLVTBG?=
 =?utf-8?B?cnBENUxPaElJVmoxMnNtR1BDWnRncVFWUTVtVHI3SUxUV1EzYUcyYnJqWDdP?=
 =?utf-8?B?SHN5c1ZvZVd4L25KNHZHUEsyQ1dYTTJBaklVNmtURmU2V29NdFRJeXYreE9z?=
 =?utf-8?B?c3R1VXF3Vmk1VjF0UGVJb2hrakErY0d3djQvb0MybHlwcTRsdWlhdm5OS0dT?=
 =?utf-8?B?c3RraDROSUhkYmNxVmIvQUtBZ2l2cHczTDRHRVBrV0pENEN3SHhvbW9LNEc3?=
 =?utf-8?B?UFgzY3JjYmxQTzgvZURzQ2dLMG9nZ0FtTEs1U09ZSzgzanNEempkaWVKcUhV?=
 =?utf-8?B?QmtSZ3NUbXFNcDhzYXlQOTN3R1dUQnNZMk0yY0JFTFZUTHN3NEtTR1RHdWJ5?=
 =?utf-8?B?SStLQ2NUYmhxWTVlL3NZbXJMWWNTTC9uNVF1bUdlSWJONG1YbEh5UTRScnc2?=
 =?utf-8?B?K0Z1Y1BneUMrTmxhdTBYb1EwSWtjOVYzWnpJNFoyV3IyK3IrV3BkdWtkdXVF?=
 =?utf-8?B?K1NUK2FyUjg2MlJSMmhmT3p1VnJTWTdrb1hHeWtSdlk5dkR1OWhLQ0V1b2ZC?=
 =?utf-8?B?TTRWK0lKa2FzUWNOVnhEUUxWOGlwazdXNkVLdUtjVHl4K0Q4Mmk2eTgzMW5h?=
 =?utf-8?B?NytkTnBWK0dKOE04MFU4cHlpSndVVG82NHlhMVBnRDIwZytLMWZtRjAvbWxN?=
 =?utf-8?B?Vm5FTUQ1bHYreUZpTTFyZ3dzb3FZa1o4Y0dha0d0QW5GdVRaYlRRcVh2dUlr?=
 =?utf-8?B?dHlKQkRoVFVzeXRoMER2Tkx2b3lORmVrZ0lqWjNBZXNIRzdMcXZhRHlHVFV5?=
 =?utf-8?B?OHpjc1dpTW5EWU9kRGNwbDlVaEFnRXVuM3QyWTFLR2hBZ3Fsc1lESWVQYkpx?=
 =?utf-8?Q?Xt8c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTRPMDM2MEgzRnV5VG9KMlBoZ2Y2d2xYZWF6K3IrWnJGUHdPbTdXaWhWOFd5?=
 =?utf-8?B?eHN2ZXJ2ZlRtRnBwTzBOVjE0NVgzWkdBMkJjbHdEczBySTBXUVkxSFJvWmJa?=
 =?utf-8?B?NU9vNWY5d25sdlhoK2l5dXV5MTJzSFEzYmVBSkdYMWIxYXZGeUNiQjFkMElr?=
 =?utf-8?B?dURPS2IrVGprOHZieStLMWRXMGp6TGdwRnovZjYwZUQyRHRQM0R6dTlBWXUw?=
 =?utf-8?B?NVIxNmJMcjUyTXJ4eEMxajdGM2cvY2dDdlg3MkxKZVp1YTdYei8xYkU2MEtE?=
 =?utf-8?B?OUFCYVBlL0lLQVZpY0JRdkwrOU9LODB6R3UveU41MVR5cEFtc21ZS0p4RUhW?=
 =?utf-8?B?OUdKQU8xVGZyN1Fldk40QjArRWhDMlU5eDVJMU1hTHJrd2hSTm5zdDlHVVNx?=
 =?utf-8?B?dkl5SG5BUjg2MncrZmx2VTRub2o4d296eVBDMWhxRlM0RHpOVDFwMG1MNFFX?=
 =?utf-8?B?MVhTakZiaExiTTBBYW80YkZnZjJHZ2JNR2FyNVVnc2ZtS0hqR3pnbHV6U2FU?=
 =?utf-8?B?U3orS0pWQ3pVY2lkS0kwMEdiNEJ5K1VrYU4wekFFV3FBVnlOeFE1VS9tSCtT?=
 =?utf-8?B?VzA5Zy9scy8rcEZRR2JNdCtNbGNjemlFYWI2ZVIwSnM1dDdMdkdHVWlpSDk1?=
 =?utf-8?B?YTFITDBPRFZCUG93L0E2N1BlcHdURFowUTFRZWJXV1hhVXVJdWRObUFwQmJB?=
 =?utf-8?B?TVNMSmhzbW1VSE9yMEFYekU3QldrdnR0SHZ1SHBuWDlidDZ1WjR3L05SVUJE?=
 =?utf-8?B?eUxpODFTZnNJL3FMb25hVGdpNGVELzJzUjlOZXBBSWwwemdENDNFcU8zc202?=
 =?utf-8?B?d3NPRTRLbmh3dVRxUkpkeDdOeE5zYU8zV0pYbmN1dkNPdkUxQXBSbWVBMC9N?=
 =?utf-8?B?RWRYdEExOWgyZE9WeW5xMEgzZ1lodDlleDVBdjI1eEZmQ0hUL1BnRXcvMVFy?=
 =?utf-8?B?MnlsK2x6RXdJMityOXA3Y3JnaXNFNmxBWjdYb1pJWUNjR1VJSUZJTFlpNE80?=
 =?utf-8?B?SFlyaGNDcWdoSmdSN05tZlEzeENEcHBCeElONlhFV0tpejlIVktua0hOK2c1?=
 =?utf-8?B?MG5hYkp4UTkxRjdHOUh4bDE4N3dkTHU0a2xnZktaZWkyQVNUR2xYRElaeWpG?=
 =?utf-8?B?bURXZ0hkSGwrWk9uTnFjN3BMT2RoOFg3MTUxYk5Jc1lSQ2loajVLVk9LRU5U?=
 =?utf-8?B?dTlzZlFiNXkvZDM4cnFmaERrOFFXVkpGZFpZaTFOSDhJL0pmOUVaUXQwbWx2?=
 =?utf-8?B?bUJtVW8wYkprRGF1MEJGc2VyQzdEbXlaODlhMExlSFY5QmVjUkZFazJrTGgy?=
 =?utf-8?B?UUFheHdZdTBvK0RxSHcrcEpmcitKY2dVUmFRY2NwcG1hR1ZUbFF6WGl2RlJs?=
 =?utf-8?B?TW9zbDZvemswazgrTitZNnNKT0RidFVTOGdsYkNSYytkZVIzT0I4Qjc3YUdw?=
 =?utf-8?B?b1dMVWQwVzI0OUVsNm9VVG50bEU1eEU4dU0xdWJzTkI0aVZ1MjFzRzhwL3pK?=
 =?utf-8?B?cjFlOEhET281cVg2TzExdmhXUXBnUDVXdVpTTlJnd1JZbGlRVVAwTGpPcytB?=
 =?utf-8?B?VVlseWJ3YVlmcTVRQ2E4SUNiTmVWQ1p0SkQ2elkyUlJxZWFUVGdmMENwS2E0?=
 =?utf-8?B?VkJLUlJyVkJaTlFmQWpFaTdLSWlVNmZ4SGxWVlEySUkvVnpNWEM1d2daNUwr?=
 =?utf-8?B?bkpVbDZVeUhCRXk5RHorNjlsL0t2RTVIUFhzYkxMRE1RWFRwTnhCUnBpRzFn?=
 =?utf-8?B?UjNpUGFIZ3FTdDhKRGVhOEpBWEpKK25rZUVCeE5sL1hoSUNwRkd3d2J0K0pt?=
 =?utf-8?B?bmpQTW1UMkwwU0padHRyRmZRbWEvUGNLTTJlQTFSTlU2NnIwZjc4UzdlSW5C?=
 =?utf-8?B?RFd3Q0xFY1hITkErTVRCVlhMbXdHRStjQ1BhYXlJSE5OQzJpSzkreHhPMEJt?=
 =?utf-8?B?cDZvVUIrL2JWeUFNSStaT1QwWUlCdzN1MUlJRzFIbFN5Rk1yMkZ1WmlCT2x4?=
 =?utf-8?B?cG9qVUpzN2QzNFFtbjNFcmNkQW9iQTA2dFRTMjdCMmNSTFJFMzlmTEQwY1Zh?=
 =?utf-8?B?Qk1aN3UvcnJiUStBaDM2Y1hzblhVN3ZoZHF5em9xMEE3TDk2NlovR1B4YUZG?=
 =?utf-8?B?eTFTNnRzTGJvZGxSMGU3bkNLaFhrU3ZCaEFiOHVGVkFHMUw0aFo1V1FuR1Nx?=
 =?utf-8?B?K3FMeFg2aWZOVU02SXBGd2cyd0NveE5RMWRBT05YajBFTlFNbjRzNHo4M0dZ?=
 =?utf-8?B?WGVZcDF0eitBdzVUMnJVb1BJc3V3TnJhOWJmQVA4ZFZGR3k3RlZtWkNNdDJu?=
 =?utf-8?Q?38UlGPIix6S2wRFsd9?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a96d0b-5ccf-47e2-0e94-08de5cdc0b1c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:08:48.2956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcjInvKH1DCYVN0YITa4NK0cWza6STmYWHvtp4NWIvfOfhtf9pY6kTO8cGrgiHOxMO5/tN2qKxJHonqLPQzDBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2022

On Sat Jan 24, 2026 at 1:42 AM GMT, John Hubbard wrote:
> On 1/23/26 5:38 PM, John Hubbard wrote:
>> On 1/21/26 8:35 AM, Gary Guo wrote:
>>> On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
>> ...
>>>> +        // SAFETY: fmc_full is a valid DmaObject with a contiguous al=
location of size() bytes
>>>> +        // starting at start_ptr(). The slice is only used for signat=
ure extraction within this
>>>> +        // function scope while fsp_fw remains valid.
>>>> +        let fmc_full_data =3D unsafe {
>>>> +            core::slice::from_raw_parts(fsp_fw.fmc_full.start_ptr(), =
fsp_fw.fmc_full.size())
>>>> +        };
>>>
>>> The justification is week because it does not mention about the non-rac=
e nature
>>> of this, which need to be justified for a DMA allocation. If you use
>>> `CoherentAllocation::as_slice`, then this requirement would be obvious.
>>>
>>> For example:
>>>
>>>     // SAFETY: the dma buffer is not yet submitted too hardware and we =
are the
>>>     // unique owner at this point.
>>>     let fmc_full_data =3D unsafe { fsp_fw.fmc_full.as_slice(0, fsp_fw.f=
mc_full.size()) };
>> =20
>> I see. OK, after a lot of fussing over the wording, I'm have come up
>> with this, which might be much too wordy? I'm not sure.
>>=20
>>     // SAFETY: fmc_full, which contains the complete FMC ELF file, is ne=
ver submitted to
>>     // hardware, so it is safe from hardware-software races. And we are =
the unique owner of
>>     // fsp_fw (and therefore of fsp_fw.fmc_full). (A separate buffer, fs=
p_fw.fmc_image, is what
>>     // gets submitted to the hardware).
>> =20
>>=20
>
> Oh, forget to mention that I also changed it to use .as_slice(), so:
>
>      // SAFETY: fmc_full, which contains the complete FMC ELF file, is ne=
ver submitted to
>      // hardware, so it is safe from hardware-software races. And we are =
the unique owner of
>      // fsp_fw (and therefore of fsp_fw.fmc_full). (A separate buffer, fs=
p_fw.fmc_image, is what
>      // gets submitted to the hardware).
>      let fmc_full_data =3D unsafe { fsp_fw.fmc_full.as_slice(0, fsp_fw.fm=
c_full.size())? };

If they're never submitted to hardware, why are they dma objects?

Best,
Gary
