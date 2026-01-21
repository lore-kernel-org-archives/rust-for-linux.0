Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021130.outbound.protection.outlook.com [52.101.95.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1547E47DFB5;
	Wed, 21 Jan 2026 15:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769010398; cv=fail; b=U53t879NCa5yZr+ScGqHofXoHaY9ru1+nkiJqPuCaQjtku7ulJoEPIp3r+x5yEskYH3iUrqDBNt0zKRVVMaQ44usBz0Olib+0kyyjb8obAyziKuDyceF0VQ3rYVQaIs7VlxO4MC77+UbI6sVaJFKpFR5rsSDRmPgGOlqFJJS7nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769010398; c=relaxed/simple;
	bh=xIIsDWVVbsQqhZgGyYprfLk/e/7gi/6224bVy/RmfUQ=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=U5fwTStMvV191Lt38zTV/azfgwRiHJnHKxreCuKP8J90N4p0qBFtBwKjUJOUV3YXOKCz7frAL1zyDY6RhO3fQk38pOfSQYOvSy5Bntrwyetxbe1NPB2507x/uVKTzEx+cBvGZU79xZGrTUqpK0YJ1G0L6vqHqlGVzLhQYQukmdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=eveoVCLH; arc=fail smtp.client-ip=52.101.95.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="eveoVCLH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNm5t9XDZHRP8NE2xPKsflbraT9h4GX1sTjG+rMgFAftcFJAXb9hf1RbzZI9bsCdzJWVzdFK7w5+E5BFKCdF7esnhOiuRhr+ZHANO316hxYuH14TFWtSCWznuwfCiq704mc17S4r35ZRunxbnMtSR8A4GKDLA5a97pyiVsR3uTLQRYU5ygu3JVJDT59AoPcxgJZYpRGTfD1B2l45Ghs1Z54w3fia4FIggu/YevFvB4r8SqnD4SrlLpvKEDg9xY+L48UELsu30TF956DtAKU1iWfNkL9eGESxcSHfOeJZhiYieIjuSFI0rnttxkf1RhOOx0k5CyufdY7tQsf6bwMynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUb4dgr+i3S4n6962ESdaQ/J/m3hCWxdM2T9n3e+ZLk=;
 b=MsinW0LALB3g3Ddduo8dwWRM7IDLc/G3rWsnJLLbLRo7O76GBznXDnL6o2CwJ/Exwjae2mZpyBVAYuAlEI1Rt89zYNS/FO2lF9ColxG5iCgVoTG+yuFEN1j619bTIbl+4kiT2x9zDRzzuGreD+0bJIPm91ct2wdTvTzDlStDWdD3QrVR+AspfkiIUl2uDnw2C0O8/LGDUtFvc8mNm3Sk+Gr9j7MywIyiXQRgBnLfTuiO3pGIyz2YKs4NodG7OhSsEetVo7p2GtuWnXO8HZnbKi71eLcW+PcSiGZsbgjkIbRHPb3yaybrKmSUudAiUsqUJGC9Ra7ue71hxqGPnjjrQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUb4dgr+i3S4n6962ESdaQ/J/m3hCWxdM2T9n3e+ZLk=;
 b=eveoVCLHflkU24rpvnnM8rZv7R8w5FYOgA4vpCakjTvMSaGOogYqgHF66FSkkw3D9a7O4buZ/zNJCh/bB/b1GWK/1+UaMWskvvxy1Nu9EF3A4pHBxD0jWQ1T47Jc1OnPua+S31QRP9YF+70un2DycIGET+4NNGXOJfBq2dtRn/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5833.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 15:46:33 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 15:46:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 15:46:33 +0000
Message-Id: <DFUDUJIWSFED.2X8EVFQI89QAK@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Tamir Duberstein"
 <tamird@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
Cc: "Daniel Gomez" <da.gomez@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 02/10] rust: xarray: add debug format for `StoreError`
X-Mailer: aerc 0.21.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-2-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-2-9e5ffd5e3cf0@kernel.org>
X-ClientProxiedBy: LO3P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5833:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4b2611-609c-4b0e-38a1-08de590440d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Znp4RWdVOVpDV1RrVWJXK0Q2clhhYWs3SXIyNnJ4UmY2Vi9ib1V1V1E3ekVE?=
 =?utf-8?B?WEZxMmsrVFhwUlZKbWpEZkJvM1d1QVZ1Umw4NG9NNWp3bEE4Z3JuOEdKZnRQ?=
 =?utf-8?B?aDZhWmFGSlpwQ3ZMYjI5ZjM1U0hTbHBsbURuN3BkSW9INEhsdStrRHZLdUt4?=
 =?utf-8?B?SG9xdytvQTVmYmVNS1c2L0d2bjg4MENxMm1MSDVqTVN5eFNWRDk1R2Nkc2pL?=
 =?utf-8?B?U1A5b0Vjd1F2NXVkak42OFNKQzdUb1VlbW9BZHBDSmF6L3FrK1NnTWlQSk9Q?=
 =?utf-8?B?b2Z6Y001L0pibC93aFduTUJMSUR6dnJaVmFVVWl0VmlvWlRudVdOT25tcmEr?=
 =?utf-8?B?RlF1cmZXRXM4dXlYSWlEbUJkWWVkTmNqWWhTelFVdjB6YzFjWlhiZlNpcHo0?=
 =?utf-8?B?N1RteGNJZzNCNjAyODdjeEVydmxRL2lzQXpRQnBpNW5RZ0kybGw2VUxKam1E?=
 =?utf-8?B?T2FPRGNPcVlQZzJOeVpsak5NLzVGTUE4K1JhOTNULzlXckRiZ0wza3JFNlFL?=
 =?utf-8?B?NUhCcU5WcCtOdURLVnJqRGhhZGV3WWpIM0VFMVBnbVFOL1dsUmkxb2p3cG8x?=
 =?utf-8?B?UjRmcmRtbW0wY09yRE0yRFNJcWlhRyttZ0lzdHU2SktuN3V1QzY4YzQ1b2VR?=
 =?utf-8?B?Qkk4T1FvOEFPV0ZnR1pHVUVwOUlqSWdpWml0TEFxRisyRFBhKy9Qc1l3bHdJ?=
 =?utf-8?B?Rlk5UmFiYy9SVm5XTmpHMWJaT0c5enlTcmZOQS92TEkvNDQzdFhZdlRGemdL?=
 =?utf-8?B?dW5TTnkxdWJrWCtPbFNsQTJUL1hUVnVGbU5zR21KcWpYOXhuV2FmdUtxN0NG?=
 =?utf-8?B?ejJlaGw3SnRVMTRyb2lkQTNXRmRxMjNSbXV4MldZb2dvV0tMOEhvUk1KQld4?=
 =?utf-8?B?TDBjOWRja29RSHdteE02OWhLNWxlYnpaQVh6N0Q3OWFJVllVeGlXV1AwZEkx?=
 =?utf-8?B?cDhHK0ZXR2VmcjFYYU1TdEF4T05uc3JmMGo1Rmp4MFErRWc2d1lmV2NKQUlu?=
 =?utf-8?B?RkpabWF2dXpSQWliV3FDMDFBYy85S1RJT2JoVEtubmZmdFh5MzZGRXFPNGxq?=
 =?utf-8?B?U1lpckZSVWp5d2EwUnduRGp2YkY4Q2Fwd1FJaHM2UFN1di9XVzhJYUtOMmRW?=
 =?utf-8?B?UTFHMmFzNkZoRFFvb2Jab2xtaHVkNXJ1YUtUL0dBMmx2YmFVcGx2WkhEUDQz?=
 =?utf-8?B?bHFGOFg4L0FwbWlBSEVtV3RPQmFONEdGMkdFNGVHWURROVl2clJwYU1lb2VV?=
 =?utf-8?B?WnBYNVNYRjlST2pybkJTMlErbjRwZjlyS09lenlZeFpVR1c5OVlqMDR0YS9u?=
 =?utf-8?B?N2JEMWVmaUc0OEVKbFQ3ekZvcVd2Q0tZMEduL1BlUk0zUy9xUlZNZzlMRU5N?=
 =?utf-8?B?RE8yMmdCMlVGeGJkS3g3bnBMaDNSeGJGTm53TkdpRkxPYkt0R2tmY2JGdmN5?=
 =?utf-8?B?WEJCdjA2TEdWVWpNWHR3em5JTmlxdVBTbDRkL1lza2tQbEpVOW5GOC92Qjdn?=
 =?utf-8?B?K1JyTzArMjRXSGNYbXA4T0tNNXRrMlNZK2U5R3BLMUxMRkZINHZVaENKUFpP?=
 =?utf-8?B?dU9zNXhSR0tXR01idmJhUGtzamhJQTZYdHpCOEtGYkp2NUcrTjVINjNLNjhk?=
 =?utf-8?B?bDlmQm1XUlg0bzZoUjRKa3hsbHVqVCthMzN5YmtNS0xtOGtER3lRR0FiNzFF?=
 =?utf-8?B?ZnJrdmdyRjFvZkh3Q2xRd3k2aVZhSEFXOU5BbUMrRmdIazlTSjJZOC9rbGdt?=
 =?utf-8?B?WW82ejUrKzl4K1BrS0UvdHluWWlVUUpwVElrb1RHSnJMWVRVaXVkWDRBTlNJ?=
 =?utf-8?B?VnZkZE4waEtCa2lTMnZ1TUJ0QmJyOExtT2dJeVgweW9GaFVzV3ZydmZkQVM0?=
 =?utf-8?B?WUNCd29COWJBMVpTU3hJV012enVEVENaaUlwVVk4bm9zVS9qYUpQS002WVVF?=
 =?utf-8?B?Tk1reUh5S3BURUF3empjWGdmT2dSSWJidDhLcVpObmVZZUc0NWd2clA5Nmhw?=
 =?utf-8?B?ODl0aDVweU5wKzcwcXRKeHRZUWFseXYrcEgxSGYwaENQNkpERHNtS2k5Qkkw?=
 =?utf-8?B?M3hEY0NNVnZYVDJJUE10UGtDL1ZuSGFxMDZ0TXE2K0hZVytTaURZTVp4Ukxh?=
 =?utf-8?B?MDhmWXBLMkhzOGl2c2U5NzljbTFUcWNMc1ZjR1AyZlJLcEJ2bHpENHhsWG12?=
 =?utf-8?B?NGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1owME54WWFzeHhrdWpXR25WbzRJK3FwYWtOQTJnajYrM3JvVU1nUEtIYTB6?=
 =?utf-8?B?MC9zWkV0eUVLSTF5M2ZCemdxSGxOUTlzdHorbjNMQzRaUUVldVJsZ3lVcTI4?=
 =?utf-8?B?SnQ1ajhyZ0I5bjBMeXpqaG52SW1Md0Ztd09IbjlXYTc5cmNmSnErVU5JajFY?=
 =?utf-8?B?NEd2NzIybm42QkFJVk5MSktDbDhIbkhGd0hRS3Z1ZWVCaUJzOE5tN2NPKzRx?=
 =?utf-8?B?OVNQcktNN2VoSWNiSlZkVkRYYVNXaXNMOXd2ZFl0SlA5MlJsaTNNaEVjd1hx?=
 =?utf-8?B?alc0RmFZUDRSV1NVR01VdURNWXpXejBkOVZXK2hzNy9HL3pORFo3ZnVBcUtv?=
 =?utf-8?B?b2VuOXRZV3E5UDZjZUxaVWN4aWw1a21BcW03MGxubUEzL2VhUXk4TDVqaU5Q?=
 =?utf-8?B?a0FpMENZTm5HcmFaUml5MExWWjNiVUR0UlVwZ2xTVlMzdEpxU2FtNmVWVm9Z?=
 =?utf-8?B?ZElDd0lwL1Y3SGp2YXZsUzB2YXZnUSs3R0VkcG5tTXpPeWllUU0xK3BBU3pz?=
 =?utf-8?B?Y3VPdE5PRmlVZjlKcnBFNUZ5YmZMbDAyWG5DZlJ5NlZCVTV3WHJuSDdaWFZ6?=
 =?utf-8?B?SG9yMzJUZXJxeU5YSkpSNnpNbVU2YlBKa3RxZEM2SDFNeHg0QjRmR3hRK2d5?=
 =?utf-8?B?Vk12ZVhtNnhZVU1xSHl2YTh6aVh3YmI0L3lYU0s3RWN3MmY1SnplVldBeVht?=
 =?utf-8?B?SEMwdDMveWpVeWRJekQzWlVEejlZeWxjaTBpVHliWVFhL1FqdXBXNEdxQWIr?=
 =?utf-8?B?bWNsZDVvajZSZTl0RGpLQUlyREZwckxSeTdGdWVjRVY0VHVYS3BnbFQ2dW1I?=
 =?utf-8?B?aTRzNXRjNEM5WDhlMEo0L2tSejR1cVJkdVNRdlpjeG8zVjNJclFtTkpNNmV5?=
 =?utf-8?B?bFdlSnROMmtKL2dhZjYxZjJGUHlNM3dxR2JkMFJWSU5YTXZCbDZRMk4rSlNt?=
 =?utf-8?B?ZlE5UzluWHNkVm8vMmZ0TXV1RXE2ZVlIYzdqbDVPU3hpTlEydXZMbXc0cXRM?=
 =?utf-8?B?d2YzaXlRSWY5SW51Sm5yODdZT1g3RFhpRUlIMzdoa0tjUEM0UTdiRXl6VWZa?=
 =?utf-8?B?dzY1bUx0eFpIUEl6Rkk2ZnluUDNQN2tmWUE2d1pwUFNlVXBQSlpabU1sZlNm?=
 =?utf-8?B?QmdSSWh6SUlBNkMzdHZzRkNUNEs0U1U0RWQ4VXNTWmFNd2Rzdy91c2w2Q0pk?=
 =?utf-8?B?ZENwMWlhTGZDRU45eEJEY3FSenNUcTc3WmZUM3NHRTd1NWV1WTl5S3RVUkQv?=
 =?utf-8?B?SDJmKzVGMVprclBIN3h2NnEvR3doem4xREErcUJkY0FvaFBvV1krdWI2WUs2?=
 =?utf-8?B?Z2IrNEh4VkxxNGdGdnJSWGlna092d3p6TjZDdmNsb1JHQ3BmMmowSzRqK3hw?=
 =?utf-8?B?SnFmU0tCUVl4M0RjKzZzaUVvM1NGSUI1aTVxOURDTGw5WDVjaDBoc3dqRlZY?=
 =?utf-8?B?Zm9HaFBJOXU2QWlmZC9vNFgyZUdjb0grbytBeDBvK2V3QmtBWUJYZE82b1Fu?=
 =?utf-8?B?VC9mYjloaUticHcxRzNnaHBxdG1zcCtDRlV4QndLcUIreUFtOCtqRUs5aS9Q?=
 =?utf-8?B?VWsrb2c3TXpqbmNqOEZKbUJkSHI0OG04TTFaVkZQTjdGeWw0dzFZRjcwa2Jz?=
 =?utf-8?B?S05mYkdDQjY5QUsrR0M3UHlwZ3pmUXFvZnBxVnRvbGFES2xGQW1qMWlTLzZt?=
 =?utf-8?B?RnJoUld5TDhPUG4vYzdwMjVINlBNaFcwMVZ5VjlSQi9wMFJjUnRIamNWM284?=
 =?utf-8?B?SnVmSldsMHhDUFp6SjFXemhvTENCSVNBYktDcW9nOEhOeEZwZE0vTUdlemFV?=
 =?utf-8?B?c2FlS2xSWFZ3WS9ZNFg1OVdUdSs4SVRNTzVsTExPNDhDQnFTbkdvRGdhSVU1?=
 =?utf-8?B?VFdEeXdWTzJKdFlOd2FIbEN4eUxBb1NxOWV5U0lmREptaXdkRjNFL0FCQnJ4?=
 =?utf-8?B?TEFxRy9yK3BVcEIyYUt5Yjl3YTFWRGlPRnhqaHkwSjdjdHJpOW4yRnZ2QU9u?=
 =?utf-8?B?RWdvMUtNSDhNYkJ4RDB4NGV6VWxmQit6TGVtMXA5UHA5OEs2NWZIS3crbXVs?=
 =?utf-8?B?ZFE3VGZ4Qml4Y20yMnBHREZ6eDd3OFp6MUhodk1JTjJEa2kzcWoxeFNZajla?=
 =?utf-8?B?d21ZMUF2eHBaYTA3eUgzeEdjQkkzbmRzWUlHVS9Zb0hoUFpXeTJrWGprVEFl?=
 =?utf-8?B?dEhLRXVET1VZRU5NeWhZc3dWVnI4OTNVUlV3S3NzTTU1OGxWZktzZWRhTndY?=
 =?utf-8?B?d1JKbFp5UE9iSG5yUWl2Vm1SdUVkaTArd0NlSThlTGRyVWpiWnpBajI0YWRF?=
 =?utf-8?B?bmxMMlhJYXYwa1dma0JaMUtwWkw1dE5MMGFIRXZyWVBoMDMwNHhxdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4b2611-609c-4b0e-38a1-08de590440d4
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:46:33.6458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sm9SW21ukCf29N2PV8n8b/imvO+pX+gHWCbn6c+FKCDo563EDX1I9ozCJUvmNKQXl04Dwfh9dkv6aVyIU97z0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5833

On Wed Dec 3, 2025 at 10:26 PM GMT, Andreas Hindborg wrote:
> Add a `Debug` implementation for `StoreError<T>` to enable better error
> reporting and debugging. The implementation only displays the `error`
> field and omits the `value` field, as `T` may not implement `Debug`.
>=20
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/xarray.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)

