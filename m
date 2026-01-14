Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022091.outbound.protection.outlook.com [52.101.96.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2E933B961;
	Wed, 14 Jan 2026 18:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768417141; cv=fail; b=rgGr6xIjlv+56ecLRTno14HH+8IUTwKdjQl9NJjVripj8vAQM8rpWmcxK8WwpJo6oyjNdsGmVch/aMW+0c2h/1uCmiN8DH4Zmc1XIRWQigi/HC9zd3Ls2ANYB5fLitgc/YrKlupCjkLccvkrkMgJ/S4eCeltikUj4x6Y1+1FQvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768417141; c=relaxed/simple;
	bh=14xP6XJKJU565A3XBw963OBa/mqw7DMWS5GVHLD6iEY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Mrmdfca8Id1Zk35+cRUV5tA049Hgifxs/mqAJ5wqDjAeUMhGoDuTkrSDXYC2/qy4ccJ/I2S3NCp1VWJNuNna8vddrzFpiRwAuMQ2ENCOdQo7LcfPMNg25+IHcYxc3djloq1IZtIY3vDMgVKoX4xp6lqnKOhwRLkbFzoOaaYNu34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=qESAdd7S; arc=fail smtp.client-ip=52.101.96.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="qESAdd7S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcKLFLKPvlSJZv5tc1zuugF3KNyerXiexCwVe9ojSLkHQ6QKAuIacvcGc2E9mq+kuvxWnT7jNH0CYF8LKPqeOyUiM7umOWRurVLJasynY3zdrIEWEUyU+Ll/kIHBVERuinJm9DxNFQUXPFcWjCJdCJUEJKly6lJyYkIPo550N8EzRXt6hJNstd+NKyxeISBHg6CCGERV6iLdbLHQI66lh5eI0z6hH+gJ75RjIZS7AwSZJkwP19LGINZYV8K1kvnp/Q8YZjUWtbHmzRVUN9IQ7ledgbtC6gKhr7jqMN0tbPCl0UdqJnal9kFRdfu2e/oDvdvl4XUwRfY9HQb4JT7tmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHcuINQ83NWYQAw1kB/m7cw87A6n9syfXL3uytvNYGY=;
 b=HebHSwKlKOBxqaxZTqlU47wbTbgQUf65YlOoXUp5F5mS7gUz8lFwOno8sGVT8/07pipJNrDStRSB73e8VRyeGNclVP6z4TWPwUAnXRLOKfjCtUKzRR5QIwZv4vj++R/RlABtGa+ARBV0pA/0qSrdIqJqZyYROKql6YAPaD2kbwi4PWhTYr0MfAXBtRW9pFsk8sZl8MyUZW8/mhzaUuvnZcMY2dxHi6DBlX0/vKyfYZSMNESeT0WJbTEvnVGlsgGtbIdjvFe1XMZJ4A2RoCPHBwn9CVJKgWZyackUDqneIuDzon553VoDi7taU7aaPc8/EKMAl9UfiCxFoCnUZvT9tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHcuINQ83NWYQAw1kB/m7cw87A6n9syfXL3uytvNYGY=;
 b=qESAdd7SYkVX0Lwl+tOYqpfRD3Bji+2tCO8Sdb2GvgaOjR5nqbCPcKv5jG0BZSEWAnj11TmORLGDROJGyEm3cn9DoLpuXHLBdI5gvacNPyTWZnNMvgTjfMj86aYeCfZbYfEnLZaFgy2w2ZPjKkBsR/IMhjf6NnTEkNkskKk7qM8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6219.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:273::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 18:58:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 18:58:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 18:58:57 +0000
Message-Id: <DFOJK1RFW2UA.TLC604BRC7BB@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 14/15] rust: pin-init: internal: init: simplify
 Zeroable safety check
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260114181934.1782470-1-lossin@kernel.org>
 <20260114181934.1782470-15-lossin@kernel.org>
