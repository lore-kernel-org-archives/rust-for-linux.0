Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022082.outbound.protection.outlook.com [52.101.96.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BDF3624C4;
	Mon, 12 Jan 2026 15:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768233336; cv=fail; b=NfJEcVgleqBEfHLX/peM5lcPYuSzBS/63HF2mMGysE7ySDyuiz2XvcB7EEnI2vqL0jjYNTYGPppwwYXygq6OgL3iVm25vq2kzXE+HXwXGrgK/G0h5Mv4I35ch0LxaK1IWEW0GapijZkOn41sCp8tP/9PMWhLzEtdmQLN/VhXKqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768233336; c=relaxed/simple;
	bh=F8Ay1J4Cgmj57SGRDsoeeE/1U+dc2KwpcPxXbgJBMAo=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=HP6twhJ9gJe2AbDkvFDcFC8jj092nqTQrGDUvOUuGRf1kJoMJZ7kNivQVCZymxj7a+CfY3g0rGz4sw5TYJhgwNUOOoPYPGXu8Y4rPdaIwf74ItWpkgUkH10A8vlXdTQ1UQEvOo8u40/a7tiZGsI1Cfe/deO7uvKRpSDUAUEGS5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mInbSPYm; arc=fail smtp.client-ip=52.101.96.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mInbSPYm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BI6jyvENtX0lPEcDCMzQI00SusiOBocT+0p37SYkRbU++h1DVeAyVNOyMKPHIoqVQwXzVCYl19oyXIGomU1y3p4MXUORg5E6Li4SCfvRDbocA2BEu2oR7ChnwhWNC7q00GqoiVdByASX4vCWhGj9dUKkI2QWB8CHxRtJpfDOr31FNryY5DnD3ucvMap9eF2ahqp7zukjZv7RDutzYwkZNa2Jw3YEoiITOJUiU07nQgcBgeFL/SKz24D7n0gW5sFJItK0Wcu139F84FrTgkdiqcwqyhB4q8NjT7z4bKYn3/bm6x8AzP+7wJ+JzSEO2Tj0eyWWfL6LA8K9WtZFqe92ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cw9/vRbCu55mp+ywtqbeXwZKdVNaWNneC5x8AzT524=;
 b=h3H8Z+/nEi474lVSaw+Uk+HOVVA9+yQfDnKr7Nf72YL1vPKTwG1jsy8yX1cTkRCKFLtsqhokoaGM6U5H5RaQ/swELHFo4q4E6o/jwhRJMah6moooixjWm01z6KYtx2d29EFj2vucLjOi1XCMsSbH/JLi0AuVygeLiVHlonIhLsVP3Xqvs+BfAGHSLy9jX0uxkSGaHynqNERFQji+FJtA8alp5OO+LBzrxMlnkCdhmJ7E5rt7zkd0cMmcSfWvkZdBbAtycBCUOA+5FgH2CMPq9slNyDFHoRcYIYNWGVVtlZ1rGJhcG51Lm4EbySFPzB7XA2vZVOu+5UWcVWxicGQNPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cw9/vRbCu55mp+ywtqbeXwZKdVNaWNneC5x8AzT524=;
 b=mInbSPYmYBPlgXxbBbqSh2FawZZIg8byaB4w3vEl0qtQq4yxZ/wtTDdz3n1ia/l7vh4vxDpDOOQQal+LPunrAB6JEJTGflOywW1OdYkLA6inpA0qMVXh4HB7WPYJKxXfuD3keQpeq4oZ9bi3abv+FprSczfFHKgZw5EYRlcO+gA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB4972.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 15:55:30 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 15:55:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 15:55:29 +0000
Message-Id: <DFMQEHLD3EPX.CPW73YJ95FLP@garyguo.net>
Subject: Re: [PATCH v2 02/15] rust: pin-init: allow the crate to refer to
 itself as `pin-init` in doc tests
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Christian Schrefl"
 <chrisi.schrefl@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260111122554.2662175-1-lossin@kernel.org>
 <20260111122554.2662175-3-lossin@kernel.org>
In-Reply-To: <20260111122554.2662175-3-lossin@kernel.org>
X-ClientProxiedBy: LO6P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB4972:EE_
X-MS-Office365-Filtering-Correlation-Id: e096bc59-945b-4e31-9942-08de51f3032b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1did2ozV3FwbTNjdDg1c2RGRWJtb2tiZDdmMW91WUE2V0w3cXJDVS9jN2pr?=
 =?utf-8?B?emxTMFd3TUFKUDFzNkZ0OWlpcThjdEFRVjZOUU1yaG12SkxUODYrdlB3Z3FW?=
 =?utf-8?B?K3F0TEp2aTlQcG5oVVlMMWV2WUtKWEg3UUVlQjJENWtHNG90bzdiZEtnWXM0?=
 =?utf-8?B?cVJvVUdFNyt0L1oxVXJRR0FqcSt0SXViK3g3V0F3UmhHelV6NVhGWFNiOXdJ?=
 =?utf-8?B?V2Y1MlZCeXkwUENQajJ6YW0wSnN3RVZISE9LV05ZYmR6OHBXc1lJYkdSZjlN?=
 =?utf-8?B?ZG1tVnl5bjZtRm5RTWhLSjdXMWFid2dRRjRkM20vbHJGQnF3YjM2S2RnSng4?=
 =?utf-8?B?eUVGc0JYSnJMblZNbmFOUzZ5djcwSThWdXA4NDZvdmEwL05DaEZzOEk0ZmU3?=
 =?utf-8?B?dWVNSGpBWDZvZFVXZU5XcC9iVjZpT3dTMHBxdzg5UzlkdXBoR04zYUxDdHNZ?=
 =?utf-8?B?anB5Mk5NLzJSSTVzQTdBTTFRdHduV2ROcW9TQWZPL21jdmQvUjZwMGo0TVV0?=
 =?utf-8?B?NVN1QW42eWp5eTgzOGlkTXlJS2dtODNjSnhoY1YrMHlxVW9YUU1IemJKOTNx?=
 =?utf-8?B?Q1hNU3JMczJPLzA5a0VZYzBsekdLMXNjbTdrNWlyMDVCQlFlVk5tYVhBQ1V5?=
 =?utf-8?B?QWVVSm1pR284V1ZUVjZYVEFJLzhYNCtWUGZkalZoenFCaGplZ0R2Zk1jdFJ6?=
 =?utf-8?B?VmlIZkl2VzZGRkFYaVQ5SytUenVOd29xOVFVYVI1SnFyelJZQ0YxaFMxUWJI?=
 =?utf-8?B?SWdUelIzTWNyRTNmYXRQL0tpc2lRT1NYR2JzUUlVUVgwZ2phZ3RxcDd3bWZY?=
 =?utf-8?B?R05lR3ViekdMOTVyWlVsRUd6UTd0bkdabDhqRkFwaWFubGVQbEZmZThDVlRP?=
 =?utf-8?B?b0h0Tm16MFgvWGNMRVdzaXp4dndMc3BlRzFzQVRWQ0pJak93YlRBRGJJWEZ4?=
 =?utf-8?B?aFE5QXJGUHlrRXpTSFpqRGNYbENxb09LSENCRm44YXg2blNVUEVIaWY3S1RN?=
 =?utf-8?B?WXozbHE1a0dHc2ZieG9Dd2wxejhQWlRocXhMdFY4aW5hbitMTTVUR3J2NXlr?=
 =?utf-8?B?RlluZnZyR3RHWEE3MGNCdVhZdHJzRy9sQ2s4TXhBeEZxcnhLaFd6N2oxLy9t?=
 =?utf-8?B?OU4xVnJNdk5mdlp6OFlPTkhzYkRJM1RReHFaYkF3UDVlT29QZ1duU2tmdXpz?=
 =?utf-8?B?bFNqQk1jTDBlNC9yZlozN2FWK1AvdWVYZGx0ZTZOcms5anA2L2cxdll3R0N3?=
 =?utf-8?B?K3F2ZytEckY1RlJJVFFEU3FDVERFY2c4ZkFiUVF0Vi92MGNuWHlVZWVZVTNN?=
 =?utf-8?B?WGRJZUMvcHhnYVRZWmxreWxMNTNoUVlIZHRKZ0lTYUkxY1dDRjM0Z2I0RnNv?=
 =?utf-8?B?RTh6SW9mY0RtWFlyK1ZsbmEyck9Xd2c2Qmg5cjgwQzZVLzNGYzZqRHVBSnRv?=
 =?utf-8?B?UFo4ZGpMb3pxV3ZXTm1ZR1EwTnJYK0x6cXNhTWlOS3JUNTNxdUFzdnA4SVZI?=
 =?utf-8?B?OHp6UTg2c1JGK0RLSUZqemNTaGp6NXRtT0ZlWkpkaStNR0pQUDY4NUtkZkVv?=
 =?utf-8?B?bDIzL1k2bDlFMXFEQ043MnlLc281WFl2RE5CK3lmT1RjRzUzQ1czZXVBZlMr?=
 =?utf-8?B?UmR4dGRiRXpqWW50NEMxSXQraWplN2xYbEdpckQyNTNPQVdTMXRLNjZYZjJw?=
 =?utf-8?B?Y2JtcGpXNkJReGJEWXVSV1B6bFgzMUIxZk5NbWVPMkN3TWF2NG9SdDFNck5U?=
 =?utf-8?B?TTV6THpSTFJhcklsREdselNNUkZtMnc1dWVlQm5QN1pnNFQyaWxBM2lNaVVh?=
 =?utf-8?B?Q0tCM0JoUlZZVEZxbyt0MWI1c2lEU2E0KzNMR3BXenV2b0lpMFlWVXZLQmla?=
 =?utf-8?B?eDJvM1NCanhkT3BJbDE1TUlCVDJ6dWdwaXg5OTBlZ2dLdVNkbndCQTRwRk5D?=
 =?utf-8?B?NnRFbjF4V2FnVzVPNXd6U0xiaTlMWWRZeXpMWlpIYTBoZGVZVEVYYzRBNW90?=
 =?utf-8?Q?VbXyQ4bsMjxfyKNGncK/tEcq86hLi0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFh4ZDZKazNnZXZOMHpjdzNIcXZuaDVDRHVXbVVPS1FJQjVDc2N1L21aTW5v?=
 =?utf-8?B?WDRUSjczdFlMcUE1cVRMbG9Ld0FCMlZQWTVLQ2FTZWNYa3Y0QnBDd2N2d1Bt?=
 =?utf-8?B?M3JQSDVvQnE1UlNndkVNd21nSmpQNFRrZCtzd2ZlNmJzVEMvbGd6QWlHcWl5?=
 =?utf-8?B?RnFEV2NWSW5TZ05KOVlmODFUdWdrSlNtTGpqdWNlQiszSis0MTRiRk1kMHQ3?=
 =?utf-8?B?cVJUT3VINlEyamlMK1IyK2RXWi9Td0p3OFc1VzJWUkMxUVpXTmlURFQ5dFQz?=
 =?utf-8?B?RGF3cXRCVFZtbzE1aStRa1RuWWJGeUR6NW5SWnhWa2JodVdRb0E5YnV4akdv?=
 =?utf-8?B?V2d3L1VKb1F5dktyZHZBSWpxV0RnT1pCZzE1OS92YTg4SnNBcmZJYS9peURE?=
 =?utf-8?B?bXYvTCt5OTYzVFdMbGI1NTlzV1E5TzM1eXArN3dHalorZjk3cmhleDBvRFE5?=
 =?utf-8?B?eTVxRGZYTkhBZTQ3eEtFL3A2VGNXU2d0ci9ka2VMamVmUTNoSEo0SDRaUjQv?=
 =?utf-8?B?elUzNUthOXFoTWZ4Z1ZiVFpWYTBrUkdCS3RnS3h0NTVveFdEWG5URHFxcDE1?=
 =?utf-8?B?ZnZwRjc4d2h5L05WR1BhK1g5b1J1RS9jWSs0K0dSeEJVTFF1Zi81bXFzMlBk?=
 =?utf-8?B?VFNPeWFsVGJoUkRTaXd0MVJxdXdzRnBUQnpjVjNUZnJWRndYWmVSSHpOTFdX?=
 =?utf-8?B?ODZjRDN2WVlvTEVOTGszdHdIZFE1NXRBY3MzRXo0bmFqc3loeW8yeElHVE9y?=
 =?utf-8?B?eCtwRFVTck11S3lSK2RmT3I1MStSSUt1TEt2dElob1I2MHlkZzR4d0drNVF5?=
 =?utf-8?B?bERVUGpoSDQ5dlBXTHoxaVZmSTNybzcrMTdTQWlSUmJFQ0hjV0gwVU1vVi9J?=
 =?utf-8?B?R1d1c1Jib3JDM2RCM29JVk1PNXpBTmZYQ1F1dld0TkNPMVlTOGxJOUpFV0tx?=
 =?utf-8?B?M2x6Y2FrejVNMWtyeDFURmlSNWNWMk0xRTdUWGtLRlpPdis4aG5uQUgvc0dq?=
 =?utf-8?B?SGtLSkErcytLSTltOSswUitCNGEyejNPSVcwRi9lZEtTL1piWjF5VS8zbmdx?=
 =?utf-8?B?YjF3RXYrdkZIRlpCT3VvK1ZOSk9MdFRGVUUwMmZXc2ZHQWcrR2lNcHJnMFVJ?=
 =?utf-8?B?a3FkU2ZaUFFqOFNCdHZQbFZiSW51c3JDcVNZZmtGSVhYcXJCTXV3K2dSdWxw?=
 =?utf-8?B?MkQ0VnJWTmI3M1VPUHJ5cDB2eGhMaDIwUC81YU4xMGlhY0FDUVJ6akpIcVVx?=
 =?utf-8?B?cjUwUnZOakFQblpVRlFuMmhteGN0RHpmN0hoSmpudncyZ2c3aU5LK0JPTkg5?=
 =?utf-8?B?c01pVFlkajFvOEpzU0J4d0tWUjA3VmgvUTB1U0FqdWJER2pIWFE3b0RTY0FT?=
 =?utf-8?B?T2ZpbXUvQzBPSVRXemdvTUNrc2phMzMrOUdmcCsvcG9qcU11OHNSbGxRaWpv?=
 =?utf-8?B?bjNHcDRYZnhURVFFc2RIL2FXbURrU0xXcEdZVW5HZGpmUTNhQXhIaUpTTS9u?=
 =?utf-8?B?ZHpFMTVaVjB3WHI3WjlLM244WldEWHFSejk0QXR6Lzg0Ly9zaXd5U1ljcXoz?=
 =?utf-8?B?TW93YmRIay82dWNRYWo1bXM2VUJVd1p0UHpBeit4SEdhd0QwVUhOM3NvYjZh?=
 =?utf-8?B?aU5NbUtQRGJrWmt6L3pSd3Bnc0tILzYyZ2RMN3hOR2hoaStqMHIvemVpS0dS?=
 =?utf-8?B?M1R5VFlpQ005T0RTMEY4Wit2ckZJRjdrUFcyUWt5NzU1M0JxZWRHMDJvRzFE?=
 =?utf-8?B?M1lyK0d3TkR3NVZWaHNmTTQ1dWxBT0hQeGR2V3hVdmdFYTJOT1JKbkoyb0ZD?=
 =?utf-8?B?Vm8rcUg1OEN1dnFsSzRKM1BpbGlCdlFVYnBqUmE2RThuOGJhbXNNK3lEQ0s2?=
 =?utf-8?B?aVpSbXRlTk5kcSt6eUp2bjBMNEYwSy8xRmd6a0pDcGtlY2FHemw4Y00vNXds?=
 =?utf-8?B?ekJaZmpiV0h0K3lEUkFmMDdsS2x4UXJVR1hWMDFuVzJLTXdEY0ROajdYMlo0?=
 =?utf-8?B?OUptRTc2cEFFaE1xMHNMV2NraFV6TjVkdDk5YlNLYjVQbXNCM3NVeHZ1d2tQ?=
 =?utf-8?B?VzNwWGhLVDkrQWFpOHFsYjRmSjZreUdZeDNRRmNlZ0RKT2o4bitHUzVJeDFT?=
 =?utf-8?B?STU5M1BtSFpWNzZvSU9mWUV2VkZQZlFYc0ovMktScmZ6UDRBcEpuYjV2S1JQ?=
 =?utf-8?B?cHlGdmF6TUFROW1FUU1oTEcvTGNCUm1raHF1UkN5Z1Ayc2VLZmQySDk5SmQ4?=
 =?utf-8?B?UTV6RkZqWWw1aFcyYWdwdHZuU1IxalBEWlJ2WFpjdEtPSVhkNzVURHZyeW8v?=
 =?utf-8?B?T1NRQ0dwODRlR2FJTXZiN3pwTnI4MlVBZFc3Vzhxd0FHTXVuNHBydz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e096bc59-945b-4e31-9942-08de51f3032b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 15:55:30.6156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkfasfgkFiBSmS++wcr/+hyIZLTYx2qnnFHdTPo3+hqDmURma+btQ3RGy/iuImzLwCOhuvUSqwbOGWCS9X6kFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB4972

On Sun Jan 11, 2026 at 12:25 PM GMT, Benno Lossin wrote:
> The `syn` approach requires use of `::pin_init::...` instead of the
> `$crate::...` construct available to declarative macros. To be able to
> use the `pin_init` crate from itself (which includes doc tests), we have
> to declare it as such.
>=20
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v2: none
> ---
>  rust/pin-init/src/lib.rs | 5 +++++
>  1 file changed, 5 insertions(+)

