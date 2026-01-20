Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021135.outbound.protection.outlook.com [52.101.100.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5766221ABBB
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 13:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917287; cv=fail; b=TJSHVcauACiDJ4HkfKdRnTtjA9Yl6gymraLp/bS5XcRCUF5aEypKT8YqtIWtarSb3yVlqrSjaKTNyxPMiyVBTRWZcZvsw5rDJg/IZrlYgAJf+CgsDOARlAWq/FuMx3ChwriqaZSCclZja6l44deBayRJUCUifZljSnhKuuPSPH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917287; c=relaxed/simple;
	bh=QVlUJmWz6SENB951VxbsvYCdo1GuKqOlpCLz6EEt/Tw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=H9yhhDhjIEGPaipuXq154jjSdRAYCvaNbYmLiIrtbAfe9l+k1tN+sWbkNXb+efolu+NafpTa6IrMOrO08YNwuBvqndVDGaol+FkAGbgM4S5pdZil5elm3/pMX/+s+JK9U16z7HJTKSkaHqa0Lwka5A7OZNsuf1DWti42QGsMyY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=gIpc9zNv; arc=fail smtp.client-ip=52.101.100.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="gIpc9zNv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G972lujuqgGO0WuxFl489Kl411qcU30Hjea5jSerlUL1JEvSJ/J6R+L28Kg0eqpLq1SdWUzurgNn8PAe8o02QT0wlTa4X71NPOWmxCnl/nJRPkDJ9i3KPst2zEHWWLODzfDJEOEgX1cip/qB4tm1Fn7eUbUOEy90L2uLOHVemA3buoyHh2SNH+h8JrWILOAmRNymPYQNK9UEgVRvwCFQenbyyLe/WFJjk2cqoXmnQZPS7iCbcAkcamXqyBhqgxvtO0B9hbVkpbEoLlw98Hrb8V395B4YQDuZh2VRMbibFNEqeshvueXQW8dzOiU/lE0RlDKT4Kb4s0Rm1FQskyK2cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lA7gT4egMnxAQ8J+LBkei2k3AjalcJOJ2ADuDXpcB0=;
 b=I2jRIrnw6UceyCZpb9c1S88hjgEysqupAo8j5s5Jdsb37gUT2+o7jTpjfzSWB38ribSberlSXOJCpVZsBLs2HZVjZEgz+1RQI52aGvLCMa5O8PTW+ZNBW8ZyTLbMQYfmOw3pNuoXg/EtPz7i6F3Phz+LXTpspHhmRQtINgUlDoqUpmheQEbl/Kl0mC6z9yYB66gME2swgSje64509fTbENK5fnvJHT3IKUii73njy/Zc/ujN27eoElrYVL6STgz6JscTWJfFHzBaKnXqthzj7zEWOKBvLs2hgyQow2kYUO4NL/9W7/HjNsAgo3qTjtT/jEHnuozrIkfsvLPB0kROcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lA7gT4egMnxAQ8J+LBkei2k3AjalcJOJ2ADuDXpcB0=;
 b=gIpc9zNvGuXw50JATd3IVIY2SrseQRSgnKidY217aVehH5bvk27mFhl4UrjTicfbm60PtkMwLCnGxqXo06+fbS0X75T/8z3sxrHFXF/fxvsab5XEAAKVTkIpeJU+pSeTqg5HPvH2JtYkj1PFTRV6ofYYFUlb0ThtEWCozXlaknM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3127.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:b2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 13:54:41 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.012; Tue, 20 Jan 2026
 13:54:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 13:54:38 +0000
Message-Id: <DFTGUBC2K4G8.3HSMNEUI24RGX@garyguo.net>
Cc: <ojeda@kernel.org>, <a.hindborg@kernel.org>, <bjorn3_gh@protonmail.com>,
 <dakr@kernel.org>, <gary@garyguo.net>, <lossin@kernel.org>,
 <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v1] rust: list: Use AtomicFlag in AtomicTracker
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>, <aliceryhl@google.com>,
 <boqun.feng@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260119231757.3460885-1-fujita.tomonori@gmail.com>
