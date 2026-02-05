Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021086.outbound.protection.outlook.com [52.101.100.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A28722DA1C;
	Thu,  5 Feb 2026 23:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770333831; cv=fail; b=dMtU/TAeU1kqf4CR4+n/79RQoh3qspdB2vbc6IJhY1n9CqB1zGQTA1DgaFUr+Qbx9+BO17W2WO3HLF9G4Z6iFPcJ5dWnSIYaTUQ9EhhAWtkjwgpA0ID8+QGrrlRu5cRxI4xu2GTWRMOgCW9KzwRCB23pyBWGERN4Us/l5vqAleI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770333831; c=relaxed/simple;
	bh=L9d55TwywT9cBJ5e7O2yKrXYbULOS0hWdjC6hQ6/o8s=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hO4EOPT2Q+e5VHftQZ2qHhOjvZqjumM4dlj1KJZLFn+fapTWDe5m6xaESMP6nK//dBIvLmR2lxyjBzZWam1Ke6nKvfe/oO548hsLvwLOEloUvxvKVtft1jzbHgdDtNqFXY0pLYnfPCMibRJ2JXsd6uy3FlEX+PqDez/pR4DVACk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jA+ivKSn; arc=fail smtp.client-ip=52.101.100.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jA+ivKSn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYxhXUBYDFicOSOOyh9yPWhiDSsnjUIKfIxRrNtwj1GG+Spi7+Lf8IW9a/I075rI6vbGDrPsDZjf2Ul9aUJaVQsMErscEQ3c74NuxaN2+8l7Aj7czn4Gzfh3crKhPD2k9bhoUxi8qi3TzL61M4AeG9yOCxVlHipmGMZ8hRLh+udmQCVTolIJyyzZ08WkeEOLkbBMJR//DtatH0tW9cfbaLsXmVcifhrjnn+YCfFJR0J2ZI8aV4ordpJpmteWhJoijASBT3OyX+l0r95rUjTiKoAvJRKAi+c49EO7TjbivdC7+UtZhGJVYonwUsM67Y9NwbUDEeHhndrQeyKecAh+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mvlslt6QAp54raZQcPK/nG91NG9SHPNO7xtYuE4Q5No=;
 b=S0EqGnuvnlncSy3HNALDhvuKN0KOa9wCvPdF4smg50qMDaGtZjVQljHf+PgL8+1hkfr+8C9DRroqK5TykXXWTh7Cj5RsQyVRgrU22UredtEtiEwtpBYq1lI2pROuylV4vs0XXLBE/Y6KGOWTHOptZrTlaCnLc86GIe7P44ekKkQUMcbCFfNvjQfuEzqvHK8bqRTE515cJ481xWpRpfZUEzBsNLOKPQeGpzaSc4vTp7Nut1/NniXmNIAzCEJpusyToMwmJIkIctTTZShvn0opYr++bCfT4dU78LthOAMrPSM1Km5PEenUj13iunnTVu9sDUdVqzFkX5aF64M4tIQC5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mvlslt6QAp54raZQcPK/nG91NG9SHPNO7xtYuE4Q5No=;
 b=jA+ivKSnoFXQ1GdkeNxYakfXK9AEZAGahZiy4YBYzUt89dnGSElJ9W1yPmUdNzqup23Fqx4Hs3LQTkkuVy4Ug9UgKMVTD4zFPWyesP5eA96bL6a/ywJz6ZfRZfA9r+Zg8+beo+MqTvur7fthE1bRNcnLMxCavicsc3T6lCW49F8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB1926.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:7d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Thu, 5 Feb
 2026 23:23:48 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 23:23:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 23:23:47 +0000
Message-Id: <DG7EYT29W3CY.2WMEH783JP7RI@garyguo.net>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Waiman Long" <longman@redhat.com>
Subject: Re: [PATCH v18 5/5] rust: sync: Introduce SpinLockIrq::lock_with()
 and friends
From: "Gary Guo" <gary@garyguo.net>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>
X-Mailer: aerc 0.21.0
References: <20260205204709.528234-1-lyude@redhat.com>
 <20260205204709.528234-6-lyude@redhat.com>
In-Reply-To: <20260205204709.528234-6-lyude@redhat.com>
X-ClientProxiedBy: LNXP123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::33) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB1926:EE_
X-MS-Office365-Filtering-Correlation-Id: e35d4eec-7f1c-4014-0df8-08de650d9d63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkJUT3RRRWNzczJLMXkzeWVlMUo2dUF1SUxuenFzam5KUDZXbWR1eXR1UGxU?=
 =?utf-8?B?ZGIyeXVPNTlrMXV1Z2tybGEzMks1YVFiODR2SWZJWWE4UDhWR2RudGh5b3dD?=
 =?utf-8?B?SmwxUXdjZFVSSTgyemJoMmViQjArRkZLbmlOWHYwT1Z6VXZ4WkxJVFNkSDdQ?=
 =?utf-8?B?RUNJUDdqU1MrZGJJTFh4S0ZPL1J4TEpaNnZYSnd6SmdYY2k4UkZ2RFhwRXZi?=
 =?utf-8?B?dTBaNmVhRHprUDJFUlJYR2o5RTJrNWVsYjdDMWRxek96c2tzNVZwVWlFS2tS?=
 =?utf-8?B?ckZlTVE3cWFRT1g0c2VhUVozaVVvRHFYN3pyNnUzSWpndkFBY1g1MFVqYnBm?=
 =?utf-8?B?bUxTQW5uWUlGc3JWNEx4blF6cFlFSGdQVkswcFhOKzE1bmwyY3VBVHByeGdZ?=
 =?utf-8?B?WlJtMjBuTzNTQ2IvbUROa0o2ZzZMV2ZRV3RhN3ZIVWNrTWk5SndnTUtFbGxI?=
 =?utf-8?B?YmZmZFlRRnZ0RjhkREI3OWwxcTVRNlhrZnA5Kzhqd2NPbmlPMmcxU1h2cW8r?=
 =?utf-8?B?dWZpMFdPbXcxVHd3L29KT2NJcXQ3STNDNGpXZHB6c1NLM1dLdGw0NnY2WXIy?=
 =?utf-8?B?YjkzU0hnM2RCQWg0VWJNL3M2YThncjdoTTJ0cG02elFuZmhicmZtNFgxOXFU?=
 =?utf-8?B?SnIzbnNUNlRoVFJmQThhODJyM0o2djl0d3NDQmd6d0JUUXpCVUREaXJSdDZn?=
 =?utf-8?B?aFYyWWlDMG1YYnhHQWg2QjZWTklFZlcwWjVySkFzQlJaMDFFdExnaVRuYlVC?=
 =?utf-8?B?WkM0YkFkVjBwM3l5Q0ZCVnJrYnFpbHpQblJUa2VDazRWK0Q2OFJ4OGk5em1L?=
 =?utf-8?B?VjlDREtoY2JQSFZ6ZHFpV25oUm13dzhITVREaW9mdmdOMkNiV2NiZUcranNB?=
 =?utf-8?B?bC9UbWFpcEhQeU04M0R4RzRXQ1g5T0pVSWdQNWdsVmFmUHBBQjZ1VGJZMzMz?=
 =?utf-8?B?RXJjTjhmZWs5N2ZaRHNwT0JkdDNrWUpDcGI4dmJOMEMrYm1WVjBmbGl4L1NN?=
 =?utf-8?B?OWJOWHl2SjJMRzE2TGhTek0yM0UyYmFPWk5GZE1aSDlxd0s3TElLSVIwc0JD?=
 =?utf-8?B?blNLOWlBd2tINWh0V3lPaE9UMjFnWlczd2xRYWRhVDZDc3hINlZsRlpTeGpQ?=
 =?utf-8?B?OHVnRFUxTVFrdTh3ODJma0puQ2NZaVBzY1d4ZG1FUm42ODlnMGMveVVPZGpx?=
 =?utf-8?B?ano3aXRaSXgrZXFVY2hmV2Z6cy8zTVFFQnZXS2d2aTlVN2JEOWZYQ1plVUVw?=
 =?utf-8?B?VVRQRVFKZHovSnNXRnBzdjM0UDJsbGZzK2ZYNmprdm40a2NuQ0dDZVRMNmlS?=
 =?utf-8?B?OXBMemlrZVF6MnJQa2NRL0s1eGxvMkgwaUphbU1UWTFESVpjcWxMbCt6cWpN?=
 =?utf-8?B?Y2Z6Rk95NWFlZjNJSUVZcmQwUklpaCs3L2o2RFFRMkhicDVQOVJ1WXQzRGxl?=
 =?utf-8?B?QkhjUnNyQUtMMnVIYkFFWFZ5RnpSalFFNzgxZXY3ZmJrNnB0MUFpUzZudW9I?=
 =?utf-8?B?OHpKRWRpZmxVRmFMNnVaQU1ZTXJtZk8yUjgrSVZSd3hFb2N5Z1dJR0JZVzNJ?=
 =?utf-8?B?cUtlYWZGYVptUmVrK01KT0dNSEpHZUYrVTBaaG5ZQmRudUFkdDlpc3Q5T3F0?=
 =?utf-8?B?ei9zOXpJMll3OFNkYS81b2dKYmxRNllPNDIwRHdSbnJNK2U4S1VMWTdHVHgw?=
 =?utf-8?B?NnFuWkdFVDM5UXVHOTgraER4ZnpoOFlFSG9EUDBFMWZvRmk2cGx3VkQ4d0lI?=
 =?utf-8?B?d08vbXUwVmxyeWIyNFY1SUMxbGNNOTZFc1NyazNCNkxHUngvdnJvSzJGSzdi?=
 =?utf-8?B?VlQrMzcrd1I4M1hEb0l4WFFacFdwNnVlVVBudG9oZEJ6OWpYbTQvaWM0MWVD?=
 =?utf-8?B?Nm54U2JJc0hzN0lwcWJFbnFGZVlyMnN4aHFyVUViM3J5ZFRQdlgwOWtTb24w?=
 =?utf-8?B?S1RkWXpIdW9LbldxYmZGWCtaNDNqa2VERXl2N01XRzhkbXl6a0JyNHFzRkFM?=
 =?utf-8?B?WENZNmtrcTZ5Z2VzRHc1WlRRQXA3blhKbjhhbkxSMkU5Wk15UXFxMGNrVWNX?=
 =?utf-8?B?eUFidWZXbVZEZU96TUJyeW5CMi95emNmQ050cU0rQ1d0RTh1bUlQMUMzSjFW?=
 =?utf-8?Q?QIwg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXFOWjd6Z2l4aDVoUVNvYnZ3R2EvRGlRODJjNnMyaXNMbmJuZUVXdjcrdnVS?=
 =?utf-8?B?bmoxcmlmRW5NSVF4RGk0Q3VWR0dpUjBJbDJhTHE2d2Y5SlM2UHUzSUZKYjM3?=
 =?utf-8?B?RTVMc3ptWmZqcHhveDh4OWMwREZLUDhQQVFhUVBWcWtUalFHYXBLdEluWkxN?=
 =?utf-8?B?Z0cvYzBYZFlsZnVPOHk5MUFnQm56N2xnMTJBVVVVYXVkNVFVNlhuOUxxQ3c3?=
 =?utf-8?B?MXJhRWovYjh2SnQ5ejlFcTg1YzhKSytseCtQWEQ4cXR6VnpkMERKdzRzenpY?=
 =?utf-8?B?YXpXUjNEcUhvZGk2dkJSQ0ZzeFE0S29EV0NMNFI3bkU4c0hkYm5ZKzRpTzlL?=
 =?utf-8?B?SlBtd1dFNGEyeS9PZm0vOWZDeUxqNTNtaFliN05TaXYzUGRuNEJOQ0prUERl?=
 =?utf-8?B?ZUo4RWJaQkJqSUdwRDg5cDFlZGFPMU5UeDFYem9ncjM1RTg1ckhMQXdvcFd0?=
 =?utf-8?B?c3BmNnVBLy9xRkkrdDNaMUpyemR4enZ4YXdmckFGMFZKNnd3UGJPT25zZE5W?=
 =?utf-8?B?bmZPYVBPY0F5ZnZyV1VJUXcwdnlPUWVSaFVZTFl4VTY0dXNjaDJneW5zVVl1?=
 =?utf-8?B?aFhpajROOG1DT2lKYjk4YnNkV1hVbTZtOGlxYktwZW9pcXYyMHhnNTA1b25F?=
 =?utf-8?B?ejM2RVRiVFovVDB2d2RLT3h4VWFDSFVDNFpmSjZ3TDZaRTZEcVNXWWdkS1No?=
 =?utf-8?B?aTBzQnFFUG00VUprT2xRelFWMVdHNU9NeWs5ZUN3Yk1Rek1YbExMWWtDbnQr?=
 =?utf-8?B?QndqdmNjT2pwQVVZOUtkZVg4NjUzTXZaaklpTVlsbWZqd1doLzFSRStub1J1?=
 =?utf-8?B?YzRDSFFlYTFFeWhzMzBXTE4xUVBraldsMWl4RTVmUFVpd2tnZlNBRGlReVZj?=
 =?utf-8?B?OFk4cDJQbkJuVWI2aHFocldPMzZXS2xNUmpBdGVsNWd2SFhTYnhLMEx3ek8z?=
 =?utf-8?B?ZnVySGJFbThPYVU3OG9RZmUxM1B4a3Z2MlpYT1dKVUtOelUyaytHSk8xYUZl?=
 =?utf-8?B?dW1NWDJnRGxvbXpNYytOOUxpVUIyejI5NzFGY3JzOVhsYnZEY0dQZ1VxeTk0?=
 =?utf-8?B?ZjhTQXpuelc2UHJDSzBtN2U3SCtCSVZEVW9ucXZlcCtqQXpaSlA3a2JsTTEy?=
 =?utf-8?B?TFhhbGxKTnZVazh1cDMzK0ZqQWV4bThBWjFzdm1HZmxhdStlSTVueVNQWVV2?=
 =?utf-8?B?UmowTG1tRjFubGdpU1luL2s4VVlURS9IeGxHYlhZRW9oV0tlY1hWbnJsR0Zk?=
 =?utf-8?B?SGEvUzJjcFNRN0ZManRJaUJJYnJldlI1VWFBdWs3N2xHdmsrUS9CL3AzSnor?=
 =?utf-8?B?RW9jSGREVm1iS3BpUWxhOHV5UGcxbGwydXFMSFc1aEFlUEtnNWlrZjZpOEtj?=
 =?utf-8?B?ZXpPbjZrcVdIK3BrSS9lTUpCcW5jbm5DTDYrRUhxbFFMYjlUd25aUHRPR1d3?=
 =?utf-8?B?NXprd0RMUDRwb0FsQ0pwL1hvYzhuS3FUcE0vUnFMNUtJeVNVVUs4Z3ZRSUY2?=
 =?utf-8?B?c1cwUGVCQTRtYS9jNFFVOVdtUlBkV0JlUDBiNzdqNFlYNk1PaGFrclVYR0NX?=
 =?utf-8?B?UlFMTm1PMU9tYnFTb1pxZnpDV2NudmtiOXI2Nno0bytFZVBKRi92VzMzU296?=
 =?utf-8?B?WGZGUkdCK3NjWlJPcktJdVA1QTd6cDJKczZtMUljcEdpMkNlWEpySjBIaENi?=
 =?utf-8?B?RzNmRm5NSnRFbjZnTHZsUzcyNTBnOFkyZG9RTGJCSjBxbnhLL0NobkFDaDlP?=
 =?utf-8?B?YmVrRkxjTUxaTnFkSTNFN21KcndaaEM0T09FcldDQ0JlSHo4Mm05blpqS2Mx?=
 =?utf-8?B?djcrK0tYanp0MDEwbVlaSjRrNjRXdlpRWHhDdCtlQnBOTnVqeU5GUDlWTEE4?=
 =?utf-8?B?dTRDYVIzZ2x4QVZMelZxbGNoZFRYVW9wb2E2N0FnLzNWZWFDbHZXSXNiSEk1?=
 =?utf-8?B?RGJvTDd4Zk42SkdlOWVGUFBXVmRoMjN2cnVLdDlWajlNVXJuOFJOWDZBeHRL?=
 =?utf-8?B?UmVzd3ZIYWU5UEVRcTRGWVpNSHlYY3JpWjlKVU9kdXJVNUxCZ0pNWDhDRmk4?=
 =?utf-8?B?TDhVaDM3REsxcno4NkViUExxV0V6M1NBVVZ4SklUZndwQnFVeXI5ZTNvcGFO?=
 =?utf-8?B?NW4ybzVmZ3hRUkMyRGxLQTBWc1hhYW8vTmhCNmhhWUN1WmR5U3VHNVZRYi92?=
 =?utf-8?B?NWtTcXA4NUozbllaN2RZWW5YdHNWMnJITENnMzVTU0N2cWtZQTIrOHFueUNp?=
 =?utf-8?B?WnJjaUlGS3Bod1ZVWlZTVi8xYTRQUml4aCt6a2h5enpmTEZzWmV3UklLSCs5?=
 =?utf-8?B?UGV0S1h0OU10enhYYklsbW1ZOElTbEpjeUQrQk4vZWdtMmdtY3gxQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e35d4eec-7f1c-4014-0df8-08de650d9d63
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 23:23:48.3509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPcYlBWIXVKTMXNTpXXPn54oa8IXzZ5hNoRIdmIK4fa/G7d+ou4y1UM/h4JgBLa0+e4TjDWWMl8MQAJxbU39Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1926

