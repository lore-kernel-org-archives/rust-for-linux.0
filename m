Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020132.outbound.protection.outlook.com [52.101.195.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9097D3382C1;
	Mon, 26 Jan 2026 13:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769433871; cv=fail; b=MAz/++NcGy+mN7Q1/QJaeg3DMmXDcm/GOwFTkWHAPsqIt5Bg59NFJ4pbbY6bsld0B6nOWfjtM+pC/Vwye6NJRV58vVTYNwyVM6pGfcd38XWtAFvX7hypHIghSn5n8ig80xdJsFsRTRcePW6khodHWJNPSRoRBrhuGr2jNtzSHEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769433871; c=relaxed/simple;
	bh=afn3ebkXUswd8qXdj/ibVBOv4vXyMQkG5SqyZ7NcS54=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=SFaJKdWvvw/Pi/MH18c3FYuvNYHXHTp7DJCCKkHr4CoigKtKD//3jqkSwG3qRN5vwfDdTopl/iMrLg1yXSi5P93Z20qGyT5vkvE/H1D86JSXThvJw8wX8hLSuQ3wZzLawcyUQz4DqZffKc2UL+fqJaevPR6LMiRhiIltrJfOxCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Ss4d9sPN; arc=fail smtp.client-ip=52.101.195.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Ss4d9sPN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gs5YWOnckZIuLoOyfNt4JzKodWZSYosaxTQJfU0t9uWcdDIuJf5hQEuGkka6CnLKbCYgDNtp/9eOdCfCCzQD7afWJkBNsOl3lRfqHVL8QuxJSBjRPqS4ysOWl9atcyHHaCHmoUPK4LL+Dr5JpeEpJBVto1KVUzrEuPl9SGRnesuKwfbAjRV+ujiRoYZQU0MWXs6N3550k6NdF0YIvgLJoH89zP3BAgYsF1yGz1rjGChDh/6BzmFoMFczRcz7x2BOpeeRRS7sJ04SEPeL8onXdSBE4Q1FYb6oKgB7+b12OdUR3SMFB0ZhCLp2BRHu1ErsjkEYouKxvwYqfab5ibYz5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1HJp76ttbm5xFOxSOdVLFObgqmZVUmcUgMpTb9AfiM=;
 b=yPmdJ5+t5pmAZkxwKERWRVTWOjbFoSV78+szcfB3wN9dWVh0x67TmMkLF5/2UBg5XOTVAubVYyt1RpzvoqDvKhpod6VmeKDnjA1/hBEXfIqs1d/wZkNAHdP6fII6fWKJuPr7qtPWbDe4grXMDfFrD5WCX7UrDwCudguiBjoyGO19es7GLGsWL7EdDpmuo6DkmCS5wl0SNncPMevojS6YRx/XPksZ8qPf06uSB0xVbnZ/8yF83mxC9KJFCm+5SEYtLrKryYJhr3TEQ6A7N2Gxir3UF1HKt+wW6oHzA6aIEDrlA++o50434foPikS40qdZwb8T5jVRuDyZ5+L62TxQGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1HJp76ttbm5xFOxSOdVLFObgqmZVUmcUgMpTb9AfiM=;
 b=Ss4d9sPNXj0Qcwlzn/DmpdOGOGxGstJwkDgRFhr2IcPiUjo5MgRqdFWoSm3sfbYBzx6pKYCK1bPYiaTl0mjNmz5HRJRyrcrynhmBZIp8bQoJowl57rolO0K0rsPkCvRAB52QmkE0Yl+VlcI2KxEq0PKTlaG7CGeX31sqycybQzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2958.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:17e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Mon, 26 Jan
 2026 13:24:26 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:24:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 13:24:25 +0000
Message-Id: <DFYJYG80FGDK.15S9CRFYLJ7O8@garyguo.net>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Waiman Long" <longman@redhat.com>
Subject: Re: [PATCH v17 00/16] Refcounted interrupts, SpinLockIrq for rust
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260121223933.1568682-1-lyude@redhat.com>
In-Reply-To: <20260121223933.1568682-1-lyude@redhat.com>
X-ClientProxiedBy: LO2P265CA0243.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2958:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dff2c6e-f711-437e-7911-08de5cde3a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjQ2RHB1TXFSdnJ2ejhtdkdnL1V6eWluZ3RoUkxkK3RVSWxBMGtnaFIycGpa?=
 =?utf-8?B?OEVmeTFiMFZrZGJXZURXUE1SZXI3OFhXYXZ5M2g2bHpEWnFoeURrYzc2RHlL?=
 =?utf-8?B?V3ljWFpSNHh2dG45aEEyYUlVbjNmM2loenBvbVh0M2NNVG54RFZJZHJjMm5X?=
 =?utf-8?B?czBjRzl6YmQwZXplSHh2Y0l5ZHdBMm5wKy9CdGR0bm9VN2J5SUJ0Q1ZpZnU3?=
 =?utf-8?B?MGFtTUZkQ2NzTHI1S2h5T2tVc2o2MkVJU05aR0pvdU9tTFV2QWdIcjJxcjNm?=
 =?utf-8?B?amFVWTFuOWY0WVhLczZtYjN6aU9rQk9BRE55ak1YekxQM1hnNWhNVWEzSVpW?=
 =?utf-8?B?TklhdVNIbjVxSnplYTRKdHpjTHlUMms1dDROYUVHbE1ocktESGd2Qy92dXRD?=
 =?utf-8?B?V25BK0Y2NkVMNE5hWHcvOU9UWk92RU9pVVozbllRdGY0UU5KTDNhazYvV3Bx?=
 =?utf-8?B?VmpHdWVRVWNkS3Q5Q2JyekZzS0IzbnBrMXBjVThBYXBkcEhGRnRuK01VcEV3?=
 =?utf-8?B?VmcxT0R4bUIxVlFBdGtHU0c4aDJ2NmVkMWNyY3R0cmIwMytpTm1CTk1ISUFi?=
 =?utf-8?B?MUZPaUNHZXNqYXltMTRyODgyNDRWdnN0TGN3bFF4aHdEKzVVeXpLYVZEZHNO?=
 =?utf-8?B?TFF3S1hXYVNNbW1OMDBzUnNGNFFvbWtBN2NuTDdxUWhWQ1BEOWJkQ3kzM2di?=
 =?utf-8?B?M1V6ckZXRXBIdVJOUUdrTmVDdGFkcEZmeUdlRi9DWVBJUGloekU2Z1c2cEQ0?=
 =?utf-8?B?ejNibWVLQ2N1bXZYQmt5VlBQQ2FxMlphWXg0NjZuZENwYW1iQ1FsamcyaGxV?=
 =?utf-8?B?QTFEdThDaUJJVWo2cHVMMlU1UGlzb3p4SitjNENMdEZTZXRQOXQrVjNIK0hL?=
 =?utf-8?B?RXhXSVZtcjhVb2ZmK1krQXRBd2trWFdNcTIvODVXNEZUaUpLdUZ0SzlXbUdn?=
 =?utf-8?B?MjdYUUhwdjNRWk5WTWc3MTMxTmw5REJta0FCNVc0T0J4NHYvY0cxcCtwV0xk?=
 =?utf-8?B?a0w0em4zUm5GdVRMdGdTQ1NMZ3ZCNUpqVG9TMllJSW56MkYvZ1paaytzekJ0?=
 =?utf-8?B?WFJSLzNGdnV4YXF4N0FQZW1BYlhJdlhLbE13ajJEL3IwQXlwYUN6QjJMeGty?=
 =?utf-8?B?NGo5RlNMMTYvVjdyKzhFazhlR3ZKTXArbEtmZDNvSlFNWWxnVUtZWXpwc0F1?=
 =?utf-8?B?bkprZnFpUlZxZmxKcWJTV01uUTBsdks2Z1M3TUJtNTJacnJ5eElyRDRTdkJN?=
 =?utf-8?B?Z2Y5c1ZhR1I2NlFTb1NDM1NMa1h3YVBIV1E5T3ByaCthMmEvandPUFc2UHNZ?=
 =?utf-8?B?U2RQeFNmelp2V0NWcGhhZm9FaEJFRTZWcmhhZ3pBR0lEOHEwazlTaEhJVkVD?=
 =?utf-8?B?eGFSOS9ya2k4TURRY3hSbWUvK05zU3haZzQ4a2ZrdHpTbUtaamxCdFFOMFl1?=
 =?utf-8?B?dGs1ckdnUTRnOGJPUE5tcElxS2V3aTdqdkdUdjNQNnl4QVRtWUR1NE5ocG15?=
 =?utf-8?B?bDFtUkF5N2hhSkVDTkNCVm1hOEY2aXVyeERBNmlJSFcvcW93YmRtSk1uZGV4?=
 =?utf-8?B?UG9XZXZtTis0Yk9OSWhsTXZ1Z05XaFNXaWRjT0xLSlJjb3lwL05qYmF0aEVI?=
 =?utf-8?B?K1FWQ2plSzdlRmp2MFl0bWZOd1pMWTgxc1VYdDc4MXZPTkF3bEhCekMyRmlG?=
 =?utf-8?B?bUxWQWtnb0hQVENJcDd3OExvRWxMeXZwVDZoQjRPVUZsSjd6cXVyY3FrR2tV?=
 =?utf-8?B?Tlk2anRhdVZ5Zk5VQjE4M044RzlCNkd5M01qMkpZNnJLTkxUM29PRXg2SDVH?=
 =?utf-8?B?d1M5UDQ2QzQwYWZySEdPMUtVN3JzQlhsZktjRlJOY0dtbUZLZE9ka2dTMURP?=
 =?utf-8?B?MXRaQ1QveUxxYmNlTE94bkpieUlKdm5zdW5VUEtDdzhzbUJGSUxaanAxWnF1?=
 =?utf-8?B?M1N4WGdFdkRxN2RKdzVDd1NCR3JnazFsYk1xeUszL25zbWdPY0hvRmVBbW80?=
 =?utf-8?B?N2pTT2phZ2xMQU1WWWRDL0xLM0x2QmlEa2VlWkhmMkN3TjNRQzNQaTljdlo0?=
 =?utf-8?B?anl2UVE2dkpVeW40R2V5OXduQUVVdldncTdVdXZ6VFhyclpEWDFnRzZPd05S?=
 =?utf-8?Q?9LXI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWs1bEhyazR3S0xPV1F0QW41WjF4a2oyeWYwMFgweDNaVFZTbHFLdG1HTTRJ?=
 =?utf-8?B?dXFVTHlBaVRxN08xVHVoT2lUOUtnTEQvOHFWd1JaazFNSDAySjNSQ3Z1SDYz?=
 =?utf-8?B?NFU2d3NpWk4xTkttODNrb29UdnQ0bnN3bENkV1d1dHhoOVg5bVFDWm11WS93?=
 =?utf-8?B?OWRRY3BJeWwxM09ERHkxa1FLQjFzZG9Pd3JIWDVRUnJDQnJuWWRXbWZqMEZV?=
 =?utf-8?B?bGV1bDVneFZKbnl6RFkwVkV4Nk1qTERzTDNpRDllNG9wSjdWOUM3Z05SMXFz?=
 =?utf-8?B?T1NuRlpseS9VVnMrZEs2RkpKblh2RGUvaWU0NDE1S2lmN3greFIxdzR0VTNr?=
 =?utf-8?B?RUV4NzdvZjRwYlV0UWFieTdobHhWZnAramJLanU3RnZhb2J3MGdOZjREWm1v?=
 =?utf-8?B?NzVwQ0hFNG1scjVBditwYVNOOFFTTzRqQ2pHRGkxT3JYaTJSNjlRZWdtaTBa?=
 =?utf-8?B?VktDNWwySHNJMUxBUEZrRlhnblkrTDJuSWtYdnBza3hwWlZibHBrb3hTeTd4?=
 =?utf-8?B?aTBBNFhMeUtCU1FYckZLanVFVTh2TWp0ZGxISG9ybFU1VmpFY2ZPaDl3Wk5a?=
 =?utf-8?B?U0RWd1c1SnJTeGc0eDN2clcxbmcrYm5iKzlDR1I3MUdnWUxDaXFXMFJyWmVp?=
 =?utf-8?B?YjVHTXdJei9acVRScHpXRkNQanVRdkFiWWFlR2xxWUNodUg2U29NMU9NZXRV?=
 =?utf-8?B?TmxJQzBIQ3ZpdEc2ckVNQVA3KzQ4dnNqaEc0M2Vud3ZiSnhwNDQyNVROTCtO?=
 =?utf-8?B?SmtUemc4bHozdUhSSHl1YWVoQWMyb0hZUlZRU0h6elR3dlhUT0JteHluZkYx?=
 =?utf-8?B?c0pNWlpjQlFGMUlpdW9rcWg4ZUliTnRGLzdRVWlOc3NDU3pZSCszdUF6Y0E2?=
 =?utf-8?B?ajNZT0NJSUcxQ094VTBCWVcvN0JPZHU0NjBhSGdKYWxHT0dsOFViVWhPcGkz?=
 =?utf-8?B?SlZYTzd6Qm9YWVVVbzVKOU1ZYVBNdXJ6TWVGaXJHL0xxMitzTXVMbnRUeVU0?=
 =?utf-8?B?eUd6aVdjWUpQRFpkOVBQL1UxZ0s3OTNhSkZDSmI2emRJUFAzd0w2OExTY1lm?=
 =?utf-8?B?M2Q2RHpIbitobU1vNG1CWGVhMTNNaGdwZENQNm8zVFV6aUxteGVUOG9QL0VJ?=
 =?utf-8?B?MnRBMTJUNjkvZnFnNUc5S1Jqd1pyYmJkbDcwYWpsU29SWDdSSG9ueVQzZTNG?=
 =?utf-8?B?YjNUWDdmSVhZcHRYS0x0Smh2VXdRUU84N2ppV2N2L01XeDJaVHF4ek5KdEdv?=
 =?utf-8?B?WmtrTUR4MHBvbnRISWE0Zk5yK0p0VTYxa2FpUXpwTEdlTWNZSnVkeU83d0dZ?=
 =?utf-8?B?ajBKeFBCYkRJeG5sM3MrZlZqaGZDS0RJVHFuL1lXV3FvV3NHSUZFU3N5ajZ6?=
 =?utf-8?B?YmZkc1h1T1IzT1plRHNEeDN3ZzZwR2k3NmtobXBFdHdVUkt4UXluc2lPaCtK?=
 =?utf-8?B?RkJCYkw0K3RKL3IzNUJMT3dURHZrSDh1ZnEyV25hQ1h6UUdIMjN5WGIwby9h?=
 =?utf-8?B?TUhlZlB3NnduQmZ5T3hpSENBMndjN2NoZGljYy9ycVlQTlZhWGZ6dnQwdENN?=
 =?utf-8?B?UUpNNE1aUEw0bTFxQW1DNzlMTnRid1E0RS8xQjVxU3BOSGRhUURkWTNXaGtP?=
 =?utf-8?B?YmgwcnZ5UWhlZVhyc1RBTmZ0L3pRaXMvcXo2U0NnclcrclNzWEdqLzBmTnVK?=
 =?utf-8?B?cjB2VWp6MDBkL3ZDN1poenFHYmFGUVRjb1c5UThJRHJ2TGlEYkpEQ1BWK1Rk?=
 =?utf-8?B?NUkxQTdUMXVQSTJUR3dsTTBnNmljUEtPcXFRWklYSHN6Rm9MbVJKYzZGbUxy?=
 =?utf-8?B?dklYVWR1WExnTllMcnNHU01sdmhxbzQybjBycWZJYXlEc1dXczl4ZVNUS0J1?=
 =?utf-8?B?SENoTjFkdnFZS3RRclkrWGtVSkwzQzM1SmRLQXIvS0NibzhYZUxaMVlETm1F?=
 =?utf-8?B?OElmTnZXQ1ZnNkZ0ekFxOU5BRkkrQktoWXUvc0NlZ1MyOHIyVGdjMUQ0ZjMv?=
 =?utf-8?B?UmdXcUoxUXFpWEdSUi9QRlk5bXNRcDZzSGRyRXhCV3hKMkpwMGlOUzdITER2?=
 =?utf-8?B?SnFybHR2SDVJQ0Z2dDlvZnU3WDNnZ3hsMlVhSG5KSnA0WTRuUThOSmt4S2pk?=
 =?utf-8?B?SGp1QThQQ2NLZDloVmtBNk9qL3lLSXdhUzNNRVF2SUV5cHl4UzBZZlNSbDAz?=
 =?utf-8?B?TlB4bCs5V05vR3huWE9nTFFGanZENENUQmNUUk9zZ29mVStkaWREcmc2UElG?=
 =?utf-8?B?SEROeFFaTEsreURBT2ZJblpwZXExUU9VRmNtenpaVS9CVTB5OFowWmQ2bDRj?=
 =?utf-8?Q?NzD3k9tIHf8dhjQKwg?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dff2c6e-f711-437e-7911-08de5cde3a4c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:24:26.4372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/xZUHJ2L5SVFTuSaisd13uAWQCRbksnFJ6X4TQKNAHgLNFVnVlQj5mkFgOHoXH5mqJ6W9r5ZDAqzDaSdCe4sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2958

On Wed Jan 21, 2026 at 10:39 PM GMT, Lyude Paul wrote:
> This is the latest patch series for adding rust bindings for controlling
> local processor interrupts, adding support for spinlocks in rust that
> are acquired with local processor interrupts disabled, and implementing
> local interrupt controls through refcounting in the kernel.
>
> The previous version of this patch series can be found here:
>
> https://lkml.org/lkml/2025/12/15/1190

Please use lore.kernel.org (or patch.msgid.link) links instead.

Best,
Gary

>
> This patch series applies on top of the rust-next branch.
>
> There's a few big changes from the last time. Mainly that we've
> addressed all(?) of the open questions on this patch series:
>
> * Thanks to Joel Fernandes, we now have a seperate per-CPU counter for
>   tracking NMI nesting - which ensures that we don't have to sacrifice
>   NMI nest level bits in order to store a counter for refcounted IRQs.
>   These patches have been included at the start of the series.
> * We've been able to prove that being able to convert the kernel over to
>   this new interface is indeed possible, more on this below.
> * Also thank to Joel, we also now have actual benchmarks for how this
>   affects performance:
>   https://lore.kernel.org/rust-for-linux/20250619175335.2905836-1-joelagn=
elf@nvidia.com/
> * Also some small changes to the kunit test I added, mainly just making
>   sure I don't forget to include a MODULE_DESCRIPTION or MODULE_LICENSE.
>
> Regarding the conversion plan: we've had some success at getting kernels
> to boot after attempting to convert the entire kernel from the
> non-refcounted API to the new refcounted API. It will definitely take
> quite a lot of work to get this right though, at least in the kernel
> core side of things. To give readers an idea of what I mean, here's a
> few of the issues that we ended up running into:
>
> On my end, I tried running a number of coccinelle conversions for this.
> At first I did actually try simply rewiring
> local_irq_disable()/local_irq_enable() to
> local_interrupt_enable()/local_interrupt_disable(). This wasn't really
> workable though, as it causes the kernel to crash very early on in a
> number of ways that I haven't fully untangled. Doing this with
> coccinelle on the other hand allowed me to convert individual files at a
> time, along with specific usage patterns of the old API, and as a result
> this ended up giving me a pretty good idea of where our issues are
> coming from. This coccinelle script, while still leaving most of the
> kernel unconverted, was at least able to be run on almost all of kernel/
> while still allowing us to boot on x86_64
>
> @depends on patch && !report@
> @@
> - local_irq_disable();
> + local_interrupt_disable();
> ...
> - local_irq_enable();
> + local_interrupt_enable();
>
> There were two files in kernel/ that were exceptions to this:
>
> * kernel/softirq.c
> * kernel/main.c (I figured out at least one fix to an issue here)
>
> The reason this worked is because it seems like the vast majority of the
> issues we're seeing come from "unbalanced"/"misordered" usages of the
> old irq API. And there seems to be a few reasons for this:
>
> * The first simple reason: occasionally the enable/disable was split
>   across a function, which this script didn't handle.
> * The second more complicated reason: some portions of the kernel core
>   end up calling processor instructions that modify the processor's
>   local interrupt flags independently of the kernel. In x86_64's case, I
>   believe we came to the conclusion the iret instruction (interrupt
>   return) was modifying the interrupt flag state. There's possibly a few
>   more instances like this elsewhere.
>
> Boqun also took a stab at this on aarch64, and ended up having similar
> findings. In their case, they discovered one of the culprits being
> raw_spin_rq_unlock_irq(). Here the reason is that on aarch64
> preempt_count is per-thread and not just per-cpu, and when context
> switching you generally disable interrupts from one task and restore it
> in the other task. So in order to fix it, we'll need to make some
> modifications to the aarch64 context-switching code.
>
> So - with this being said, we decided that the best way of converting it
> is likely to just leave us with 3 APIs for the time being - and have new
> drivers and code use the new API while we go through and convert the
> rest of the kernel.
>
> FULL CHANGELOG BELOW
>
> Boqun Feng (5):
>   preempt: Introduce HARDIRQ_DISABLE_BITS
>   preempt: Introduce __preempt_count_{sub, add}_return()
>   irq & spin_lock: Add counted interrupt disabling/enabling
>   rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers
>   locking: Switch to _irq_{disable,enable}() variants in cleanup guards
>
> Joel Fernandes (1):
>   preempt: Track NMI nesting to separate per-CPU counter
>
> Lyude Paul (10):
>   openrisc: Include <linux/cpumask.h> in smp.h
>   irq: Add KUnit test for refcounted interrupt enable/disable
>   rust: Introduce interrupt module
>   rust: sync: Add SpinLockIrq
>   rust: sync: Introduce lock::Lock::lock_with() and friends
>   rust: sync: Expose lock::Backend
>   rust: sync: lock/global: Rename B to G in trait bounds
>   rust: sync: Add a lifetime parameter to lock::global::GlobalGuard
>   rust: sync: lock/global: Add Backend parameter to GlobalGuard
>   rust: sync: lock/global: Add ContextualBackend support to GlobalLock

