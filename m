Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021112.outbound.protection.outlook.com [52.101.95.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F208E39E6DD;
	Thu, 15 Jan 2026 13:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483163; cv=fail; b=frVmrDKUwa8rUAdBnl93W+xs/LQ7iZN+EhsOHeiegdh1k8BIfx8NSQUkBqGSIZgECOZ1P3hW9hsuSrbTPj64CTKU8EI48ORIonNruqi5sRh+T6IVrXDsDLmx4K8/Xa030J2OXxbabsx6DniYv3AcEaLZ/a80bgNV2/4oz4kiXRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483163; c=relaxed/simple;
	bh=awFDr+7woa7xJd+rYAnLKN5ThtH0y3tNG1rXuvYc57Y=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=BVd8gD3pQ9XFpBilie6UIkQtOKf+KbTvEtWbZS51okw0VodYQSbLxyE9+0U3gHo2Im/dYdi5dTGv91R4KTkRO44w+zVwnYF0SBQ0Yw7nm4nVAQM30V3MjMzSaPmmZNE3bWtOKtKw+Rwa2e3P93h/6o5MhBpt/s5xqJ3g3jmw5dI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=GHoH/Gfz; arc=fail smtp.client-ip=52.101.95.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="GHoH/Gfz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeVPXx+McXYb5yn4ZO8XAaTNVxwv4L1FieofG31K1SOZlwTBPMmSzOl5yS7OHIFYu8hB+t3hGMDNfcWNafO5DU/1eBU4YZ9GkFIJDwcrlQWTVhY80pU5EaSl0CI9eU9V4wv06sNeFiRowZIpg3gz9AetnwRKLQSSbqOwedkC/RsOn9BfsQCHcRfiHVdY7nGB9t9QhNNSuYymmBgu/HzILTZlcfzU4mwCR7vzD9eHFkkKGdEqPUQsSToGuQReeNRJjr461PwoMecPZdOSZYkf1f0/4BUetcb6SWauOja5EjETDHZNeO74KUHE+QUwAJc2Lpqldi7WamN2ZAfiONu6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55DNSs9PoyojKckWXFSqPGTjr3L2lK6Vfc3G+VlbPBs=;
 b=Qs4Q/0pspYA0PVKqZh8Rgs+iYaRITNztNYycFCiiqH+foIx1zYBC5uMUjP50uxHJUKZ3v77XXSZry8YgMejQa0SPiyr6fUxbhSRZoz/PSsFV2LuCCijY8mQgXzFShvZa/G4rwA7/2uxDyJ24OmeSmWkmFPNuYkqDktYHt73WOPNEZoBj+WQzaOOVnjZYOt+s0bKqnawpO/H4wu5D1qRJLeUyyWPtAePe60MrHI8saTD83kpUXd4m9Kiivma+kAi4J7bX9JI+Esjsde9RfHT+6ATGqWusDE6JtpIHG/DiElkuR7zBlDV/vyTdDPs04uJcfRIsE3OJtri+guXyFR4nCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55DNSs9PoyojKckWXFSqPGTjr3L2lK6Vfc3G+VlbPBs=;
 b=GHoH/GfzJXCgnj3wNIW5dLJWfa2aSK7tj972xI/Moz6nZTdlY7Z9+PqqnqgdmM9YWTTCjqCJPh2Z8WAsJE2TJPSdfWIuMNyYmiRgBiGi0IhdaBGnrBueIqba7YH6u8bUzhW+yvyD5zLho9Xi8Wh7HNy0IU/0u8xHapRGkO/otM8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOVP265MB8582.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 13:19:19 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 13:19:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jan 2026 13:19:18 +0000
Message-Id: <DFP6YJB8C5IG.3G4CMUM6YN45S@garyguo.net>
Cc: <daniel.almeida@collabora.com>, <rust-for-linux@vger.kernel.org>,
 <felipe_life@live.com>, <linux-kernel@vger.kernel.org>, "Lyude Paul"
 <lyude@redhat.com>
Subject: Re: [PATCH v8] rust: add new macro for common bitflag operations
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Filipe Xavier"
 <felipeaggger@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <2JpjX5S1c2QLiHUftMzVViS7xatVGkJperCPqxJU8ZQ_Opyo4KPge5jcRCPb0Gcgyxb4yeFhm6Y-1X8q3pbNaw==@protonmail.internalid> <20260111-feat-add-bitmask-macro-v8-1-3bc0a558ede0@gmail.com> <87jyxjf56j.fsf@kernel.org> <87h5snf4yb.fsf@kernel.org>
In-Reply-To: <87h5snf4yb.fsf@kernel.org>
X-ClientProxiedBy: LO4P123CA0514.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOVP265MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ecd899f-d48f-4a9d-eb6f-08de5438b090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGh1ZzFCSkpTa0N1Zm5nYXVsY3A4Y1YrTUlTZ2dadG1jRWxYdGdkekFNVDlX?=
 =?utf-8?B?ZkJHYkZHcGZPZ3F0a2p0SnFZYkZBOG5GY0dXZ0dBTkN3VHRRdEUwSmk4bE9V?=
 =?utf-8?B?U24wRldqQWhCK1J2WFlFZjk0NzlXQmlXeGYraU0zSXVNQ0w0SE5yYXpGQU50?=
 =?utf-8?B?OUNTTEpWM1hGeC8rSUtvN2VJNFFOMDhmVmUrNmFqUzdQalBBNG1DZlF6Z0hV?=
 =?utf-8?B?dWxobm5UZ3oxK09LNlVsTXh6bHQ2bGFoTFR3aFZmZDV6YnFLQ3Q1YmM2K296?=
 =?utf-8?B?aU5ENUg5dno3RXh2amJ4d25lZlZPT1JtYlYrQ3BkNlJRVlRkUzJSRVpuM1lX?=
 =?utf-8?B?RGFkYkNxQ1lMOVJEbXlDR29pMzVrZkhseDhzZ0Z0VER2Q0MycURGbk4yeDVX?=
 =?utf-8?B?VFBVSGNKY0pHMjFUZnRwdVVFU05wR3hzTlRnR0djYzVvR2dRdW05VVBxMTNN?=
 =?utf-8?B?VlVUWXNRRGN3ZGRIZWo1VDhPeGR6QmRJeDI1TWw1cVFCMmEycUJGVFc0Uy91?=
 =?utf-8?B?b0FMRXNwSTMwWmpqekVLOFA4dVo1YVE2NFV6cGZibE5oU1N1bEdYaW4yTHgr?=
 =?utf-8?B?djhmM0ZxMlVjTU9CRXp0WWpFbWdnZUpiZGl4aTB2b0Q0NGF5UDRNTUV1elk5?=
 =?utf-8?B?SXJHZ1Z5YjlTdW81QVRLZFNWbFNJTE1QSFhsblA1TmYzeHJUMGdoRjZRc0V3?=
 =?utf-8?B?ZUpPWHl3U3JnemZnNG1hYUNGMlgzTHJ4amxrTGVXZ2kvZ3Jsc3k5V2YrZEpB?=
 =?utf-8?B?YTcvK24rQ05rWTFoazdlVU4xMmRQZW5DVStyUFNFL0pQNjlnY0RCZTlsUW9v?=
 =?utf-8?B?ZzUxTlcwSVB4VDhQb2pMK2twR09rRmF6RURQQlc1MUdlTVJUTHpuSnI5N21N?=
 =?utf-8?B?ZG1KdW00ZmV4WEhTZHBzTjVMRnFtak82Yk1mTDVaQjBRSVV2aURKQ1NGV3NG?=
 =?utf-8?B?dGE1dnNMTHdGVGRFcUgyWWsyU3BDZlFGRU1JSGNmOVczNUhFeGU1ZUwyMHQ4?=
 =?utf-8?B?TFdtMXpmOFB6U3psdXB3amdGdm5yQTR5QkxKNlZsajZkZFNOWm8xNjVnT0s4?=
 =?utf-8?B?encvMUs1YnRndWtlS1pQck8xM0pYV3ZIMnhIbHhWS2kwNEd5WkIwZnJKanBq?=
 =?utf-8?B?dWhaZ2JLMnRtZWZFWkVsRHVUSEF2bDZlQTNRaTlDRXNOcjdINFM3eWpHcTA5?=
 =?utf-8?B?ODVrR244L2RQQTVTQ3d1WjhBWTRPYnFMa0F0cDIvMzJNN3lld2w1TzV2RkZH?=
 =?utf-8?B?Mkx2clZ1WkpJSUxEaEhOcVVhaklMWENmMTE5YVZLaWtIZmFSMzR3MXhIQWpV?=
 =?utf-8?B?amtBc3BXMFhTUWxIY3o1c2hzdHBqZkhtU3dUVXVQN3FabzlXdnFhZFlBT2tl?=
 =?utf-8?B?R2YvdlFLS29ZT2U4MnNJYVZyM0RnWVZrWW5NYjltWnJHanlpUlNHeTJPK2I1?=
 =?utf-8?B?dnB0NzNJdWVYNjRXblF6RHVNV2Z1UzRocjY4dTR1b2ozNm5MR1VpVWo0a0cv?=
 =?utf-8?B?TXdlMmdBVHVvNjVKQlhTZEtzdjF3UGpVRjQ3V0Jzb2sxTVcxcWwxUzlFVDZh?=
 =?utf-8?B?ZGJjSEY3dHJXOEF1Q1BkZTAyNHpmd2RWdGRpa2QrdGZaN1Rnakx5UkxQYUdM?=
 =?utf-8?B?RUl6eWpERG8zOTBDbzJTS0RBeEdlNUY3RjJyQWpzanF2aEtlRVJMY2FrS253?=
 =?utf-8?B?RVhXNGc0QVBRVE44aTF5dkVPT1hWWW4wdXZoVVFjV2kva0gwNzMwL2JaVVcw?=
 =?utf-8?B?UlFBa3hOOHZYU1B0VmlGVldaSHRpQm1YR3graEhyNHhtQlBWVWdxb3J4MzFs?=
 =?utf-8?B?UG1pazExV2prc0h6ZjNyV2xnRHZMSTFOeGl1Wkl3SGErMVVhdkFjVUd4bFJ3?=
 =?utf-8?B?TDhIUlZEajQ0Q1ZFdHhPRTRGeW5oR3hVbkgrVllzTXlGR3ZDLzRqb3pVUEhn?=
 =?utf-8?B?Uk9laUJKRGk1MnUxcEJHSXBFUnJkeU9kMHhLVk0wQ2gzMndldFhJREpKTzZm?=
 =?utf-8?B?b2hVdVFERDZCL1RFODZaN2hQdTRySTBaMGx0SXJGUWVXcUpSaW1ZNlM4MTlQ?=
 =?utf-8?B?RlpFTzdBRS9Qc0ZMekFVWnBhNnlsd0dCaXI4SSt5OHNUZzlzbEJjY0J0QzBE?=
 =?utf-8?Q?zBcM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk9vRWc1VzY3dHFCREVoY2hLQXhhUlAwR2VabHp2a3R4bFRmWnRZa0hCNFE0?=
 =?utf-8?B?TXcrbDN4NkhhZ2s3cHV0b1lQTHlFYUV5SnBYT0tQYm95TlZtRi84T2xlTUVI?=
 =?utf-8?B?c0Qrc0pxamtOL09YdkppSU1Pdys4ZVFyMnhlb2J6U2Q0Yng3T2hFV2hjWTFx?=
 =?utf-8?B?c081VzdBRlNOVlQrNVpjbC9rTTJ3TytOWXFTWkU3bjVLYUpWL2JZVk9Xc0JY?=
 =?utf-8?B?QTk1SWZJZVJqSFplRkxEUkpTYVJJN05DK0FsWnZiK2hlQWh1cGVKSjFiS044?=
 =?utf-8?B?YmVBbGV6NnNvMU9CRTMrVVNNZjdBSldiSGprRVpNbmNldllseDVyOUxLNXF5?=
 =?utf-8?B?Sjlvczc5clBRM0sxR1dQbXgrZ1QxVXpSeTZ3citFeTVoWk1RdXBBRGw5dkNC?=
 =?utf-8?B?UnByZDdsOEZRdENQeWtVTHdQb2MwbWhkUERuakd2c3JQVVErazVYbGVBRjVQ?=
 =?utf-8?B?aWgvenVKQlQzS3NSU0tWeUFPdERGNzd6VFlHNGplRlp5ZnMyVlNtVlpnd1Np?=
 =?utf-8?B?Z1Y4YjMwZ0NFYjg2M1FKRmd4K0s5cm1QSVNUaU5yMGN0dzFYVFBGSklqNnBO?=
 =?utf-8?B?VHMyL2VRc0FLVU53V0NqM1RlSDdPT1E2L2llQ2hTdXJLSXJuM2VGWjNqOVJM?=
 =?utf-8?B?Qlh3cWxEZFVSSzg4WFZRS2ttWUR5Rjd5VmVxbkZEZG5ZVnZhUjdIQk84dzAr?=
 =?utf-8?B?R2RYYmh5SC8yWU55eUVVbFUyaWc3d05DOEI5Q0VmQ3F2SVE5aVF6SXlIemo2?=
 =?utf-8?B?TFBOTEQrdEtEek04RTNzNWVQWTJXTlRmMlFFWFZVa1JySSt1TEpJakVJMlZz?=
 =?utf-8?B?M3R6WmtQNG9lelNwMjdlWUJFNmdiblpOMlU5SDdScms2V0V4MWpBdEYrVngv?=
 =?utf-8?B?NWxaMHYzTDVJSjVJSE0xVnZ5R3o5a1AwTnRaNTFRS01YYS9zbmZzSjdpOUVU?=
 =?utf-8?B?ZUtydXdaQUNVL0lFLzd2RGJVQVJpZStCQkYrZlZPQWRVcFcvWjlVbG9pRGpE?=
 =?utf-8?B?TFRjQ2l1ZnJnSEZmSjQxNzUzRWtZa1lUaDR3NU1xREg0ZUxjdk1MTjBETWV2?=
 =?utf-8?B?dkcxNHAxd0dKamRKczlrZmZqMmE2UjY2cjB0Qnc4STJxbXZIUkRXOFluQ2E3?=
 =?utf-8?B?ckpqS1Z3WlVISmVvaU5rYkJNQWVJc1VlRTdjMVgzWC80cE9wSlg3QU1ua0Z4?=
 =?utf-8?B?eWxXWDVOZVpFcEFJVzFXRzZHVzNuSnZodmhOQ0g4RC9zaWhHTHFaZTdyc0t5?=
 =?utf-8?B?cGJrUFBPNjU1ZTFqOTZNNnhlVWJ6S1JrRHFWdXlCOXJ2d0VUOHZ5WEg0OGV0?=
 =?utf-8?B?dU5NMHVtTlduTnNQVnBYa2Vvb1RsSGtxajAxSVk3Z01XMXJ5NXl2eHg1a2dk?=
 =?utf-8?B?OXZ2OG5MMTMwek5SdlBjMVhBVFp1di9SS0VTZEZSUW85S093N004eW1RNTBZ?=
 =?utf-8?B?dnBNNTZQWFQrRU9FV0xXQlRsUUNNY0EvVllibDIrdlEvdFRvVVRlWi9NcmpE?=
 =?utf-8?B?R0p0N2M4eFNuR1hzNUpqNkdTZmdUaVZ6UEovTzRZTW4xNUZCT1cvWC9OZXNy?=
 =?utf-8?B?Y0Q0bnNJbFgwU2k1TG1XWmtacmlFRFJkZzNtUUhXR2lOazZGa083VFpXZ0pK?=
 =?utf-8?B?WU5ESTdheHNmYjN2K2hoSTFkOHh3NDdnTUVTSzUvOVZqZUJ0bGxSMFZ3SG4y?=
 =?utf-8?B?UlR4eENmSGk4TENLZlhEM1ZSQXhSVFJCWVNicFBVaTQ2WjFaZkkzTldwOTU3?=
 =?utf-8?B?c2xrVkQ4WnJVMnkyVm5iVzFtbGRkcjlwQ2ZvQ0dkakVuekM1alpydU5DWGd1?=
 =?utf-8?B?bXdjVCtIWHowQS92YUF4UUIzdytDMjV0dmFOcFNkOGQ3TWVVV29VUEo1Q1pF?=
 =?utf-8?B?bm1xamRFRjdGa0J5Z1J2djFCLzNtTklBNS9OT3BSRFBQVndMR2dodDlSL3V3?=
 =?utf-8?B?TG44dlA0NXNxdVlRQ0tXd1pBUlVqUXQrVmlTeVhoYWlVbDN6cjJ5d0NlUTVh?=
 =?utf-8?B?dTNhU0xqMUlUZFRQdVlSd21qcUtsOWdsZ1ZSSkkyMzIwRjJDakhOSndUU1Zu?=
 =?utf-8?B?UUxwZ01YOGpRWkxkMlVzb2h0ZThzSklobVhnbDBjQlBkb1Q5Z1RDUTI3ZW5B?=
 =?utf-8?B?YXIwSTJpR3J0OGhPck14cnlYM0lwWnFMYmhFcVhGSDQxTHFSTXVsZlFwL1JX?=
 =?utf-8?B?UmtSeU1MVHFEY3U0bEsyS2RuUVIwQ3RkMHdtQ0pyTkhadWMvSzAzelBHZTB4?=
 =?utf-8?B?NnhiQW40Q0tGeHg0ZDdqZ2dlRVJHWjdKN3AyRnREWEpTeHNpSFF6c1BlRmV4?=
 =?utf-8?B?eEJ4NHhWUDE2SHlCcHVVRDhBWDlDUVNxSEY3dTliS2xxWjZYZXFGZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ecd899f-d48f-4a9d-eb6f-08de5438b090
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 13:19:19.1198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHvyj8cAOQPdCPSjfqAADNaKigYk5LPYDBH4v81kTaM4NxayfrCmsZBY1myNs2IcZ4/Q/QQRN6qfyo5Xrc4h0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOVP265MB8582

On Thu Jan 15, 2026 at 12:14 PM GMT, Andreas Hindborg wrote:
> Andreas Hindborg <a.hindborg@kernel.org> writes:
>
>> "Filipe Xavier" <felipeaggger@gmail.com> writes:
>>
>>> We have seen a proliferation of mod_whatever::foo::Flags
>>> being defined with essentially the same implementation
>>> for BitAnd, BitOr, contains and etc.
>>>
>>> This macro aims to bring a solution for this,
>>> allowing to generate these methods for user-defined structs.
>>> With some use cases in KMS and upcoming GPU drivers.
>>>
>>> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-Gener=
al/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
>>> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
>>> Suggested-by: Lyude Paul <lyude@redhat.com>
>>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>>> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
>>
>> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>>
>>
>> I think it would be useful to add:
>>
>> impl Flags {
>>      unsafe from_raw(value: Repr) -> {
>>      ...
>>      }
>> }
>>
>> impl TryFrom<Repr> for Flag {
>>      // Succeed if `value` is a valid `Flag` enum bit pattern.
>> }
>>
>> impl TryFrom<Repr> for Flags {
>>      // Succeed if `value` is the logical OR of valid enum bit patterns.
>> }
>
> Also bitwise operations on the underlying type such as
>
>   impl BitOrAssign<Flag> for u32 {
>   ...
>   }
>
> Not sure if that is possible with the orphan rule, but it would be nice.
> I was trying to
>
>   lim.features |=3D request::Feature::Rotational;

This is allowed by orphan rules, in a similar way that you can implement
`From<Local> for Foreign`.

However I don't think this is desirable feature? Why can't a conversion be =
used
if you're using raw reprs?

I think we should discourage the use of raw integers when bitflags can be u=
sed,
adding that (or even `TryFrom`) can be a negative incentive.

Best,
Gary

>
> where `lim: bindings::queue_limits`.
>
>
> Best regards,
> Andreas Hindborg

