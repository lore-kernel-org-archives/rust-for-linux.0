Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020125.outbound.protection.outlook.com [52.101.196.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F1DA930;
	Sun, 11 Jan 2026 01:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768093809; cv=fail; b=BLVP4+WItOFGuRDbVONqqGVHs12bUU39pqO/inQt8LvNujHk1omRSsSn0lCqAdEAxSH5di4+oSKKCLyFwPIiMs4vAhTu/Itvazqy6He0yDELdO4dahyY7yeRalIlYumcQwaEFZy18k9T6gW55PQbCJRii48a5wWSTBg487CCb1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768093809; c=relaxed/simple;
	bh=vXAQmZs4w7LjespxlbuXC7MvkAkQuP1eO5F3vPWVFSU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=bXeV0u0tQB6bq9Soci0xYCbw6NnmOT5d9qrpifFqvx+bFFv4Cg+8kUoh6Fvln16iST3JS/5X6Kk6O0BLYY4IQrVgAg6ZOMGkyIrXxOswMgTBWEnu53vjRqK207DA4PWa/otJNHTzsOTaNV08Qm5z+qxMDfvteh0VVb8AHmkx3R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=CzEQrMEP; arc=fail smtp.client-ip=52.101.196.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="CzEQrMEP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dd/nPoWJJTagZm9uXJ9YVeqGMbI2VpOwhkKiaBkZlD/baLGyVYnuJnjtJNSovWKC8m+ifyytIGMxSTEpIAbA48ZXS0jG3OCAlyXS2Nlq+U4pqFjBylHw6B9fz6fQXAeO9ceQx+IYqRY7XtvZIZRoTXd0yAaTtS5fTI/3CSCrVcKBV5ExZxdAf0dA9ulMjMcCeCk/QyNE5J/E4SzHAqwzCM9N3v3DFSqoDbnoDKg298KdpXafqsXsWNFAWIfymRqECKbZMKuTot/xYg90SOLEfcXqlbs+BEvFQM/PuHD7CZTNVWct8ESd1YNvzd7dzxN40K9AtaHkAocVETX1kknlnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/vLlV/lovNpr4NRi/UOOJfybJgVN4aSO07HJJlIex0=;
 b=Qit5Ikj9QC1/q9hvAHF3eDRvwwQvsna73ufybiMUnZALXeocExEGAT6N/yIhTme7PUhYuENy/Nnue/qF98LiJfW+zzKxWEGrlK9fqhq2PxQjXwVlAcKjsmYhqizPIfYtzm7N2sbNEA1DGtYtHuY+Na96ptOfKwxpvGa1GXNwAehBKqcD3rt7hmBt/nufG6DoQnibHZN3N0vmq17OIZkdxVPJ0D6sSDMC4Ie1ZEm7fhzQIZcPMvGkcHY+G7Eix3LSobM1jp3zraDsO1G0LYPaoOhhRSuTh4MrpR4iZ/uTIvsZV5hkLFVwyQLPdsBgFyIGReNOuP4hDFThDuFrH6z2eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/vLlV/lovNpr4NRi/UOOJfybJgVN4aSO07HJJlIex0=;
 b=CzEQrMEP/bTDltUf2s37WJcvLXkysUqO+sGGcGgoXpaPuP7FJixdTgstj0qbVzzWCS60lSJJLbgZ9DSh83Db9M5VCM0vO39O2H3LpFust07jOVjxzg+cpIo2OS+eM2Bj+IwZQjTDp05P97wU48PqK2M3ORuuHFKF0BCuDO4eSMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6328.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Sun, 11 Jan
 2026 01:10:01 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Sun, 11 Jan 2026
 01:10:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Jan 2026 01:10:00 +0000
Message-Id: <DFLCXYSU8BET.13MZTJP38XZV0@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 08/12] rust: pin-init: rewrite the initializer macros
 using `syn`
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Christian Schrefl"
 <chrisi.schrefl@gmail.com>, "Alban Kurti" <kurti@invicto.ai>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-9-lossin@kernel.org>
 <DFK3R2EK1JGL.FFW73JGUSGP5@garyguo.net>
 <DFL43YZQJFBM.3D4VE24MIKLYZ@kernel.org>
 <DFL5I47BBJOB.3RLOS601BRLFU@garyguo.net>
 <DFLAKHLT86N8.11AVQHO5M8UC2@kernel.org>