In-Reply-To: <20260119231757.3460885-1-fujita.tomonori@gmail.com>
X-ClientProxiedBy: LO0P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3127:EE_
X-MS-Office365-Filtering-Correlation-Id: cda3be0a-fc93-4d7e-435c-08de582b7449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2d3RENqU252VU5DM2lpVUdGcFlyTTJkeDRqZHZYcE1uQSszQktIMGJBOExH?=
 =?utf-8?B?dEZsUDVjblpCYjRNaDlrUEFvNk5mS2JsMEpuMExSc1lPNjUzTUl4T25NWjIz?=
 =?utf-8?B?Ync3TXQ0a1htWGl4OFg4cVZzTkRCUnMybHI2akR3bzA1anNBZUtreDZkeWZ5?=
 =?utf-8?B?UUxQTTFIYVk3TXVhZGxZd0QyTU5aMGc3OVB0Umo1ZDh4OWRVakZQWjNzSmlY?=
 =?utf-8?B?bnVoMXRSano0NG5WWnVZZ0ZMZGNnZEg0UE9ZUFBybm1RUUhLR0tnY1l2Vklp?=
 =?utf-8?B?UnFMYThhOGxzSm4xSjd1UHREQzM0ZXJFWG1OOXVObk1ZSWtJdEYrWXJhZSsy?=
 =?utf-8?B?L2VqdXo5blh3S2FVT0NSUmM0Sm1yUlVEOXlHNmExa3MxY1cyMm96MVhZUzRE?=
 =?utf-8?B?dE8zR2Q4OHZmSUxmOFFEK3MyM0QwejZpcENxeVBZSlVWTkVWY3hTZ2luS3Nj?=
 =?utf-8?B?RCtyeG5VbFlnTWRVMFkzRU1QVXhaYWl2dDhyRXRYYTdQMEluVDZFZzBiMFZF?=
 =?utf-8?B?WkFHbjBEa1dRREVLRVI5VWFzVURZK1ZzWFF1Q2Q5YUtVRjNxbXROcFM4NFFk?=
 =?utf-8?B?UFFMRE04Slh0NEtBSEhneTJEbzY5cUxJNjBXbzRoWEYrbENGeGF2VWN1ZDdZ?=
 =?utf-8?B?QnBobXUzci9yYXNFdnAwQU11MlVyQ1JMV0xrc3JsQTZGR2tYK2JxSlBnNGlQ?=
 =?utf-8?B?Y1RnQ1hKSFMvQnRJVXRHekwwemMxMjBaVzArSHV6bCtaUC9QSEtwdnBPQ2FE?=
 =?utf-8?B?MFVuMmpBU1g2czllMW02UWxWS3d0eTdqUXM1dGJPNzJqQUJlWXJzVHd3MmRE?=
 =?utf-8?B?ZEhTckUwL0RGbXp2dmpXRGs4VmxWQ0l0a0MzdFVVdkllNXRyZllxNmR4a2wv?=
 =?utf-8?B?cVRSRWVIOEtPeEJqblYxdUxpZ01DT2lBbGZKUVQyaTR6RjV6VUkyTTJFam5n?=
 =?utf-8?B?M0tiRjZOc3VMMytwRmlKbC85RDA0L0pXc0FtRlJ3TitUMmphbVVRWHpzTW45?=
 =?utf-8?B?QXFHeGdHWDJFUU0zUHd2b0dqUVJDMERJSktLVkVhbmpXRXl0QjFSTFNESEc4?=
 =?utf-8?B?YnBwSlN3RU96cS8xVnZxdWI3T3NQTS9pOGQ4TlVRUjhFRXVySGtHazFta21X?=
 =?utf-8?B?RThabStreW9XM0wyNVQzY053K1Y3aVRvWnZaOG1ITEpTMG40aHREN2RES2N2?=
 =?utf-8?B?NXRKSjBMbWdKbExyTGQ4MHBIWVVXMmxLdTZCZEZ6QS9RRXBhWjZ6T3pmMHRz?=
 =?utf-8?B?d1YvbFpxb3B4dGRxdGc5ZlRjekxNVFA4RFh0OElZM2hkd0VYK0FJbGxqd1R0?=
 =?utf-8?B?cFVGODJqWko2cUxxT1JhVThkMzJzNHNrcWF4TmpLR0F3ZHBxUlBudXNyM0dS?=
 =?utf-8?B?d1pHbWhua2l6TGc2aVZWS1F3cC9lWHVYaUVpeFY3RUltZk9pbmFVYTNMRExR?=
 =?utf-8?B?dlhQRFJCZ1E2bGxqSm9BZFhFRk1BNGtpb3dOYms4WUhCR2JiMWphTHZWU1hB?=
 =?utf-8?B?U3BvSy9oV0lnR3FuYlVOLzBJVU1QZ01NTFlBVWNzK21VUUpWWkRwc2wyVFVE?=
 =?utf-8?B?eUh1enpQMlBuT2pURUwrcU5kdHFwTElzWnpZTEVSRkllTHZ6K3dvY3VzMXFq?=
 =?utf-8?B?bHVqck52UnlGRzNGcjMvN1BTZGR2Z0Z6Qi94Z2x5a1AwUFFBT1JhMWJCWHRL?=
 =?utf-8?B?ZTZxekxVZ2ViY2g2U2U2bFVoUGp6bGNFR0I3dnFFMFh3NlJGbHpxRzJHRUpt?=
 =?utf-8?B?RUc0MS80VjBPdHpvY01SbG5QNkNKWE51NG9XVDJzS2pxMWdzTEV2OVdHbHZD?=
 =?utf-8?B?aS9UakNHYVJZRVZxZHFiZVBLNjdZVjF6ZlJDK1hnVHVleFlkWWI5MUFyTEls?=
 =?utf-8?B?dk9FYzA1TzI3bnc2NEF1cWVsZmlXb1FRT0lxZlZ6WGkvZy9TOGZneFl4RXpN?=
 =?utf-8?B?bGg2K0JRaU1ITXNTWDNYM1hLSGo0TnFsYi9nTE1VWGs4akVpM2hTcTJZYmV4?=
 =?utf-8?B?L2hnUzFCWXd0dHkydG8yRW9ycmk4T1lCMElzbStwYms0NFFkK3JEZjdwdzVq?=
 =?utf-8?B?TlI2dmtFM2VRVDgzTittM2lSWTdsUDc3ZVhCZUYzNFExS0FKK2ViN2J2WW8x?=
 =?utf-8?Q?sM3U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUFERVpyVXhFTTUwUEJBOTZhN21yYlVjWWlnZmJ1ZVBOU245VFFNK0tRRnB3?=
 =?utf-8?B?ZDZYTm5OditQSHpnSlFud3NUcGx0Vmt5TkhlZFpJL1JFZE9HRVhjL0lpeS9T?=
 =?utf-8?B?dksyNmlHN3d0SGZFWUZTcnhPZ1FPZ0pSRGxJUTNSVG8xZDhaaVpQWXBESUNF?=
 =?utf-8?B?SW9tRXdyVDVLNU56azFVSDdQT255ZWhydUtLdXlJQVJUam5KS0ZRY3Uzd1pX?=
 =?utf-8?B?T0N1OVY2amhzQkVnbW5PdmJhWVJFUGNuY1NBay9oaFkxVitXYzlkZHNOYVR3?=
 =?utf-8?B?N0hzV25yUTJlV1Rmc0tSOFBkYXBSMHlEV0t4YUpDMHE0UWpqL2FnNVN5U1Fk?=
 =?utf-8?B?dDk1eVZ3S0taZ2M0eU5SUFQ3MGZBbW4wVGJIRllCbFVOWGNNR2tDa3M5V2ov?=
 =?utf-8?B?N2tuaENtTzR1dTVIbzFnU1dMTnI3MXVDWWZsTGd4dTNITkYwSG5NUi9MZmQ2?=
 =?utf-8?B?enpYeGY5TmtySTJiU3JyZkJwRFc5ZEJGeE5xK1Q3L05pTEkxd0VMbDlSZHNu?=
 =?utf-8?B?WWZXL1dNSWJiUXgzTzhWcUZxamY1QzluU09EZlFMckg1dlgrVisrOVZiWHNo?=
 =?utf-8?B?R2g5UnNvRzVtNC9VZTFuV0drcFllZXNjckgyNElQS2xESWQ2MUdrZFpaWVl4?=
 =?utf-8?B?clV3YVU1NXcwcDhpckFJOVdwbHdhUFRjS3hmbHVYTFhkZEJKTi9PSytBM3Rs?=
 =?utf-8?B?VmUxV3BDUThoNlA2cWNEMUJkS0t3SzdLRlpIUE9aMCtaaXR3SWhYRlJIcDZy?=
 =?utf-8?B?RUV0QWQrdkcwaS9FT0p2YUFVMzZSZmVxejhsMHFQTWZsT1I4Ymx2NHFkdU1o?=
 =?utf-8?B?T0xueDZRQXE5UGtwWEFBcHpNZXJ0cnVUSXhtOFRKN2lWc0RyNDRLV29vWGNp?=
 =?utf-8?B?eU9BT3ZWSTI3TkJFZ1RpNWVnNHNFc3g0eWZKTElFYzhOZkFCUHhKajdYUVV5?=
 =?utf-8?B?T1dlM1lHTXFXL3YrRzhwWjlqbXhXMUZvSG44ektnSWZHWkFHUVdWMXpaS2E4?=
 =?utf-8?B?cjFMV2VhZ1BqR0h5Ynl1RmwyZmtnV2FPRjd1dHdoeTRTNnF3dVNJaUxuYng4?=
 =?utf-8?B?SEIrTWJiQVFMUEc5UGtrU0hHYnJUK1J1OXlPRkhMc0k2RkEybGVZN0dXTHg2?=
 =?utf-8?B?YWwwaDZrMlRaU2trdS8zdXJFSUpnNVpaRytkR25xOTIyOVQ0dXZMUkdjelpn?=
 =?utf-8?B?TUxvdUkzc3hxM1A0S3NQcmNwTVRTcVRhSzkrS0I1OS91V01vQ1NQN1RMMGlM?=
 =?utf-8?B?b0dHVUs2NzA1bm5NU3JoK3RvOHVMT0tESWNhK0lmNldGWFMxOXNBeUVicEIv?=
 =?utf-8?B?eTMyTnZRT0oyVjltNk5tckltNnNPNmtUZTU4eVlsdWtnVjA4S2dmMlhscE5z?=
 =?utf-8?B?eFpoanVFWmc1SlcxRHFYajc5ZmdhMUplS3Jna3RPb1JwTTh2bzJGOHk3TGtU?=
 =?utf-8?B?MXc4MEpFaHRobnBCOFl3RGJYNWZPWkFpSmk4QkYzbnpjb1ozN3BUYnBjQWhN?=
 =?utf-8?B?ak0xUy9ZWVhrUnVHdlJtdUUrbndoelZjempnS2kzNHdnKzZPTEx6bXJ2b2Z4?=
 =?utf-8?B?RHA2M1E5NmF5STlyQTU1QmpBNC95cG9TZGRSeVpxT2VQM21JWCtYZ0U3VXVQ?=
 =?utf-8?B?MjJuSlJhek5Vd0VQVGZWZ3ZTbEUrQkdlM2pkYmZYakVGSjVJZDRnVzNmdkhx?=
 =?utf-8?B?NE1qdGZuY0Y4Y2dFV3AvSGZueThJTWVYdHROZ0lOeTVzRHlTVkR5Y1dicTFQ?=
 =?utf-8?B?YzVLOVl3RzNwSDI0RHlLT0ZUY1RyQ3l0N21ZZkFFazV1Y1QwSGFyWUtuQk1T?=
 =?utf-8?B?YjV0N3VGOGFGaVBZaS9sWjFMeVlYcmZxd1FoVktwNUFDMnJLZG1UNUNnWHdZ?=
 =?utf-8?B?bkpQeDBKN2JQNFVhbGdWa0dOTGNNbjA2bGNIL3U5ZXBPKzlaTXNzbEVtcGY0?=
 =?utf-8?B?R0pkWEVIb1p6ZE1XVHZBRnFUK2trR2k2NkhoUXArT1VIdFp5U2xtMTVJRG9a?=
 =?utf-8?B?SWJkQllRS3Ftd252Uk1DRmJGRFo4SlFOZDFJRi80T3prOGhmZjlFaGthcENQ?=
 =?utf-8?B?SmZSaUlvSUlsZXJPbkxzdEhxSmVNN0gxd3ZuT0IvS2JyWnRQalVzODA4L2hZ?=
 =?utf-8?B?ZEd0eUV3SzkzUVo0T1lONmE0cWFJdUx3RDU2Z1psa1B4ZFMzRDJJQU4wMURG?=
 =?utf-8?B?Vkp6ZkpFMXBGdHBDMFY0MXROTzJxZDVoTDE1eXkxZU10Sm5obi85MGJCTmJE?=
 =?utf-8?B?cStsWDFRajkwTHk4SVlGYkxKMUtNZktGbCs2WS95MmVhTUtmTjZ4SmhvOVV5?=
 =?utf-8?B?WnhKT3BvS2ZxdFMwL3FIbk96ZTFsU1RjNU5BY2YrMUY1OG00NVk4QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cda3be0a-fc93-4d7e-435c-08de582b7449
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 13:54:39.1720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ayrDuCCvnc7nn5CfbgEfP9fncOVLa5orR8WVhRuyIbE1Ai9JE/MVsBzf5C7rpJnZnOWHaY3HV8+2MHtExdjYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3127

