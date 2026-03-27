Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11022103.outbound.protection.outlook.com [40.107.200.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C803F7A8A
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 14:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774622261; cv=fail; b=QHePHA7coAgqmJ7zFIr9oyTMVH8Xb12zukKs4M05PClbMb+gV2xNyOl/Ch49VZd/UAEeDGlcP4mFGFVm2UFPNeco8CtrL9y2v/10BJMf6kPQ1nFQ0skLKowRRJ0Wnhn+Rf136Mn0CcnGa91ld8/pG8KfvFRWXhNl5zVW6hQwrCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774622261; c=relaxed/simple;
	bh=QbIUmVlH2sr/N3mLWjBHxLXESpVcH3k/D1KmBMVfO1w=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=r8/n/saD6cyQi4UN6j/0h/MovBMpdF4ywqz3S0K6HjsZvwdFXCIn7QBU2N8mHs6HxwucpC19Qm+LIFtXOPCrc5OKGTT3jKf+y3SyYP0dtBunC5HWW1ozDUZvmG8ysbKG9rmwS//iy++LukxudnzlBglZB0e4iaMNKROpMozNug8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=fail (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b=bHHiVewM reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.200.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b="bHHiVewM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uld6DcwjEir7edYLIAIQuWk8Ia7dlJdccRwl/lPsOxg3Vkw1R5OTrpu1reJN+Ntepzk1x1ndjv/tAM8NN367gQm/K1sehFUX2Ctun2oCjvXoORq+Q8JbpvLCHMozQVDeZ7KfqYaj41HsYXmPGajQQoQlyD5eZ77w4VduhvnX39b/HPcC2UtkhirevAxpPRjaynxJuFpwB9d9hYcCEJaBamt5bYximeuumkauwdCQiW/wZq5hI9w3ILal+VdwYwUp7FYIk90X7JCI5Ig1+UI4KLaM89fUTu7cAj8xvK6KY4sMyH478crFENuz/KHWd61mzroGRNPHj8dFYA08qdxjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuaSNwenDg2HWE8m4Yz+PpYr9PIhOhKPvISwlHqOFw8=;
 b=FrP6QyH6rPh+Pw7aOaccIlgMS3Mv7iqvk+faprnR7/CQNztO1XGj4vC8+bMCAvMk2h1YrBNR/fA+agud/tEtKlW5GV5/Rd7yN/8pM+0KB33cCzTucLTacOg0ve3GbU4IwT91zuinj4i7hVfWW+6ou8XMmUPA28WaR+aw6dzBxwMqJAugg5uQRsGD2YjJvlhxYI5g1vGCenPPEUVIW/oFdc8y6IndsFveAnBH0IGigGcJMy4VKeQc5EecPtOke+2VqXErDJkg9dmea04u3chyWXmjnCUJ8pbcXz6EeYnrZyIJECVwyqJYiYmgF9+Ia3h2Ln3a3sfe/cPhnuv8VAJm3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuaSNwenDg2HWE8m4Yz+PpYr9PIhOhKPvISwlHqOFw8=;
 b=bHHiVewMHgmZSFj75Ua7uaViSvYv88czZyX5jKwhCd2x11lTw2gS+jNZkVz62llbqUA99kwcHxjUwi1DEH3C0LDwUwG7PoQN8HpQRO/Qog/CK5MR/Kk/ibNfrOOnbTfTdvhM2dSYJBczQjYlkCV5w/jg1jbbQFTzZo0QofJ3qVo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from MN2PR01MB6110.prod.exchangelabs.com (2603:10b6:208:15a::15) by
 CH7PR01MB9003.prod.exchangelabs.com (2603:10b6:610:251::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.23; Fri, 27 Mar 2026 14:37:33 +0000
Received: from MN2PR01MB6110.prod.exchangelabs.com
 ([fe80::b9f8:7d6f:a89f:7180]) by MN2PR01MB6110.prod.exchangelabs.com
 ([fe80::b9f8:7d6f:a89f:7180%4]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 14:37:33 +0000
Message-ID: <34796d72-71bf-4414-8352-47258fd1d700@amperemail.onmicrosoft.com>
Date: Fri, 27 Mar 2026 07:37:31 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: rust-for-linux@vger.kernel.org
From: Greg Rose <grose@amperemail.onmicrosoft.com>
Subject: subscribe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0343.namprd04.prod.outlook.com
 (2603:10b6:303:8a::18) To MN2PR01MB6110.prod.exchangelabs.com
 (2603:10b6:208:15a::15)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR01MB6110:EE_|CH7PR01MB9003:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c032799-ef19-48db-5904-08de8c0e61f2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|18002099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	e2Ak5H6wTFtKg9tWSgEYd5Zib1fuKacftEpoUl1omCVZR5ElMBmyya1uci1lFtYXOMiCYTyfQ4M8f7I7agbblgpOswdlxVSy/YtTLkQVz7QPY+t5M5yycBv1nN3CUFfxIGFAgPkS0i6FzDJ1atEzyapIvKp4IRW1EDRzzzD6HgVNtMk4iFbIqhKNe5Rg26s3xekD6heod+Fm9BFb/e/YiDiwCcWS3Cfm9L/hczn/JOxziJjS7fvYUNMzjolgl2aTevPWK+gfW7doBz5kpb9fP9dy3hr87MkY/pj0yN13/rkMi6nJdxER2v2IQKzRfb9Q0Yg0IZKWbRoykxOkMriwsY2mhttEVKEe3DqvRm/RQBwx1NMceUuOleWfCy+twl3L/z3esTRAAmbA+J8PInJbea25FVpGh0OxRU3Vr/HB2i7J3HibR4rh5xUWexYTyNIwFv9nE/R/94/WsmkUuIkeIMlgJjucJ92s4htA/jg5SVHJtq17JGsoq9x5bB7fo2ulMoiVZf3YY1p7nqo7mUQDuLIitXNpjbqz6o2c8OJHUScKsWsSmAij0rwSGdD3ngxD5M+j9i9tnMYgki6WyVUIbv+etd3x/UYaH7ycztj+lNwF6NdMWTPGIrU5zcV0W+lCM10sUHKwGDTNftPN52hvPdnGUo24ZoI5ApkUNUXBqzyohyIq4B1sYL0hhD0DNPczBKFDhNqk/KqwYe8DXPM/NYtESYzGGkk7A3/PDBGjEPM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR01MB6110.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(18002099003)(56012099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkFjR1B6bk9wM1hzYUs0ckpIc0E4OHNmMlJrWXpTVEVXaHZQUHdwcXRsWEs1?=
 =?utf-8?B?ZG4yNnJ0U2tYRGxyWXpPcE81aVhqNEJwUkIrNGpFUmRKdVN3OU9md3ZzV25i?=
 =?utf-8?B?NURrMy95UFhTakhCcEI5T0lxamNQRnFLdkVwaTNaOERGVm9ibStCaWpzeGZx?=
 =?utf-8?B?L1J5UmFxK29pcGVZTXF0OUxkdlc4SGtyRTA2TjlzTEd5UGdkUmdIZjl1Zk9C?=
 =?utf-8?B?cnRydWQ0Y1dRaWRPZjRtc2dCSEtTbCt1SDZidVlJTGowT1U4Zy8rdGE0dXVy?=
 =?utf-8?B?WlpZNTlLVFlEMkJ0ODNUTzNWRjRXellJTkRISGtxTGljQ3RDRC9EZ2tPZC91?=
 =?utf-8?B?YUtES1hycHBJWWNxcncxVzk5VHF3dnczRjd4OGZKMFI0WWJRaklZZTQ3L1FR?=
 =?utf-8?B?TWxvS1FoaEYwVUZodkFuWjRXWjk5UjVnNDIyMVVZZ0puVmNJNVBGR3VrcHBr?=
 =?utf-8?B?NmNNSFRNY0swajNJYktBR0VqV21Ha0ZsWXpWZlJkREd2eUVRb29HUUVLdnZ6?=
 =?utf-8?B?aVorNklGU245MkJQbGZ1M2ZJK1NsQS8zanZlSGZvQWNwRmphbi9XaDIycUM1?=
 =?utf-8?B?UWw3Smt4M0JxZkFZYVRMT21Hb3ptNDMvUkJCandXdTdDUEdNZ282VmZTWCtO?=
 =?utf-8?B?TEl3aG1NaUtMb1M5WkZiSHFYMHh5NU5OMHUwSjhmdnpkVWZRSFRid3lvaDNT?=
 =?utf-8?B?TlJpc3V0WEIyTnd3ck1XWnVOOENHL3ZEUzluOWNmNTFZeGZpRm1RMDlVdzFN?=
 =?utf-8?B?aFpWV2NJbVNSaFpWZFFKZlh1Z3lxYUl5c0pyb3lmdGdvVlRsaVUvN3lJV0pl?=
 =?utf-8?B?M0E2eTg4S3pnckd4MEhzNXhEQ0FjaE9UTWJza3htTFJEMFU4S3RxQVpEWmJJ?=
 =?utf-8?B?dFZSV2NVVlIxTGM0Vk4zU2syWTFOUGM3RVVhRmVVTWF6Z2c5R3M2RFFDcHlW?=
 =?utf-8?B?WDd3cHhDNXhIV1hhaC9hTVJzSFZzRWRZR1NuenRZWDQvMDQ1dk8yR21xUjJR?=
 =?utf-8?B?dGNSc0J2QnRxdTQxdHgrTU1KckR0ZHo0cVJxc0FCZkdUSXhHOFVRekJCWjhn?=
 =?utf-8?B?TjBWN04zK3Nla1Q4U0hHYXp6azlpQ0hYTHllSDVKWWo1TmN6TndQY25mZjRk?=
 =?utf-8?B?ZWFPeURPSkVZMkhkZjA0ZEQ1R2piYVVURVFUc1BLbGJ3YlpYa3hucENBeThN?=
 =?utf-8?B?YVRGWjVQVVd1UWpOZ01iYmR4V0xicHVnMFQ4a2lua2pEQ2FMSVloMVRQTnV0?=
 =?utf-8?B?alJxNHNjY284dmwvZ2ExNFkzdWxjeFhjWlphcktIS0J4RFRhYTFXSzZEcE5n?=
 =?utf-8?B?WlhST1JDbGF1cW5pN0xqR1B5K1Z4T0U1alI0TG1kbmx3RjQwclRBKzNOVmtZ?=
 =?utf-8?B?VVVLUFZFOEJUSDNORnFQR0hSam1ybUJSUXhCaXhKUE9RWUNBM0hPZmk0YUVw?=
 =?utf-8?B?Sit1aWp6dWRlOFllTmJ2N3B0UDVQcFhaaDlOSnd1cWJacldMS3MxLzRVdkVC?=
 =?utf-8?B?RXh4VEEwUHZEcC9RS3phMElNaWFRNmpzSU94alBXdWloUmREOFNzdkVwb1Aw?=
 =?utf-8?B?VG5BOXd6THN3Q2FnY1dHWjZsR1Rzd1B6bGoycUVUbDlwcGc4RnJZMWEzVWpq?=
 =?utf-8?B?ME9PT1Y4K2JNSXhiTW5sK0sxOTA2RzZvTndpbjN3ZkxGakNwSU9uU3dIV1Bu?=
 =?utf-8?B?bGp3VzdBWUZhUmY1WnIyeHMvaWdhSlBXSlJoa1IrYXR4VFYrcjBnU2hrWFUx?=
 =?utf-8?B?M2wwRjZjTzNqcXFCaXBTMENIcVBaTlpZS3dWQVpBMDdkUkRzcHJOeUVUQytQ?=
 =?utf-8?B?UG1oMkRlRTNhYzZ5VWR5c3g1aHZqWlowdHRETmNlRENDT0ZBMTV0Y1lnRmsx?=
 =?utf-8?B?dmM1Yng2VGt2aFNLaWVNUFNKSkVneWwwQ1FXQmp6U1RHLzBRaWRMS0t4UUxC?=
 =?utf-8?B?S200V3ZvZUpnVUFwYWZrMzhrdjcwalAxdE9OdWZiUGNpZGNrbWFjdzhTazV6?=
 =?utf-8?B?ck1tQ0MxYjVnOEFIWmNuZEdmNnhDanJoODNJVnZaeXNGdFF5LzdqRFIyQmpX?=
 =?utf-8?B?d2N5SFVFSURMUG5JY3V6NVJweG4wSmVjZzlsa01EM2wzQW9YUEFwcktFNDhy?=
 =?utf-8?B?NjJKSTVnOS92a3R0dzJwWnJ6eEF3YW9SMDZSTHh4VjNuYzIveFV6WE93OWxZ?=
 =?utf-8?B?Ui9DcGhMT1ZUbzhrdm92cXR2Vnh1cEdhVXVZeFAzNWN3Wi84MGNmM1BZYkhO?=
 =?utf-8?B?OFdZOHJoU2U3dXBWVTc3NG1YRXZwNldFWmFIWjFjTzN0QVQvVXVHb2JDSVR5?=
 =?utf-8?B?V0JrL2ZmekVZZGZ6VmFHTE9BZjlFTWYrZ1FtRkFGMStkS25DMUZLbFlaTmdw?=
 =?utf-8?Q?STTiqg/J4McdBPLxKfAoXjB5PGKgpYiWOKeJ4h5fd4NT3?=
X-MS-Exchange-AntiSpam-MessageData-1:
	uRa0z0dvtoCXcQOToZUqXoaoJJyLspPWgbQmgFKglQz06YiDyuqAVjzI
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c032799-ef19-48db-5904-08de8c0e61f2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR01MB6110.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 14:37:33.5793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZiQvwa6c42G2pSzk5/YdHsJhji5pbd/3ixuo+YfZa+zYFQkWRYURVAsYYRqruhxlfOCAwXonpWV/xZpQ7WZUaEqJIgAv36BM2jNz/wUXCrwEKUNMi5jCEf/kS5AI6ZWL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR01MB9003

subscribe
-- 
Greg Rose
grose@amperemail.onmicrosoft.com