On Thu Feb 5, 2026 at 8:44 PM GMT, Lyude Paul wrote:
> `SpinLockIrq` and `SpinLock` use the exact same underlying C structure,
> with the only real difference being that the former uses the irq_disable(=
)
> and irq_enable() variants for locking/unlocking. These variants can
> introduce some minor overhead in contexts where we already know that
> local processor interrupts are disabled, and as such we want a way to be
> able to skip modifying processor interrupt state in said contexts in orde=
r
> to avoid some overhead - just like the current C API allows us to do.
>
> In order to do this, we add some special functions for SpinLockIrq:
> lock_with() and try_lock_with(), which allow acquiring the lock without
> changing the interrupt state - as long as the caller can provide a
> LocalInterruptDisabled reference to prove that local processor interrupts
> have been disabled.
>
> In some hacked-together benchmarks we ran, most of the time this did
> actually seem to lead to a noticeable difference in overhead:
>
>   From an aarch64 VM running on a MacBook M4:
>     lock() when irq is disabled, 100 times cost Delta { nanos: 500 }
>     lock_with() when irq is disabled, 100 times cost Delta { nanos: 292 }
>     lock() when irq is enabled, 100 times cost Delta { nanos: 834 }
>
>     lock() when irq is disabled, 100 times cost Delta { nanos: 459 }
>     lock_with() when irq is disabled, 100 times cost Delta { nanos: 291 }
>     lock() when irq is enabled, 100 times cost Delta { nanos: 709 }
>
>   From an x86_64 VM (qemu/kvm) running on a i7-13700H
>     lock() when irq is disabled, 100 times cost Delta { nanos: 1002 }
>     lock_with() when irq is disabled, 100 times cost Delta { nanos: 729 }
>     lock() when irq is enabled, 100 times cost Delta { nanos: 1516 }
>
>     lock() when irq is disabled, 100 times cost Delta { nanos: 754 }
>     lock_with() when irq is disabled, 100 times cost Delta { nanos: 966 }
>     lock() when irq is enabled, 100 times cost Delta { nanos: 1227 }
>
>     (note that there were some runs on x86_64 where lock() on irq disable=
d
>     vs. lock_with() on irq disabled had equivalent benchmarks, but it ver=
y
>     much appeared to be a minority of test runs.
>
> While it's not clear how this affects real-world workloads yet, let's add
> this for the time being so we can find out.
>
> This makes it so that a `SpinLockIrq` will work like a `SpinLock` if
> interrupts are disabled. So a function:
>
>         (&'a SpinLockIrq, &'a InterruptDisabled) -> Guard<'a, .., SpinLoc=
kBackend>
>
> makes sense. Note that due to `Guard` and `InterruptDisabled` having the
> same lifetime, interrupts cannot be enabled while the Guard exists.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
>
> ---
> This was originally two patches, but keeping them split didn't make sense
> after going from BackendInContext to BackendWithContext.
>
> V10:
> * Fix typos - Dirk/Lyude
> * Since we're adding support for context locks to GlobalLock as well, let=
's
>   also make sure to cover try_lock while we're at it and add try_lock_wit=
h
> * Add a private function as_lock_in_context() for handling casting from a
>   Lock<T, B> to Lock<T, B::ContextualBackend> so we don't have to duplica=
te
>   safety comments
> V11:
> * Fix clippy::ref_as_ptr error in Lock::as_lock_in_context()
> V14:
> * Add benchmark results, rewrite commit message
> V17:
> * Introduce `BackendWithContext`, move context-related bits into there an=
d
>   out of `Backend`.
> * Add missing #[must_use =3D =E2=80=A6] for try_lock_with()
> * Remove all unsafe code from lock_with() and try_lock_with():
>   Somehow I never noticed that literally none of the unsafe code in these
>   two functions is needed with as_lock_in_context()...
> V18:
> * Get rid of BackendWithContext
> * Just use transmute in as_lock_in_context()
> * Now that we're only supporting IRQ spinlocks and not using traits, use
>   the type aliases for SpinLock and SpinLockGuard
> * Improve the docs now that we're not using traits.
>
>  rust/kernel/sync/lock/spinlock.rs | 78 ++++++++++++++++++++++++++++++-
>  1 file changed, 77 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/sp=
inlock.rs
> index f11a84505ba0e..de736cb777e93 100644
> --- a/rust/kernel/sync/lock/spinlock.rs
> +++ b/rust/kernel/sync/lock/spinlock.rs
> @@ -4,7 +4,10 @@
>  //!
>  //! This module allows Rust code to use the kernel's `spinlock_t`.
>  use super::*;
> -use crate::prelude::*;
> +use crate::{
> +    interrupt::LocalInterruptDisabled,
> +    prelude::*, //
> +};
> =20
>  /// Creates a [`SpinLock`] initialiser with the given name and a newly-c=
reated lock class.
>  ///
> @@ -224,6 +227,45 @@ macro_rules! new_spinlock_irq {
>  /// # Ok::<(), Error>(())
>  /// ```
>  ///
> +/// The next example demonstrates locking a [`SpinLockIrq`] using [`lock=
_with()`] in a function
> +/// which can only be called when local processor interrupts are already=
 disabled.
> +///
> +/// ```
> +/// use kernel::sync::{new_spinlock_irq, SpinLockIrq};
> +/// use kernel::interrupt::*;
> +///
> +/// struct Inner {
> +///     a: u32,
> +/// }
> +///
> +/// #[pin_data]
> +/// struct Example {
> +///     #[pin]
> +///     inner: SpinLockIrq<Inner>,
> +/// }
> +///
> +/// impl Example {
> +///     fn new() -> impl PinInit<Self> {
> +///         pin_init!(Self {
> +///             inner <- new_spinlock_irq!(Inner { a: 20 }),
> +///         })
> +///     }
> +/// }
> +///
> +/// // Accessing an `Example` from a function that can only be called in=
 no-interrupt contexts.
> +/// fn noirq_work(e: &Example, interrupt_disabled: &LocalInterruptDisabl=
ed) {
> +///     // Because we know interrupts are disabled from interrupt_disabl=
e, we can skip toggling
> +///     // interrupt state using lock_with() and the provided token
> +///     assert_eq!(e.inner.lock_with(interrupt_disabled).a, 20);
> +/// }
> +///
> +/// # let e =3D KBox::pin_init(Example::new(), GFP_KERNEL)?;
> +/// # let interrupt_guard =3D local_interrupt_disable();
> +/// # noirq_work(&e, &interrupt_guard);
> +/// #
> +/// # Ok::<(), Error>(())
> +/// ```
> +///
>  /// [`lock()`]: SpinLockIrq::lock
>  /// [`lock_with()`]: SpinLockIrq::lock_with
>  pub type SpinLockIrq<T> =3D super::Lock<T, SpinLockIrqBackend>;
> @@ -286,6 +328,40 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
>      }
>  }
> =20