In-Reply-To: <20260114181934.1782470-15-lossin@kernel.org>
X-ClientProxiedBy: LO4P123CA0187.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 7374344f-95f9-4200-f811-08de539ef924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akFXSW1XQ2N6NDVDYWhHNVUrRndKQnlpN2I2d2JwOXJpOWRPdUt2UjdKbVFI?=
 =?utf-8?B?dG96cFppNURneWw0ZUVTTnFzNlN6NUJuaWlDbGlTYzV6aUExWDhzWnJBSExE?=
 =?utf-8?B?RmRJZ2ZzaG80RFdFL2dxMVZnRkNyMWZjaVlvd3JqaGVXdkhsa1RMU1hlaTBl?=
 =?utf-8?B?OTdaWlVFTHhCUlQ5ZFg3OWtyQjhPRFRmMUIxdk1uWFJCV28rSVpSTHhwTmk0?=
 =?utf-8?B?QVl6OHJ0alNqQkRTSEl6NVJxZFZYWnB4MnJiUTByalZJamxZN0F5K0hzU0tI?=
 =?utf-8?B?dW95MFZuU01YL3pHd3AwM0xrS1VUcHNXdWx2SFR5SlBkS1d1aVkrNGtFcU9L?=
 =?utf-8?B?bllQL2VzZnZYRjNVdE5DT0tVT1JBNzQ2WktHU2JVdVJtejF0MU9iUHl1a1VV?=
 =?utf-8?B?MjNDYXdxWU94VFd0Nmhsd05VSnlKODJjOFZnSkUwUW83Z1JNT1I1RzhsVS9m?=
 =?utf-8?B?OG1PVjNSSWt5ZjRwM0h6cGV1TElLTGZuZWIxS3NGTE5DeXBaZGM0Y1dHajAr?=
 =?utf-8?B?WitmMDU1YXB2WXhzS1lNWVlDbXhFbU83RmpmSnAxN0xkWXBtVElCUkxMaUxp?=
 =?utf-8?B?d0xucjNxQ2gwZm9iTzN3WFhRN2haQ3M3Z3JseHJsWDRyL2JyeGZNZ3pYN3Bh?=
 =?utf-8?B?UWgrSVFBbXdscTBjbVg0RitMd0NDY1pVWGR4ZS83STREazR2cWY3eG9zenBV?=
 =?utf-8?B?TUk2K0pNWVNKd0N5ODlQUDBRcG1wS2x0Y0kvV01McDJ0cnBvRzdGMmtkTnlZ?=
 =?utf-8?B?TVVrM3AxemphK1laTHhBaCs1VFJuSmlRQ3ZidGJmWGpsS09ESUlqelYxdGcx?=
 =?utf-8?B?eTU4ZnRZQjJpMjNSbGIxZVZiTnl3K1haK3h3bmwvN3R5UEh6MHF0VXZmRXR3?=
 =?utf-8?B?K2FuMlN5NzIwWGxKdHI5d2J4SzVsL1I3N24vVU94aFdOUEhMRkJXYzhyc1FY?=
 =?utf-8?B?N25DMm5iZ0ExYkEyRzBreUJ2b3Y2bDl2U1JpUjZ1NVdMSjNZWjZ0OWNUWVhK?=
 =?utf-8?B?VUc4eVB2Wk9KOCtCZUxsWE5JNlU5V1F2L3U0V3N2RElyT1F6L25wRmYxS2NM?=
 =?utf-8?B?bFdpQUUyL0UrdUk5K25NZTd6TmMrTm9FUzAwQVhCVEJKMm9JRC9NdHdTSHRp?=
 =?utf-8?B?VGM3cTVXWWpGNUlSckNTSW1lNzdMWlFJdXd4TUdaRWVacVprV2NPRjRVNVpX?=
 =?utf-8?B?LzJQdkczREdqb0RhMFlBNTdFK0xUcHQ4RFZ0azZlUmFVTFpVY2hnSUIrR1dU?=
 =?utf-8?B?dHhiemVmREZKZVRUUi8xVzB0cmg0V2N1NlJLMDVyU3Z0Tlh4Qyt3aURKL2F3?=
 =?utf-8?B?NHVKKzhraC9JNmZvM2VsbTVQeEZJU1pmaHM2ZVN3WmwwR0lnTXl0QllzaG5P?=
 =?utf-8?B?bjJ4MDA3SkpoYVRGRWdiMWdkRUhRS1VsTk42RUk5QTVMV3FKSmJLWTVXTU03?=
 =?utf-8?B?VjFvY2V4SkdDVW1zVkhzZTRvWTdOclRsWUxndVkzcDZGNkNydmc3VDhkbnRJ?=
 =?utf-8?B?YldZdzdJcDNzTzhTZXdWcEVqcU1WdWZiY283R3E1dGNyMWZ5bk8zUzVQdzlH?=
 =?utf-8?B?R1NjR0pXUWM0RlZpQXRNQ3R4RGJnTTN3bnAraW16Uk55dkVMMjBwNzFWUG0z?=
 =?utf-8?B?Zk11VXd3Y245TUlheHdzYnJVTkE2RkQwOWkrbFg3ejVsaGdLZGROY0R4NVI1?=
 =?utf-8?B?OVZtR2NpOVQyQWs1L2JZcDJrOTRWWFl6enFUZEl1WURWMEN6b2hOd2RaVy9q?=
 =?utf-8?B?WEFQUFhraUpDSXZhQTJ3bWI0aTFRZ1BDNjlzRGpZa1UxYytCelh6eGUvSXhH?=
 =?utf-8?B?aEJibnZWM1F3NDJnU2M3Tis2d2tvVWEzN2VYWDI5R2JpUExTcjlPenE1Rkdr?=
 =?utf-8?B?S1cvSkw4WlJlWkRXbkxuWmdscWc0S21mVEtPRjFNaTNaUS9hTitrYTFhWkQ3?=
 =?utf-8?B?Snl1Rnp2UzFhQnFkQityTXIzU0N5RmRWSDlXVitWazdvY2NsclNOaDVvK1FU?=
 =?utf-8?B?cEJmM1JHWlR0dGdPV1B2TzVRa3hZclEwbi9PVVJEK2VpdUJELzRuWkdhM0tm?=
 =?utf-8?B?WUVDQ0JWNHZ1MlFRS0Z5aHFsUE1zZ3lSU1A3MjdtUEtqdFBTQTJleFpzcTAv?=
 =?utf-8?Q?z/AI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGVjS3J2WkMxOHhQeXM0QUNOeXAvT2N1blhqb25HRzgwN3FMY0ttTHQzQUFM?=
 =?utf-8?B?Q00ydnN0b0dvQnBuMDh3bDNOUHhIR1NscCtpTk9DWmVkUWxsUTBaVGsyWXNj?=
 =?utf-8?B?Smt3QmxMSnhZYXM4RUkxUnFXWEZRenlhTG1xWWpYd2xFdENJRno5K2xPWGd0?=
 =?utf-8?B?RkY1c2VSeEdvU0NFK1ZkUWJZR0htL3B5cWVYeFN3SXFjck0rQVowWUdyMTlU?=
 =?utf-8?B?aU54alR6UkxkK2FNdTM3SkZqM3Z5cGIyR0xsZlNVZ21MUjVnbWFEc09iZUsr?=
 =?utf-8?B?cWtFUFM5eFIzRmVuNFp0T09BeHNJTmYvVWVsc2J0R3FKR2lNRStmQzkrZTRv?=
 =?utf-8?B?L1dvNExrZ0hDUlFVN1pFd0JBNTRiQmFOZXhxTlZkWUtXUzc3SG1MVDVNeGxz?=
 =?utf-8?B?d3V5eHVsbnE1eXZqK0orNlYyU2dMN1EzMng1ZGYvQnpZWkdOMG9WRmJpWk1F?=
 =?utf-8?B?T3JiTi9oS09NMEF3akFTVXF1YUNrTmZRMy81TklCSmJheFMxYjdZbmcwSDRn?=
 =?utf-8?B?aE1WTEE4ZHJCbHV3ZUV3VnNLYkg5YWY2R09NZEVTY1R6QzF0bmpaVlBlOFpU?=
 =?utf-8?B?bVlRN3EvSlM2T3JMQ3ZkdUsweEJRNVUzb1dtbVp2SnQ5eDc4WEEzVEZkenJa?=
 =?utf-8?B?aTE4ZW9ZVDNReStwNEN0ZFdkZEN3TTJXcW1OUXRIUktSVDRLTTZPRDVVUzlx?=
 =?utf-8?B?ZlkyQk9BUVNXRWNjRnF0SFgyNFNqZTkvaDA1K3R1Nk9kbFUxc0s4OXNuemda?=
 =?utf-8?B?QW53WVVVVEQ2MXM3WXJUODVpUi9scjQxanB4RFQwbUs0MjJ2dmJVVy9HbEFK?=
 =?utf-8?B?K3QzODVSVFNRM052MnlkTlIxcTFXWHVGTUtpNEZpenFISS9wREtkc01QY25k?=
 =?utf-8?B?YkhWRUo4cDZ2eHRjTXU2MjNFUUFNWGMvZHl4NTdJMGpoRXA1VFJjMDloekF3?=
 =?utf-8?B?cU84UXNidFF5TDY4TDhyYWFNYzVmbUJXUjRRTEVQWGJicysrK3NESDFuYmpm?=
 =?utf-8?B?MmlpN2VVa2ozeElLRkdXdzFFc1M0MUQ2aWR4WXpzb3pyaFJ4ZUZySVdNb2lC?=
 =?utf-8?B?TElSU2hnV2pFbkthYU43amJ5YmtyNDdsYUI2cEFQUWsxcDlyMG1EV3IzTGJF?=
 =?utf-8?B?NlVXT1FEK1dveERGaXZDS0pKTUFyem1lcjE2Z1BRenZaN2gySjFocUQvOExo?=
 =?utf-8?B?emtyT1RRNXc5R0d2ejAzNGdXT09aeWVXNTB0cGRNdnZZRmo0SHByejF5c3Q3?=
 =?utf-8?B?eWNzelI3M1VrMi9CL3hJdUlWczlVcnpYWTcwQ1VOOXhValhYNVJtaFZ0M2ow?=
 =?utf-8?B?VEQvUFAwZ0YvVEl6WXBhNUJYTUVHbndXK2lPcHlOK2xnME1Ob2RqR3FPVFl4?=
 =?utf-8?B?TUc3aVcrQXcrZm90a1VNL3J4UzJCOTZ6bXZGaHR6cGRaNTB4QTBDaTNUbkFi?=
 =?utf-8?B?RkpmZ25GL24vVEZFb0d1UEFJTnkwNFFuOHd3Uk1YS3hJMGlTSnc4RTVIcE1a?=
 =?utf-8?B?OFJidUlXM0ZyOEk5WDdvd0FmTjhNYXZkdGd2YXRFTEEyYXJkeCs2SEgzWVp6?=
 =?utf-8?B?blNyM21GOGZqVXZoVWhVQjdzWTRHVmZQUDBQSW5nTHhIcmRhWjVmT1lQMGg2?=
 =?utf-8?B?eUsxb3RJRCtKcjdxOFJKbUFxL2FhaFZHSHk4b2tWVTYrbFIxblNpc1A4bXZt?=
 =?utf-8?B?eTdGNmgzQWd5OU1aeEZIQ1BsSzZ1UlFPMEQ4aldwdEJUUUIyTXI0Z3BOK3d6?=
 =?utf-8?B?am16NHFlLy9TTC83S2Q5T0hBaDJveGtteU9LUGpVdHBiUDN3eWVLS2F1cFVR?=
 =?utf-8?B?bGVuSTZsaE9XRXBuc2tWUGNSeHlIaGFab0xMVFFRaFEyL09wL1JicmgyQXJy?=
 =?utf-8?B?Tms2RUxSZ1VBeW1qOUY3TWhxM1Ryblcwb01tVkpGVnNKeTVsV1M5UEdSd3NZ?=
 =?utf-8?B?VmJwUVJGaDQ5YmR1SHJoczZ2bmxpVW1CbVRtYkxRNjJRY0g3bFhINkhkSHJE?=
 =?utf-8?B?U1ZwRFNTV2ZEQ3l4VW9XV21hSDd2NHVwNFdDZFoyNmNPOTVTY1VsR2JTMVlS?=
 =?utf-8?B?OFR3SWVpeEx0ZFZkM0tXdTdsdmJjZ0tmdW9xSXlPdnFCMzZKbVcvRnpTTERw?=
 =?utf-8?B?MzZ5Rk4wRHp6TkxGMVVOWHNZdGozdDIycDhiejFGMUxTT1VJMnRRMUMwcUZE?=
 =?utf-8?B?cjBDdDR6czZXWlIwZmNxNEhMTnQ4MkJJMnY4bEk2cGZWdnB0YThYZ2pMd2x6?=
 =?utf-8?B?TTZ0cktWKzYva29sWVkvc1R1eGNFSWVUR09LWFNIaWdJVUZTdlBDM2s4TmpG?=
 =?utf-8?B?aWg1OHlYNW9MN2M3d1ZHV0hEaDFQaFFYTU9zMlpBWklPYnhSVWhBUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7374344f-95f9-4200-f811-08de539ef924
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 18:58:58.3662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WglZ1eHbLdpVwn7k/0oDOKb1D1wHU4PXEiybL7+bI0xZoCLIK24CAtOblRcfw8bV2ZComMfui9S/pQaHTnOvYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6219

On Wed Jan 14, 2026 at 6:18 PM GMT, Benno Lossin wrote:
> The `Zeroable` type check uses a small dance with a raw pointer to aid
> type inference. It turns out that this is not necessary and type
> inference is powerful enough to resolve any ambiguity. Thus remove it.
>=20
> Suggested-by: Gary Guo <gary@garyguo.net>
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v3: none
> Changes in v2: added this patch
> ---
>  rust/pin-init/internal/src/init.rs | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