On Mon Jan 19, 2026 at 11:17 PM GMT, FUJITA Tomonori wrote:
> Make AtomicTracker use AtomicFlag instead of Atomic<bool> to avoid
> slow byte-sized RMWs on architectures that don't support them.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/list/arc.rs | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
> index 2282f33913ee..3296726e07d9 100644
> --- a/rust/kernel/list/arc.rs
> +++ b/rust/kernel/list/arc.rs
> @@ -6,7 +6,7 @@
> =20
>  use crate::alloc::{AllocError, Flags};
>  use crate::prelude::*;
> -use crate::sync::atomic::{ordering, Atomic};
> +use crate::sync::atomic::{ordering, AtomicFlag};
>  use crate::sync::{Arc, ArcBorrow, UniqueArc};
>  use core::marker::PhantomPinned;
>  use core::ops::Deref;
> @@ -469,7 +469,7 @@ impl<T, U, const ID: u64> core::ops::DispatchFromDyn<=
ListArc<U, ID>> for ListArc
>  /// If the boolean is `false`, then there is no [`ListArc`] for this val=
ue.
>  #[repr(transparent)]
>  pub struct AtomicTracker<const ID: u64 =3D 0> {
> -    inner: Atomic<bool>,
> +    inner: AtomicFlag,
>      // This value needs to be pinned to justify the INVARIANT: comment i=
n `AtomicTracker::new`.
>      _pin: PhantomPinned,
>  }
> @@ -480,12 +480,12 @@ pub fn new() -> impl PinInit<Self> {
>          // INVARIANT: Pin-init initializers can't be used on an existing=
 `Arc`, so this value will
>          // not be constructed in an `Arc` that already has a `ListArc`.
>          Self {
> -            inner: Atomic::new(false),
> +            inner: AtomicFlag::new(false),
>              _pin: PhantomPinned,
>          }
>      }
> =20
> -    fn project_inner(self: Pin<&mut Self>) -> &mut Atomic<bool> {
> +    fn project_inner(self: Pin<&mut Self>) -> &mut AtomicFlag {
>          // SAFETY: The `inner` field is not structurally pinned, so we m=
ay obtain a mutable
>          // reference to it even if we only have a pinned reference to `s=
elf`.
>          unsafe { &mut Pin::into_inner_unchecked(self).inner }
> @@ -495,7 +495,7 @@ fn project_inner(self: Pin<&mut Self>) -> &mut Atomic=
<bool> {
>  impl<const ID: u64> ListArcSafe<ID> for AtomicTracker<ID> {
>      unsafe fn on_create_list_arc_from_unique(self: Pin<&mut Self>) {
>          // INVARIANT: We just created a ListArc, so the boolean should b=
e true.
> -        *self.project_inner().get_mut() =3D true;
> +        self.project_inner().store(true, ordering::Relaxed);

I would if we can still provide `get_mut()`. You can just hand out a refere=
nce
to the LSB of the flag (of course, this is a different byte depending on
endianness..).

Best,
Gary

>      }
> =20
>      unsafe fn on_drop_list_arc(&self) {
>
> base-commit: 47f079b9ac97c4b0c673bbbf57245952e9edf8a2

