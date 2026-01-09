Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021117.outbound.protection.outlook.com [52.101.95.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACF035BDBA;
	Fri,  9 Jan 2026 13:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767966319; cv=fail; b=haia+LZjr6R/HBToTcYLLC/zFpJEIVW2setaJTsv+kHOJsRxfTiAtRKuk4rUJaVmqrC7pzailDGtcx0By2kXfBvwmcchz6G+bpXYgnqkH9juMtFa/bz6Coe9aOXgxgQYvcUtBYfxPsllXlgDMN9I/bya7GZSewoMc/lPdVuKCvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767966319; c=relaxed/simple;
	bh=yFBvG41TmElG80PHUlc/AN8y3MwlqoKy5kvLjepjQm4=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=jTaQ3V/BxyGdZfLNB5TN1sZ7/1vYJ2KRZ4oAdp/fZaD6+JFNBuMcIAiZSZ7rhygKUFgdXr6p9AKZP1E72tDBNDXQwOEXPQIAkZg+xVVZgbjMDNKaHmnolEEVY/IUhx20UQjYNfv4QvAdgJJkNQegelOku6ek7Ssph77+7430XE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Yr0dpfpn; arc=fail smtp.client-ip=52.101.95.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Yr0dpfpn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/t5rlPj4E1ZyWMkNX3sZT4PMtHY1ErHT0nIuVAS5DGgGFft4DY/KA+VPzUbVioVQX4eCY4R5ChBI1gUpstYeqtEmnTUII9je6CuP21eh1bpJgauAKtoNjSErSikC5D++u8m3oUFh+J5wjvd0tVld3aZUCYHioSpdyUn1710Gv8qdizck3O01zEL925/DbCj2y0Y5iIY6zInKQFl8XHzq0+W8kZ0fF/keI7CRVSRbqVArEPi4xIyMHkQgZdNr5KZ8wiD0TrHgW/KNWnKEi5rzU9RitD02SKDlRO4+QyAkgjh50BvY3wOGM8CMWV4dvWfzTB+/vX1tEyh6xms6WgMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpW/43OJ9HreiEZmmR9R/mV3O98xPBBWR/cO0ngwiOg=;
 b=miwZ62sG8j8N3TVRNqLK5HW9/Wa8wlLTsv9drOhi/XSa/Ntmvci/iGHvE9OPiXJmVs1cXZH08OGAyfAGnup6Ji8tAyUhclLtDRrHxcalLSzGWP7vHiStCSJPUNtxOoLPwiy2VfL+OACeVs4iFA7VOgDNT3LW7hF25bYtbDnIExPkz9BuG/6/zp3IXFgioilnSNe6HrruVkZ9/AmVL5YVsVoJq2waG/AW/s/31zVagqGerROJ0TTOAdG7lSS76pAV+1XlR8snZ1B+My3VB1/ZCeJWB9v+b2E8NgSIwA53Y0WMgC4yBKhC7OZJVyh+aRd+8uviqg7f8GWFNTraAW46PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpW/43OJ9HreiEZmmR9R/mV3O98xPBBWR/cO0ngwiOg=;
 b=Yr0dpfpnlVIJ20dis5XqzKr72xIalgWTX+nqlX4z6ej4PPnP1xwryX1VLryNRhkFaCbXwG5SlHqkCVk/qWnYU8h1SN/aHvAhZ2zR04bc/pSVMoBF00FbDamQtrXyKtP4DjWAcQtnEOznAidH25IymQ5i7QV7kgJELsP1Nbfe29o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7070.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1fb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 13:45:11 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 13:45:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 13:45:10 +0000
Message-Id: <DFK3R2EK1JGL.FFW73JGUSGP5@garyguo.net>
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
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-9-lossin@kernel.org>
In-Reply-To: <20260108135127.3153925-9-lossin@kernel.org>
X-ClientProxiedBy: LO0P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b8d981-a60f-4833-fc96-08de4f854ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|7416014|921020|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDVlUDdsWThyclNEWmd5T3puNEJXREtOZU1HVFBrYmZ5eHR1NEZzUE0xUkdG?=
 =?utf-8?B?MktPZ0E4QzZ1TlRPekdkcWpSS2hFOFg4aWVNaFJjTmlRZWN0K0RRNFpLa2ps?=
 =?utf-8?B?Z3VTYXR0UDd5elN6SWJZK3VhOXRNUnRQeHFvTGlGQXFNSEFtZGkrQXV4TUsy?=
 =?utf-8?B?aVZNMldKQWM5ZGZaazBJeHB5OGNNMWZhMm9xcGluYlNZT0lkQ2NKakp4bU9S?=
 =?utf-8?B?TnlWQWRERlJMeHBYZG4reXhiR1JXKytQd0xKYjlOSkNjN1RPMXc2ZHZpQ0h2?=
 =?utf-8?B?ZlNFZW56cG5MYWdXbFVKSzlkY0NaVUdwYzA0Y0xYSWxXbzZ0Nm1vM3BkN1RJ?=
 =?utf-8?B?YzRKc1ZITktwMnlucG9zNVFidWtQV0kxaW9uSXFRNEgrK01aditOOSt3WXpE?=
 =?utf-8?B?T0dreDVxQ0l2TFhvb0xiaTZzMWtvbFlhVHRwUkFoTWoxT3AwY3FIb3RmeU43?=
 =?utf-8?B?ampERWlqSFZSSmJFWTJubFo2ZHhZRndNUmNyakFtR1h0U2VYVzk1aGNEclcy?=
 =?utf-8?B?dlJ1VGNZdkVwKzIzQTFTbnpZTmpiUDl3aGovYWZTdkdtS0pjUDVibGNHbUJm?=
 =?utf-8?B?M3VNaGdJSHRKT3Ryc1pDeDQ0akEvNURKektvbW4raVZNTVROYVhiYnphdHJK?=
 =?utf-8?B?aDN4T2JBOUl2NGVlaElUaVhJeGxzbFVKdzRwbGJxWERoZHNwSTg1NHhCV0dP?=
 =?utf-8?B?ajdTV09KcFRDRHdNZHhWN21wNlBEaUlwOXRpNUNVZ2d3ZHFic1RnZHJjd3dP?=
 =?utf-8?B?RGNkaDArZkpzQWtRTTcvZkhmMU1JMUpJdGRUSEdJcUJHTTFsMWNlakxQdllX?=
 =?utf-8?B?WkthT2orSHUyN2N3UlFCbXh3bHdWZTIweHZYdXlFNklBTk5MZUtQYkh1Y0JL?=
 =?utf-8?B?cmF3WG9ibU4ya08zMldHdlg5TzJ5ek9aRXc1Y0ZvbkFMcmxkTElWYmo0bkc1?=
 =?utf-8?B?bTNLQmIzcHozbGNPRnVqOUtEWnEzSHU2akUxK2N1b0FsTk5Zem9TMGZCTUsy?=
 =?utf-8?B?TnExdHhNRGJodUF4cmJBUmdVMFl6QWN0d0MwWWc2UXkreVJhMndxTFY5eEto?=
 =?utf-8?B?blNydzhWL0NVeU9DbmlMcEYyUCtkZUUyck9RSGNDNnBIdDJJRnVGakw0SGRP?=
 =?utf-8?B?WjBZZVhZQ3lYeEdGbXcvQmp1UzJCVG4vYWhCbHpBNlF0TTJ1K3NtVE5kazds?=
 =?utf-8?B?VEhaQ2RxUUROalNZdGNVK2I0V1c2bzlHbzJYdlhUcHNnMmEwalhSSy9idEpP?=
 =?utf-8?B?TW5IOGpaWCtSbUt1NlJqRFluZzBVanhQYjhwaVllQ0xwZ3Rld1RUdFIyZ0Rp?=
 =?utf-8?B?V0doUGRPOVlwY2YybHI0TDd0Y0lIcy9IZXNhRVozdys1c2lOTTJmRHlLK1ZQ?=
 =?utf-8?B?SlVTU2pqZ0RWNWRRWVFaS1FSMDFaQ0dJWTlZRVB4cVgwbGpTTGFMcExZbklO?=
 =?utf-8?B?STcyNWNjVFdKbmpTZkNLUHhyZVArZVdQNGNEU0VLelhQSTVGbk9UWmwva1BT?=
 =?utf-8?B?UnJTZmVtVmtOVXk4U0c4YzZLU2tESTlRNHYrcjFsOVUxejQxSnZ4OFFZV1Fm?=
 =?utf-8?B?MnhmcTA2NzdCazlXeE5MSkN1SXoyZjJ1QTQyNUZsMU5ib0lZNDVYMUVZeHpL?=
 =?utf-8?B?ajJHOURTQ2tnKzRlNENIQkYweXRyYWcwUHVVM0h2OEc5dTI3ZGc0QldFeklo?=
 =?utf-8?B?Q29aTkhVczUzbmlkWUtKb1kvL0tMMmNqNlhRZEhRbnlkL2R1cUJuSVh2OEZT?=
 =?utf-8?B?SkhUbnc1NHJoSE03Y3J1clg0eGJTb2hFRFFWb1pvOHl6bjhIN05PYkdPMjh5?=
 =?utf-8?B?dGhsSFpkOUcvaXQvam81K25SSjhzc0dQWDV2U2t6YXljb1RWbUJ5NzZKZVlD?=
 =?utf-8?B?OUZWWTRTeXptQ2Mzd3RORHFNR0FQdmdOV213MFVMNFlrZnRJdHpXRDEyMUJH?=
 =?utf-8?B?eFYxUmxKRkRIMUx5WVpVYmtCQ2VieVNOdW5yZ2VqSTFSdjFEZ0pWeWRJRkFw?=
 =?utf-8?Q?MEC78u6fFCqXzIyjKfVRCLj4R+fu/s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7416014)(921020)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1Q3SUVIcHFlbGFESWdaUUhwL3dNV2tTckpsRk5zbndpQTFiVW45bUptNm1D?=
 =?utf-8?B?UFNvOXY2dEc1WW11QkthSDlzUnFTSjRKQlVvME0yQ3IzSmR0WkdTMDl4dTho?=
 =?utf-8?B?czU5Qi92emVpK0Q4RnRtbWVKd05oTkxvSng1ZDR6SHVxZS9rTStDOFpQRjZ6?=
 =?utf-8?B?am1tajRNeFMvTCtlbHJhOURKTEljdko0NmlsV2JVcUkyaHVxenJJejBXZ2dI?=
 =?utf-8?B?RGRxT3NiQW1vbUlzTlp4MWJSMzJaeXhVSVErc0dmNEJ2MzQ0cERKenBJZUlQ?=
 =?utf-8?B?MjlmajQzWkNnWnNYbExmK2gvSEJ2TnN1eG5LWVJJWmdBVlpRbUZyTStBU2w3?=
 =?utf-8?B?WnpoRGtYQmRBaFlmeGVMNmZqcTNJeVNiLzIyU2tvWjJSUzFWVVg1L2I4eHRh?=
 =?utf-8?B?MmFOdkhVbGpNditCejZMTld1ck0wbW9HZTVBWTUrSWRqeVI4dDBtNmxuU2dC?=
 =?utf-8?B?SjV5citpN0lrV1g3RFpZZ25ZaUR6Ym4yTjV2VVE0Rmd2aWlBMFJ4clowN2du?=
 =?utf-8?B?N3RlYjMxUEE4dDlGUEJSTUpxV2ppdzQ0N1lUcnA2WmNQK1Y0WkRNL1Zvbld1?=
 =?utf-8?B?ZWdjSEJOaXhTbzluNUcrZzJQUXp3Y2ZvRTYzcko1OVh1SnpibUhDL1RjTnRm?=
 =?utf-8?B?NjI2OS9xYmhSbG1mZ1dxZEZhK2VUUHNuYkNncnNYamJPQnBUYVZoR0xwL3pN?=
 =?utf-8?B?d1JFaHVFTlJPbWZTM2NRZU95MHF0TG5QNmRzY3BFRHFWVVo4bmRhVytkMkZn?=
 =?utf-8?B?TXlUcmwvTHJNUnZHZVlhZGcrZVRnejFmbjExVUFCbjdtRWRGNDVPNzRpN1li?=
 =?utf-8?B?akVUYkQ5aU9LbGFxUWJEWlBiSGtWM1dMTlQyZDIvdkdBWnhFQ2YvU2YrN2dh?=
 =?utf-8?B?dEk4ZFZFbmI1aXpOZFY4aTUwelNucGNOSThna1VFa3NxaTFTdFZrWUc0ZWhD?=
 =?utf-8?B?K0lnOTJpMyttOWhpeGowTVhkTnVYYllPMzE2N0ZBRWMrR0NSSFFXUXRnM05o?=
 =?utf-8?B?cDQzUk1CUUdhbTVYVDlXMXEyK05rVXoyYzFCcS9oUEdrcTNpM0wxWVZqZDZ3?=
 =?utf-8?B?S1QyYmNvOERNWHI0NVJ0ODJKRVpDb05mYkVFWWtEUm9SSEwwTVZmd0dhQnl4?=
 =?utf-8?B?SEZOejkxR1hmU2VjaDgyWUtra2hyUmxRYzJZTldwM1pjZkhMUm9ZUUpJRDgz?=
 =?utf-8?B?RjIvejdRcEVBQjFDWjdBNVBsRnJIdUdBOVpwNkV4OVY2TmxvczhkeUsyanBk?=
 =?utf-8?B?cmFRVmw4SzZKeGR6czFyUS9JSGMraXpqUEdtMDNQTlFtSnAwKzhVajd5L0FW?=
 =?utf-8?B?SHMxN3U3VStnSi9rbFZ0OGpYaFBRbE9GTHd4Rk8rZk5VNjB2VjRrWXVEU1R3?=
 =?utf-8?B?WHlOazdiNkx2UkxnbU9HTWU4UGVBL3I4aDlIV1N6a01Qb2Q1KzRwdXVUa21L?=
 =?utf-8?B?REpOaVNVZ1duTkFhVlZic29paTJZdTZvQWlGVmFJcnpIcjlmOW00ME45eDMy?=
 =?utf-8?B?Z0kyTERvNjFyRjR6S0JIQmREcUFmc2YrZnpOWGZDMUJxTWRFVGVzUXRjczdB?=
 =?utf-8?B?RTBHREtBMHdJMnJERDZHMHM2YjBoQ0d4cDlDVVQrazJwRCsxeXZ2cGlIUU1w?=
 =?utf-8?B?TWl2bm5ZMlNYYVROc0lQcTZSd3lkcEFjWXA5cmMyTkk0T05UVGNJcFVYL0RB?=
 =?utf-8?B?dGFxVTRpSUVIYit1MmxqMXkrd3RubmxNekpYUHVKWFBDMmp0MjRDV3IyMjVJ?=
 =?utf-8?B?TEYxNUVCMzNSTXEzRlVhdFpvK2VDeGFlN2JqT0d6bEczQWNIMkZ2MmVpajFo?=
 =?utf-8?B?Zyt3WTlKSFMwaDR5dzk3YVBkaFZ4bnRDVjhJalpQOG9QZ1M3MjlUbXppV0xV?=
 =?utf-8?B?QkZHTU5ubmUzZGpHU1ZMNmo4ZC94Mm1TbUxvZWY1WmpSbWs4ejVqaklxYWNw?=
 =?utf-8?B?VTg4NktrRlJGbHM5bFNIWkRwaG9rRDZ2b0xpQTRnTlFld1lJajZuL3lXVDFH?=
 =?utf-8?B?enp3YmFQWHUyeE96VTI3T3JEVVJybkhvMFRheERyVFhMZkx3bHExaFFJMjM3?=
 =?utf-8?B?SEdSVS8valNVRVJONXpTSkhObUZLSC9KWmJQcVRiVlQ2QVJxZjhZd3ZJSUhZ?=
 =?utf-8?B?OWd1T2g4cThzYU5Lc1ZpRExTbE9DMlkyMWZZMGtReDU5MkFyZWMralBmSHNP?=
 =?utf-8?B?R0cxZDd3RzFJd2lUMDNQQWRzckR5QStWbXJualNmZGtZOWF2Q0kwUFNHZU50?=
 =?utf-8?B?M0FpUzVJdHZaM0hrejNzZUJENnZ2UkFEYnhyUzBEQ0t1OWs5ZklMUzlnNjk4?=
 =?utf-8?B?eGlXMGxpaS8wdTFKUUFCMTJIOTRpYysvMWtka2UySkUrMENYdG9YZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b8d981-a60f-4833-fc96-08de4f854ef8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 13:45:10.8390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VX6lB8BinJPcpDzKki/v/uhQ5bMovBhXmJO+TyBmOaUCw+vTwuN4Jq7NEcasdXjLu78UQROsFHPeo3IXbRj9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7070