In-Reply-To: <DFLAKHLT86N8.11AVQHO5M8UC2@kernel.org>
X-ClientProxiedBy: LO4P265CA0246.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: b81e77c5-aa5a-456c-b793-08de50ae2558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QllVVjVUODMzNDBROWo1UEdpRFhDTFhPV296VS9qWTBkTmpYb0w0dTVwZEVT?=
 =?utf-8?B?ZktMQldwSDVtUGcwK29aTHVBazBQZklBdFFlV3BncnFWVXlCUHNQVlVJRG1Z?=
 =?utf-8?B?WnYxYXBLVVI4YURkcGQ3TGphNklwYVM0Vm9TeXdiQTFWUHJMU3FJcUZMSTFQ?=
 =?utf-8?B?S3pyRFhrcklMYXBBZllGZmEvc3NlL2hoNjIxWlV3Wmx0TUgwa0VsWDJsdTRm?=
 =?utf-8?B?eC9mYWRQR2NrRjU5c3dNU1pDSk56ckc1VjB1T2tQTDZQY256NHIvbjUrL1Qx?=
 =?utf-8?B?N0xsV2E5MUgwcWR1OGZPM3MrV3czTTJ0QVdxY0N2TkNpNUx0YjM5d0Q5d1A3?=
 =?utf-8?B?a2hkT2xsM0p0WUR2RW91Ri9heEt5dzBBTFJ2Q2NWZzVKaG1RNk1jVlA4V0lq?=
 =?utf-8?B?am8yNXlWYWRrUmVDNHRwM3VHa3kxTVBqSjgyQ2Faajkyb0FLejJnOU9QZ0FV?=
 =?utf-8?B?Q0lWSlhBc0hLUGQxZmxUNTVMTW84R3d5a0tyaVVYczRNM3J6aU40cWp4ZHhK?=
 =?utf-8?B?RUYrN01kTjBtZDNKc2lpcjZlK3ZOVlZMOGdWMmFTTUkyaDNpeEc5SHcwVFcy?=
 =?utf-8?B?bVdRT3d1WTJPYjY2cDJkeUJnbHB1WXVoVlhuTlRNdHI3WjJmVmNZZ1V1Tlpq?=
 =?utf-8?B?MkJ0YnFXd043M0kzWDJMWWdsZ1pqOGNTOGlPY0lFYkIvak1hTVJQNVMrbFhh?=
 =?utf-8?B?dmpCZVZaQkY2elhBTlhhSUttWUlWM3JMVHVka1ZKYmFFZ0tUUDhlcXlMaGtr?=
 =?utf-8?B?WVl1UXFmYURxQytER1hSUlFoL1daZ3hHN2dJOEFjZ1N6dDdUbFZhTCtCMC9x?=
 =?utf-8?B?OS93WmJYaDlnbVNpNXY0TktFV2tNTER4dUpBSkVGUmRXOHpLMEtOZm4rZXdz?=
 =?utf-8?B?d0hXaFpUSG9Vak5EMFYzMjIyckF3ZHNYVllIVG5jL1c1VEN0dXEzTHdXQ1dZ?=
 =?utf-8?B?aktMalorM0UyZmlEUkc4bmt4MFVZblB2L1A5UlVKNk9WUnA2MGVOUWJKUzla?=
 =?utf-8?B?RFFDaW1CcDJYbEtNWTlQRXlGdEcvZTBwcGNadWdZejB6cWlDaCsxZFZ0MGZl?=
 =?utf-8?B?SGJXZEpnU0syYVJjSTgxdG1uYzJlcis2M1o0T2hZQmJxVGtzYlVPdjQ4clNa?=
 =?utf-8?B?RW1kNnIxcWNDOUc2cFRYVmRIcElaZGEwZVN2Vkkxek5hZjVvL2d1dXJxQXhi?=
 =?utf-8?B?dlVjNVFRakxLMUl6S0Uvd00wZG5IZXZQbEdJY2xKazhGbFZYNmJFU01qSVIy?=
 =?utf-8?B?UWp0WnpDZzFrVWN1RHBEam11VjRjaEVhOHFEMWd0NFJyQ3BkRUVYYlVBYTV0?=
 =?utf-8?B?SVlIWG9jZGR2OXVBSGlvVk5MTHlvendPekhaNEhGVmZ5d2QyM3p4WmE2Wmsr?=
 =?utf-8?B?ZXlOYTU0Mkl1ZDBxc2p0eTVXMEppbkNUMTFCdWtaM28xNjBmUy83amFLV1hU?=
 =?utf-8?B?UzVYS0xGVDBhbExOZXRJQXRsZjkzWVF0akNxZzlnZ2ZMaXZ4TnVWcWFqZUFF?=
 =?utf-8?B?OWtpTFgrbmlVdm5mZ1pXVkhYY0FWWE83RVVzNTBrL0RWWjkvbUd0eUxrVnox?=
 =?utf-8?B?Nk5JbC9DYUNDbEZjWmZNWUdiUHRIRjdYV01tRnZXdlhtdFRGOGtqL05ITW55?=
 =?utf-8?B?azBocWtsRHE1SnkyRlhUdGZxQWFZNjlhZ0xBaTFhSEtnakpwUi8yMW1HUzc5?=
 =?utf-8?B?dFFtY081Z1ZnRXNLRm5jU3hFOFpBK0VJNSt5Y1c4UVJhYVJ0N0l6ZVFsMlZy?=
 =?utf-8?B?Z1JWYnZsaDMyeUNGS3hkVktubC8yWUlPWnphcFN1My81UVVLSlc1WCtoaTR1?=
 =?utf-8?B?ckx6Z0Z3bXFrWVM2VGN5dkd0bmYxcUJwOHZxRUpRaFEyU1d1SHFIbFEzWUV2?=
 =?utf-8?B?ZEQwN1BCdDAvTStkc1Iwc1lWZmpPaXRGQ0QxU1huV2dsZzZsRkxSY2ZRb3Nh?=
 =?utf-8?B?RkNtQW4rVUpKdjVEd3JlWk5rNkJ6bkZGWjVLanhManNHWVVMaU85MitFY3RN?=
 =?utf-8?Q?eFOeeMc1CIYdcjbJHkpZpqDK1JeAW4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUJSMXB4Q1EwbHAxR2IxN1JNTjJNM0M4SjlPdW5jZlIwS2FpUDhPR01zbGIw?=
 =?utf-8?B?d25NaDd2T1BxTG9NQjc2RzdYMFM1S29Xbjg1ckgrYkxGMENkWUsrTWE4K3dw?=
 =?utf-8?B?YkVzczRsSGJ2VC9ickFtanlOaDh6MVRZTDdCb2tOc2prd3krMWlrT2FSMVBt?=
 =?utf-8?B?QzVZYy9hMjlkZW12c2R5VUpUZDlMSWZGRExRa0hQU0l6ejZ6ZEd2MUVDdzFQ?=
 =?utf-8?B?Znk4QXFJc2g4V3cxaVBMYkxMSnhGdCtlWWJpay82V2tlb2duckxTbVlSbHhU?=
 =?utf-8?B?WUV5dE10RFgwMEsvMC9iWTdZNjNZcDVHRzNJNTFRZVlPV05LM1N2WFk0WStG?=
 =?utf-8?B?TURmcnJjQ21CNWNhd05RN3g0MTdDbjFQRjRqTzBEb3kzTUxad21uZmQ4QW43?=
 =?utf-8?B?WjBQQUJBNnNvTnkyS3BzbmhDZlVwNzdNeXRkcjVNNGdRZlp2RUwvQm5Uem4z?=
 =?utf-8?B?Sm9iNmhpUXo3UG05aDdaZmR6Q3J3SklpRDRqWjVrK1V5ODVGZDRlaXRwV3JR?=
 =?utf-8?B?R2FENVJOZkFEb01TNVF6MW16cVVjK0JpMFVlc1BHQ29OTmJvQmQ5VlRNMTJN?=
 =?utf-8?B?ajJuYzFtOWJyRTkxcWZ0U2hkcDAzSGdrRFdPaThpY0lEczNRTUJFUFdpUXNQ?=
 =?utf-8?B?ZUhSaUhDT3JNRWtnWlI2ZnYvL3BMS1BzT0E1Q3ZqRWRIbWhyS0hxeHZ6ZDVp?=
 =?utf-8?B?bTFNOGJRRFlNR1VqNXJMV0FKRy9jU05TZElRQ0lBU0tUYmx5N2ZtaDIyWUhP?=
 =?utf-8?B?S05xSUZXNXlyZWwrK3A4MXh1bjZXRWsvTUVkUWtuaWRFeEdYMlhpS1pnb1d2?=
 =?utf-8?B?N09CRDNwTnNxRURLcjdpbzB1dHRyTkFSR1BTSDZicm9FY2FjRmRBd0Y0WFBs?=
 =?utf-8?B?U0lGbXljNDNjQVB4VnBjSlJjaDJ2WTgySFJyVmgrb0d2VUN0Y09nQnlscHN0?=
 =?utf-8?B?QXFzSGQxTEllU00vUU9mRHp0dGQrV3V2dTNkNnZEWGU1QWp0SFdaSEg5S004?=
 =?utf-8?B?dWFwNHlmTjIrb1dMQzlxdHNOV2NwMUplOW1wWWRxZGZUYy9MV2FBTVNEcU5p?=
 =?utf-8?B?UDUvWE5SMHJnc0o1Q1kzenhBbWF5T0VjVUJ5UWMzTVMyREdsaWVlK2dFeEFS?=
 =?utf-8?B?UkxyMFJWd0pNeDdFTE1ScXkyVnZ6UW1lSjd4NGoxSHVtQnNQcGtZV25aNUh0?=
 =?utf-8?B?eVJheWZjRWVYSTd1eGxhcGVTeGU4VFcxNWlsRjdVRG45bFZKblE4QlNOelM0?=
 =?utf-8?B?aFhVcjIrTEtUQzdaQlJmOTlPRnBDb09pVmtreUpFUkVuUDlHUnpTcEFENFZB?=
 =?utf-8?B?Vkw3eG81VGpYVUtCNDJYZVVpUWpPZFRwTlRpSjFmVFRJcEx0bS9xZTBkM2VS?=
 =?utf-8?B?aXNHTDN3eE1xV2djZHN5OXZWNlhseGhadDJZY2doQ29MV2lmcHFGa1lScnht?=
 =?utf-8?B?aCs2ZDF1UEFaVzJ0QlV3aEV4cTNsd3B2bmtQR2FydHpXOUszTS9hbHRheitn?=
 =?utf-8?B?Mm45cU5mV2lNWnpndWQ1amtiVk01ZGdWMEVOc3ZRSGkvRG5XeWNPUEM4dEFt?=
 =?utf-8?B?UmJXVXZXZXVEbWtSRHR3TFpIR1RCTEw3cGQrZlB5alp6Z2tCdFFwcnZ4V1Ix?=
 =?utf-8?B?cmZRWERpdHdUWEZ4aGtBSC91aERuZVRGbjZSQnYza0VDd1ZpOXQ4YmFrN0lU?=
 =?utf-8?B?Zk9FNEYvOVFvcmtSUEROT3Y3NUlBdThLVDVWR1U0U3hwTm1wdGRWdDNOWmRm?=
 =?utf-8?B?RTBpZ2FEQm1Ta1BXTWRmeDNueHpXeDF1V2t3ejRSL1VHbWxzR2hWS1VseW1u?=
 =?utf-8?B?a1hkUHBRSWFvaTJ4MCtMTnp4bTdkUzhBL0txL3hZb3dPeDN6TWh2dDk2dHhu?=
 =?utf-8?B?aXd4Mkd4MmNFeUNrb0xMaElJT3BGRHFDRUZXakowSnpFK2R2WXhTc2RRRXlW?=
 =?utf-8?B?Ly9ieHVGeHY4T3VQLzBmM2dUMFVodnVveFNSUXZmS1hJcmltTHYxQXVYQVhJ?=
 =?utf-8?B?VVgzemJZQ3lxM0phMkhFUnlJWExDK1NEZ1JrNUlaOC90ZHV4VVpJMTg3aE1n?=
 =?utf-8?B?MjlMcU04a2krTlRVd2VIbXQ0a29sbHA4SmxjazZ6OWJpVTFYc01HQ1prUFZw?=
 =?utf-8?B?V0Y0ZTk3d1VuTVNKZUcyeGJqUnlNdzU2d2tkSWZvRjk2bTB6ckJlMUtkYTE0?=
 =?utf-8?B?Rkd4YWNrMjFCMFZGSmVqRUxjMHdxTGJEaGljT1BDT3FnNm5RWjlrUjhPUEc4?=
 =?utf-8?B?a1plSnFTVmM2SndpS1F5c1RpYXVFZ1dLbzRmd3E3YXB6Q2s5Mk81Y0gwOE52?=
 =?utf-8?B?RUJNYmFVZHNKR1ZmZkFTanVDeUpOM1BPWnRxRSs0czBZeGJxcUY1dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b81e77c5-aa5a-456c-b793-08de50ae2558
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 01:10:01.5308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +XHI15yJpdOsBCZyNVyCymMOhPqfbqIRVVZXtGv9M9/YXpRF/BhbSqPUOfDfdF5RxHuTw9PQkp5PjP4syZBjeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6328