This is much cleaner now compared the previous series. Thanks!

With functions marked as `#[inline]` as appropriate:

    Reviewed-by: Gary Guo <gary@garyguo.net>

BTW: do we want to have a

    impl<'a> lock::Guard<'a, T, SpinLockIrqBackend> {
        fn as_local_irq_disabled(&self) -> &LocalInterruptDisabled;
    }

?

Best,
Gary

> +impl<T: ?Sized> Lock<T, SpinLockIrqBackend> {
> +    /// Casts the lock as a `Lock<T, SpinLockBackend>`.
> +    fn as_lock_in_interrupt<'a>(&'a self, _context: &'a LocalInterruptDi=
sabled) -> &'a SpinLock<T> {
> +        // SAFETY:
> +        // - `Lock<T, SpinLockBackend>` and `Lock<T, SpinLockIrqBackend>=
` both have identical data
> +        //   layouts.
> +        // - As long as local interrupts are disabled (which is proven t=
o be true by _context), it
> +        //   is safe to treat a lock with SpinLockIrqBackend as a SpinLo=
ckBackend lock.
> +        unsafe { core::mem::transmute(self) }
> +    }
> +
> +    /// Acquires the lock without modifying local interrupt state.
> +    ///
> +    /// This function should be used in place of the more expensive [`Lo=
ck::lock()`] function when
> +    /// possible for [`SpinLockIrq`] locks.
> +    pub fn lock_with<'a>(&'a self, context: &'a LocalInterruptDisabled) =
-> SpinLockGuard<'a, T> {
> +        self.as_lock_in_interrupt(context).lock()
> +    }
> +
> +    /// Tries to acquire the lock without modifying local interrupt stat=
e.
> +    ///
> +    /// This function should be used in place of the more expensive [`Lo=
ck::try_lock()`] function
> +    /// when possible for [`SpinLockIrq`] locks.
> +    ///
> +    /// Returns a guard that can be used to access the data protected by=
 the lock if successful.
> +    #[must_use =3D "if unused, the lock will be immediately unlocked"]
> +    pub fn try_lock_with<'a>(
> +        &'a self,
> +        context: &'a LocalInterruptDisabled,
> +    ) -> Option<SpinLockGuard<'a, T>> {
> +        self.as_lock_in_interrupt(context).try_lock()
> +    }
> +}
> +
>  #[kunit_tests(rust_spinlock_irq_condvar)]
>  mod tests {
>      use super::*;