On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
> Rewrite the initializer macros `[pin_]init!` using `syn`. No functional
> changes intended aside from improved error messages on syntactic and
> semantical errors. For example if one forgets to use `<-` with an
> initializer (and instead uses `:`):
>
>     impl Bar {
>         fn new() -> impl PinInit<Self> { ... }
>     }
>
>     impl Foo {
>         fn new() -> impl PinInit<Self> {
>             pin_init!(Self { bar: Bar::new() })
>         }
>     }
>
> Then the declarative macro would report:
>
>     error[E0308]: mismatched types
>       --> tests/ui/compile-fail/init/colon_instead_of_arrow.rs:21:9
>        |
>     14 |     fn new() -> impl PinInit<Self> {
>        |                 ------------------ the found opaque type
>     ...
>     21 |         pin_init!(Self { bar: Bar::new() })
>        |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>        |         |
>        |         expected `Bar`, found opaque type
>        |         arguments to this function are incorrect
>        |
>        =3D note:   expected struct `Bar`
>                found opaque type `impl pin_init::PinInit<Bar>`
>     note: function defined here
>       --> $RUST/core/src/ptr/mod.rs
>        |
>        | pub const unsafe fn write<T>(dst: *mut T, src: T) {
>        |                     ^^^^^
>        =3D note: this error originates in the macro `$crate::__init_inter=
nal` which comes from the expansion of the macro `pin_init` (in Nightly bui=
lds, run with -Z macro-backtrace for more info)
>
> And the new error is:
>
>     error[E0308]: mismatched types
>       --> tests/ui/compile-fail/init/colon_instead_of_arrow.rs:21:31
>        |
>     14 |     fn new() -> impl PinInit<Self> {
>        |                 ------------------ the found opaque type
>     ...
>     21 |         pin_init!(Self { bar: Bar::new() })
>        |                          ---  ^^^^^^^^^^ expected `Bar`, found o=
paque type
>        |                          |
>        |                          arguments to this function are incorrec=
t
>        |
>        =3D note:   expected struct `Bar`
>                found opaque type `impl pin_init::PinInit<Bar>`
>     note: function defined here
>       --> $RUST/core/src/ptr/mod.rs
>        |
>        | pub const unsafe fn write<T>(dst: *mut T, src: T) {
>        |                     ^^^^^
>
> Importantly, this error gives much more accurate span locations,
> pointing to the offending field, rather than the entire macro
> invocation.
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>  rust/pin-init/internal/src/init.rs | 437 +++++++++++++
>  rust/pin-init/internal/src/lib.rs  |  21 +
>  rust/pin-init/src/lib.rs           |  56 +-
>  rust/pin-init/src/macros.rs        | 951 -----------------------------
>  4 files changed, 460 insertions(+), 1005 deletions(-)
>  create mode 100644 rust/pin-init/internal/src/init.rs
>  delete mode 100644 rust/pin-init/src/macros.rs
>
> diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/=
src/init.rs
> new file mode 100644
> index 000000000000..c02a99692980
> --- /dev/null
> +++ b/rust/pin-init/internal/src/init.rs
> @@ -0,0 +1,437 @@
> +use proc_macro2::{Span, TokenStream};
> +use quote::{format_ident, quote, quote_spanned};
> +use syn::{
> +    braced,
> +    parse::{End, Parse},
> +    parse_quote,
> +    punctuated::Punctuated,
> +    spanned::Spanned,
> +    token, Block, Expr, ExprCall, ExprPath, Ident, Path, Token, Type,
> +};
> +
> +pub struct Initializer {
> +    this: Option<This>,
> +    path: Path,
> +    brace_token: token::Brace,
> +    fields: Punctuated<InitializerField, Token![,]>,
> +    rest: Option<(Token![..], Expr)>,
> +    error: Option<(Token![?], Type)>,
> +}
> +
> +struct This {
> +    _and_token: Token![&],
> +    ident: Ident,
> +    _in_token: Token![in],
> +}
> +
> +enum InitializerField {
> +    Value {
> +        ident: Ident,
> +        value: Option<(Token![:], Expr)>,
> +    },
> +    Init {
> +        ident: Ident,
> +        _left_arrow_token: Token![<-],
> +        value: Expr,
> +    },
> +    Code {
> +        _underscore_token: Token![_],
> +        _colon_token: Token![:],
> +        block: Block,
> +    },
> +}
> +
> +impl InitializerField {
> +    fn ident(&self) -> Option<&Ident> {
> +        match self {
> +            Self::Value { ident, .. } | Self::Init { ident, .. } =3D> So=
me(ident),
> +            Self::Code { .. } =3D> None,
> +        }
> +    }
> +}
> +
> +pub(crate) fn expand(
> +    Initializer {
> +        this,
> +        path,
> +        brace_token,
> +        fields,
> +        rest,
> +        mut error,
> +    }: Initializer,
> +    default_error: Option<&'static str>,
> +    pinned: bool,
> +) -> TokenStream {
> +    let mut errors =3D TokenStream::new();

Use Vec<syn::Error> perhaps?

> +    if let Some(default_error) =3D default_error {
> +        error.get_or_insert((Default::default(), syn::parse_str(default_=
error).unwrap()));
> +    }
> +    let error =3D error.map(|(_, err)| err).unwrap_or_else(|| {
> +        errors.extend(quote_spanned!(brace_token.span.close()=3D>
> +            ::core::compile_error!("expected `? <type>` after `}`");
> +        ));
> +        parse_quote!(::core::convert::Infallible)
> +    });

How about

    let error =3D error.map_or_else(|(_, err)| err, || {
        if let Some(default_error) =3D default_error {
            syn::parse_str(default_err).unwrap()
        } else {
            errors.push(Error::new_spanned(brace_token.span.close(),
                "error type must be explicitly specified with `? <type>` af=
ter `}`"
            );
            parse_quote!(::core::convert::Infallible)
        }
    }));

> +    let slot =3D format_ident!("slot");
> +    let (has_data_trait, data_trait, get_data, init_from_closure) =3D if=
 pinned {
> +        (
> +            format_ident!("HasPinData"),
> +            format_ident!("PinData"),
> +            format_ident!("__pin_data"),
> +            format_ident!("pin_init_from_closure"),
> +        )
> +    } else {
> +        (
> +            format_ident!("HasInitData"),
> +            format_ident!("InitData"),
> +            format_ident!("__init_data"),
> +            format_ident!("init_from_closure"),
> +        )
> +    };
> +    let init_kind =3D get_init_kind(rest, &mut errors);
> +    let zeroable_check =3D match init_kind {
> +        InitKind::Normal =3D> quote!(),
> +        InitKind::Zeroing =3D> quote! {
> +            // The user specified `..Zeroable::zeroed()` at the end of t=
he list of fields.
> +            // Therefore we check if the struct implements `Zeroable` an=
d then zero the memory.
> +            // This allows us to also remove the check that all fields a=
re present (since we
> +            // already set the memory to zero and that is a valid bit pa=
ttern).
> +            fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
> +            where T: ::pin_init::Zeroable
> +            {}
> +            // Ensure that the struct is indeed `Zeroable`.
> +            assert_zeroable(#slot);
> +            // SAFETY: The type implements `Zeroable` by the check above=
.
> +            unsafe { ::core::ptr::write_bytes(#slot, 0, 1) };

Can this be `#slot.write(::pin_init::zeroed())`?

> +        },
> +    };
> +    let this =3D match this {
> +        None =3D> quote!(),
> +        Some(This { ident, .. }) =3D> quote! {
> +            // Create the `this` so it can be referenced by the user ins=
ide of the
> +            // expressions creating the individual fields.
> +            let #ident =3D unsafe { ::core::ptr::NonNull::new_unchecked(=
slot) };
> +        },
> +    };
> +    // `mixed_site` ensures that the data is not accessible to the user-=
controlled code.
> +    let data =3D format_ident!("__data", span =3D Span::mixed_site());

Looks like this can just be using `Ident` constructor.

> +    let init_fields =3D init_fields(&fields, pinned, &data, &slot);
> +    let field_check =3D make_field_check(&fields, init_kind, &path);
> +    quote! {{
> +        // We do not want to allow arbitrary returns, so we declare this=
 type as the `Ok` return
> +        // type and shadow it later when we insert the arbitrary user co=
de. That way there will be
> +        // no possibility of returning without `unsafe`.
> +        struct __InitOk;
> +
> +        // Get the data about fields from the supplied type.
> +        // SAFETY: TODO
> +        let #data =3D unsafe {
> +            use ::pin_init::__internal::#has_data_trait;
> +            // Can't use `<#path as #has_data_trait>::#get_data`, since =
the user is able to omit
> +            // generics (which need to be present with that syntax).
> +            #path::#get_data()
> +        };
> +        // Ensure that `#data` really is of type `#data` and help with t=
ype inference:
> +        let init =3D ::pin_init::__internal::#data_trait::make_closure::=
<_, __InitOk, #error>(
> +            #data,
> +            move |slot| {
> +                {
> +                    // Shadow the structure so it cannot be used to retu=
rn early.
> +                    struct __InitOk;
> +                    #zeroable_check
> +                    #this
> +                    #init_fields
> +                    #field_check
> +                }
> +                Ok(__InitOk)
> +            }
> +        );
> +        let init =3D move |slot| -> ::core::result::Result<(), #error> {
> +            init(slot).map(|__InitOk| ())
> +        };
> +        // SAFETY: TODO
> +        let init =3D unsafe { ::pin_init::#init_from_closure::<_, #error=
>(init) };
> +        init
> +    }}
> +}
> +
> +enum InitKind {
> +    Normal,
> +    Zeroing,
> +}
> +
> +fn get_init_kind(rest: Option<(Token![..], Expr)>, errors: &mut TokenStr=
eam) -> InitKind {
> +    let Some((dotdot, expr)) =3D rest else {
> +        return InitKind::Normal;
> +    };
> +    match &expr {
> +        Expr::Call(ExprCall { func, args, .. }) if args.is_empty() =3D> =
match &**func {
> +            Expr::Path(ExprPath {
> +                attrs,
> +                qself: None,
> +                path:
> +                    Path {
> +                        leading_colon: None,
> +                        segments,
> +                    },
> +            }) if attrs.is_empty()
> +                && segments.len() =3D=3D 2
> +                && segments[0].ident =3D=3D "Zeroable"
> +                && segments[0].arguments.is_none()
> +                && segments[1].ident =3D=3D "init_zeroed"
> +                && segments[1].arguments.is_none() =3D>
> +            {
> +                return InitKind::Zeroing;
> +            }
> +            _ =3D> {}
> +        },
> +        _ =3D> {}
> +    }
> +    let span =3D quote!(#dotdot #expr).span();
> +    errors.extend(quote_spanned!(span=3D>
> +        ::core::compile_error!("expected nothing or `..Zeroable::init_ze=
roed()`.");
> +    ));
> +    InitKind::Normal
> +}
> +
> +/// Generate the code that initializes the fields of the struct using th=
e initializers in `field`.
> +fn init_fields(
> +    fields: &Punctuated<InitializerField, Token![,]>,
> +    pinned: bool,
> +    data: &Ident,
> +    slot: &Ident,
> +) -> TokenStream {
> +    let mut guards =3D vec![];
> +    let mut res =3D TokenStream::new();
> +    for field in fields {
> +        let init =3D match field {
> +            InitializerField::Value { ident, value } =3D> {
> +                let mut value_ident =3D ident.clone();
> +                let value_prep =3D value.as_ref().map(|value| &value.1).=
map(|value| {
> +                    // Setting the span of `value_ident` to `value`'s sp=
an improves error messages
> +                    // when the type of `value` is wrong.
> +                    value_ident.set_span(value.span());
> +                    quote!(let #value_ident =3D #value;)
> +                });
> +                // Again span for better diagnostics
> +                let write =3D quote_spanned!(ident.span()=3D> ::core::pt=
r::write);
> +                let accessor =3D if pinned {
> +                    let project_ident =3D format_ident!("__project_{iden=
t}");
> +                    quote! {
> +                        // SAFETY: TODO
> +                        unsafe { #data.#project_ident(&mut (*#slot).#ide=
nt) }
> +                    }
> +                } else {
> +                    quote! {
> +                        // SAFETY: TODO
> +                        unsafe { &mut (*#slot).#ident }
> +                    }
> +                };
> +                quote! {
> +                    {
> +                        #value_prep
> +                        // SAFETY: TODO
> +                        unsafe { #write(::core::ptr::addr_of_mut!((*#slo=
t).#ident), #value_ident) };

This should be `&raw mut` now?

> +                    }
> +                    #[allow(unused_variables)]
> +                    let #ident =3D #accessor;
> +                }
> +            }
> +            InitializerField::Init { ident, value, .. } =3D> {
> +                // Again span for better diagnostics
> +                let init =3D format_ident!("init", span =3D value.span()=
);
> +                if pinned {
> +                    let project_ident =3D format_ident!("__project_{iden=
t}");
> +                    quote! {
> +                        {
> +                            let #init =3D #value;
> +                            // SAFETY:
> +                            // - `slot` is valid, because we are inside =
of an initializer closure, we
> +                            //   return when an error/panic occurs.
> +                            // - We also use `#data` to require the corr=
ect trait (`Init` or `PinInit`)
> +                            //   for `#ident`.
> +                            unsafe { #data.#ident(::core::ptr::addr_of_m=
ut!((*#slot).#ident), #init)? };
> +                        }
> +                        // SAFETY: TODO
> +                        #[allow(unused_variables)]
> +                        let #ident =3D unsafe { #data.#project_ident(&mu=
t (*#slot).#ident) };
> +                    }
> +                } else {
> +                    quote! {
> +                        {
> +                            let #init =3D #value;
> +                            // SAFETY: `slot` is valid, because we are i=
nside of an initializer
> +                            // closure, we return when an error/panic oc=
curs.
> +                            unsafe {
> +                                ::pin_init::Init::__init(
> +                                    #init,
> +                                    ::core::ptr::addr_of_mut!((*#slot).#=
ident),
> +                                )?
> +                            };
> +                        }
> +                        // SAFETY: TODO
> +                        #[allow(unused_variables)]
> +                        let #ident =3D unsafe { &mut (*#slot).#ident };
> +                    }
> +                }
> +            }
> +            InitializerField::Code { block: value, .. } =3D> quote!(#[al=
low(unused_braces)] #value),
> +        };
> +        res.extend(init);
> +        if let Some(ident) =3D field.ident() {
> +            // `mixed_site` ensures that the guard is not accessible to =
the user-controlled code.
> +            let guard =3D format_ident!("__{ident}_guard", span =3D Span=
::mixed_site());
> +            guards.push(guard.clone());
> +            res.extend(quote! {
> +                // Create the drop guard:
> +                //
> +                // We rely on macro hygiene to make it impossible for us=
ers to access this local
> +                // variable.
> +                // SAFETY: We forget the guard later when initialization=
 has succeeded.
> +                let #guard =3D unsafe {
> +                    ::pin_init::__internal::DropGuard::new(
> +                        ::core::ptr::addr_of_mut!((*slot).#ident)
> +                    )
> +                };
> +            });
> +        }
> +    }
> +    quote! {
> +        #res
> +        // If execution reaches this point, all fields have been initial=
ized. Therefore we can now
> +        // dismiss the guards by forgetting them.
> +        #(::core::mem::forget(#guards);)*
> +    }
> +}
> +
> +/// Generate the check for ensuring that every field has been initialize=
d.
> +fn make_field_check(
> +    fields: &Punctuated<InitializerField, Token![,]>,
> +    init_kind: InitKind,
> +    path: &Path,
> +) -> TokenStream {
> +    let fields =3D fields.iter().filter_map(|f| f.ident());
> +    match init_kind {
> +        InitKind::Normal =3D> quote! {
> +            // We use unreachable code to ensure that all fields have be=
en mentioned exactly once,
> +            // this struct initializer will still be type-checked and co=
mplain with a very natural
> +            // error message if a field is forgotten/mentioned more than=
 once.
> +            #[allow(unreachable_code, clippy::diverging_sub_expression)]
> +            // SAFETY: this code is never executed.
> +            let _ =3D || unsafe {
> +                ::core::ptr::write(slot, #path {
> +                    #(
> +                        #fields: ::core::panic!(),
> +                    )*
> +                })
> +            };
> +        },
> +        InitKind::Zeroing =3D> quote! {
> +            // We use unreachable code to ensure that all fields have be=
en mentioned at most once.
> +            // Since the user specified `..Zeroable::zeroed()` at the en=
d, all missing fields will
> +            // be zeroed. This struct initializer will still be type-che=
cked and complain with a
> +            // very natural error message if a field is mentioned more t=
han once, or doesn't exist.
> +            #[allow(unreachable_code, clippy::diverging_sub_expression, =
unused_assignments)]
> +            // SAFETY: this code is never executed.
> +            let _ =3D || unsafe {
> +                let mut zeroed =3D ::core::mem::zeroed();
> +                ::core::ptr::write(slot, zeroed);

Looks like the comment explaining why this is done gets missed.

> +                zeroed =3D ::core::mem::zeroed();
> +                ::core::ptr::write(slot, #path {
> +                    #(
> +                        #fields: ::core::panic!(),
> +                    )*
> +                    ..zeroed

Would just ::core::mem::zeroed() here work or does it have same inference i=
ssue?
IIUC the type inference should work here as ..Default::default() works.

Best,
Gary

> +                })
> +            };
> +        },
> +    }
> +}
> +
> +impl Parse for Initializer {
> +    fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
> +        let this =3D input.peek(Token![&]).then(|| input.parse()).transp=
ose()?;
> +        let path =3D input.parse()?;
> +        let content;
> +        let brace_token =3D braced!(content in input);
> +        let mut fields =3D Punctuated::new();
> +        loop {
> +            let lh =3D content.lookahead1();
> +            if lh.peek(End) || lh.peek(Token![..]) {
> +                break;
> +            } else if lh.peek(Ident) || lh.peek(Token![_]) {
> +                fields.push_value(content.parse()?);
> +                let lh =3D content.lookahead1();
> +                if lh.peek(End) {
> +                    break;
> +                } else if lh.peek(Token![,]) {
> +                    fields.push_punct(content.parse()?);
> +                } else {
> +                    return Err(lh.error());
> +                }
> +            } else {
> +                return Err(lh.error());
> +            }
> +        }
> +        let rest =3D content
> +            .peek(Token![..])
> +            .then(|| Ok::<_, syn::Error>((content.parse()?, content.pars=
e()?)))
> +            .transpose()?;
> +        let error =3D input
> +            .peek(Token![?])
> +            .then(|| Ok::<_, syn::Error>((input.parse()?, input.parse()?=
)))
> +            .transpose()?;
> +        Ok(Self {
> +            this,
> +            path,
> +            brace_token,
> +            fields,
> +            rest,
> +            error,
> +        })
> +    }
> +}
> +
> +impl Parse for This {
> +    fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
> +        Ok(Self {
> +            _and_token: input.parse()?,
> +            ident: input.parse()?,
> +            _in_token: input.parse()?,
> +        })
> +    }
> +}
> +
> +impl Parse for InitializerField {
> +    fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
> +        let lh =3D input.lookahead1();
> +        if lh.peek(Token![_]) {
> +            Ok(Self::Code {
> +                _underscore_token: input.parse()?,
> +                _colon_token: input.parse()?,
> +                block: input.parse()?,

> +            })
> +        } else if lh.peek(Ident) {
> +            let ident =3D input.parse()?;
> +            let lh =3D input.lookahead1();
> +            if lh.peek(Token![<-]) {
> +                Ok(Self::Init {
> +                    ident,
> +                    _left_arrow_token: input.parse()?,
> +                    value: input.parse()?,
> +                })
> +            } else if lh.peek(Token![:]) {
> +                Ok(Self::Value {
> +                    ident,
> +                    value: Some((input.parse()?, input.parse()?)),
> +                })
> +            } else if lh.peek(Token![,]) || lh.peek(End) {
> +                Ok(Self::Value { ident, value: None })
> +            } else {
> +                Err(lh.error())
> +            }
> +        } else {
> +            Err(lh.error())
> +        }
> +    }
> +}