On Sat Jan 10, 2026 at 11:18 PM GMT, Benno Lossin wrote:
> On Sat Jan 10, 2026 at 8:20 PM CET, Gary Guo wrote:
>> On Sat Jan 10, 2026 at 6:14 PM GMT, Benno Lossin wrote:
>>> On Fri Jan 9, 2026 at 2:45 PM CET, Gary Guo wrote:
>>>> On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
>>>>> +                quote! {
>>>>> +                    {
>>>>> +                        #value_prep
>>>>> +                        // SAFETY: TODO
>>>>> +                        unsafe { #write(::core::ptr::addr_of_mut!((*=
#slot).#ident), #value_ident) };
>>>>
>>>> This should be `&raw mut` now?
>>>
>>> Yes, but that involves adding workarounds for 1.81 and earlier. I'll
>>> leave it for a future series.
>>
>> You can just enable `raw_ref_op` feature globally. We've already enabled=
 it for
>> the kernel crate.
>
> It must be possible to compile the pin-init crate using a stable
> compiler.

pin-init crate just need to use the feature without any source code change.
Enabling can be done from Makefile.

In fact, in e1dfaa33fd2d (rust: enable `raw_ref_op` feature) it has already=
 been
globally enabled for driver crates. You just might need to explicitly enabl=
e it
for pin-init in rust/Makefile.

> Enabling an already stable feature still causes a compiler
> error (last time I checked). So we unfortunately can't enable it without
> workarounds.

stable_features is a lint that is globally allowed in our Makefile.

Best,
Gary
