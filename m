Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012041.outbound.protection.outlook.com [40.93.195.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2571F0994
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 20:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770235268; cv=fail; b=uyMMKpRqWQ5Y7DK3G54NVsmKjZXEv/ElS5MXcEhWGHlFO+YqZuxls2kp2P+8q71n66dLW97AZeOxZwBh5TV9w7Xbk1jb0pL/Wfq5j/zuuVRk+ts5M8WUy5Tlo8NtVUKSGNUgjXZfC25E+3XkwxgWsiLOQf0+TffZ2gbxM/ZfyJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770235268; c=relaxed/simple;
	bh=nW003GqKofn4GAZHtjwfhv+XBSxx98uP7AITbHz4E9k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nnOfabk00WqQ9bgOoSoOC9UForxVj3fuPK5WWHpnC33I/jbmpbP1e2pBnWGEjtYFGx6hm2tRHlRpvX0SNMmhQqgloUoB4lbf0md8u4MNSx4amSTt16x7DZKsFgJGMOZlXLHFncNGwii+AuQbPiXCBS23DhnmP+PWbuYG+iQMYN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ujDk7wmH; arc=fail smtp.client-ip=40.93.195.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ujDk7wmH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqPELa7P0KGIdHt7eUz9iTBjZg0zeZfXpIVVHZiLlKcWGG9iu5YzPYbV+Zxcp02ekuwdr9didmMRxyCY7d2+98fiChjnYWcz6WGPoLniHTQuxIdkCQ74BhijJF/lGPVFlKxG3eoARIC06ZrwyoJ6q5wHtaDm3J/guvlBgYwHHIqw+bwbUz9IWB6yjS4yCWHWra7+az+IyNgXpKdWh5e8bLlMUNKUKhvVc2hifdA6wtfQDiV8icnQL+LAfzqQR4uEfCxOFzrGNnj+bvC4OiNQg7GWOLt3jrovHx8nf7ISxnCZ7Zu7B/mktX7FvIAOWYoA9gCL2P/gddEllFu0u+SlQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nW003GqKofn4GAZHtjwfhv+XBSxx98uP7AITbHz4E9k=;
 b=pNCeKz2jqV/xCOU7dXTWpY5FMdQLbwmG5Zwk1Qsbai1X7UN6CLLeZ51V5Ygt1SIuE6+63IPvYb1HFnd3n0Twt01fGikcBOdb3qMtiSQPrTpED+xlz2bkW2MCr6vvZT27WM44wSQR4Kxv1HYhM94BENNRHx5E4317+C+VsuwdER7pJP9Byq/IVccDy2HHE5YeHl9QqBAbWrDJ9k+V1L6RDkd5FRqzCgzEBEGoLZ+dikruBPORZ3aWHR5AhfS1n5jxQO7psHLwgl5fb6FLK2pnzszg+1njTWVO4y/pY5x2Z94us8HOCtvlROzNI3WkOyIbjUp5YOgdZ0NtkU5EMkDwOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nW003GqKofn4GAZHtjwfhv+XBSxx98uP7AITbHz4E9k=;
 b=ujDk7wmHdfhkcSdby/MQ5DOvS2VVfwK3po76UOg15BkA7WqltK6kRN0eSvHiuJCynDt0ikvAyPyJ3vbKLzbMkuMFEG9KhQmkNf/K/XY29kdOkJ/RgRy0RqBhnI5xgJVcr7wO42xMSBr06XNy6rFURBYBVlygqKC23kR139R4VuexXd92k63eI7dD9i3mvhDwuKJJqSLrdqlKXO73KB3vWMGleSqpwF1ggDGI0EPRzPwWV3CqpPhqkQjOU++YG9tuKNGDr21q2HaRMefAjYm1sWum7oUCf39hakPcQuATAMuO246F9yGWjFmSjdwtkW3cWABS2BR6ki6QR5dmRtUFeQ==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by BN5PR12MB9539.namprd12.prod.outlook.com (2603:10b6:408:2aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 4 Feb
 2026 20:01:01 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 20:01:01 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	"mmaurer@google.com" <mmaurer@google.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, Joel Fernandes <joelagnelf@nvidia.com>,
	"dakr@kernel.org" <dakr@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
Thread-Topic: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
Thread-Index: AQHclV8+E+e1YkC4CUS9TNMdRwsForVxyvqAgAEsPAA=
Date: Wed, 4 Feb 2026 20:01:01 +0000
Message-ID: <4ee21ec7f04f6ca31632941889b04eb8e73a99df.camel@nvidia.com>
References: <20260203224757.871729-3-ttabi@nvidia.com>
	 <202602040350.sw6i2Sp2-lkp@intel.com>
In-Reply-To: <202602040350.sw6i2Sp2-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|BN5PR12MB9539:EE_
x-ms-office365-filtering-correlation-id: 4d39fac9-1daa-43f6-072b-08de64281ee9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WnRoeFh6V2xPNC80Z2xNbUFyUDN6c3hjcXczdHluaWJKUGt2SkFocmdzYlNo?=
 =?utf-8?B?NEQvK1kvTzVkRTRzdzhNeVk3T00veGJncVZZYWlyODhjeEZrTkJmdUZwL2V5?=
 =?utf-8?B?L3lDdTVsR1ZXS1VYNDRVUjh5emtQbkQrWitqUXBDcFpWOUdFc3NWcDhreDlE?=
 =?utf-8?B?S1NHWjJNenR4UkpVR0lLVVJ4R3FVc3hab2hzVEgxeWxCdHVFTkpPK01RN0xT?=
 =?utf-8?B?ZS9vbFFydHcxVWIxbDZxaTN5aXNENE1oTlZNRDZFNE1vTmlWWXZCY0l4WUhh?=
 =?utf-8?B?MkYzWTQ1NjR1am9ueDZhVXVhTlYrRy9YU1lONkhWZ3NITmhoNkc4aVdKcnI3?=
 =?utf-8?B?eVhQd2taOURWWjdtcTNLbGVjbFpwc0QrUktEU0NiUnRLeEdpS09ybVNpWEJJ?=
 =?utf-8?B?dDVlSE9QUzcyb2RJL0dKYWxZc0tWZ0xSa1FzdUxLWXZSaDlBajV3ZSttVW8v?=
 =?utf-8?B?aXR3cXJzS2NZY0xoTGx5d2ZwbWkxWWZFTFlwZUFndmFQcld5MVB2S0xaK3ps?=
 =?utf-8?B?eWtJTEFjL0UrVFNWQ0huR09OL3VyaHJSNTZHMlFzWm1tRGtFQ1NjY3l0TFl3?=
 =?utf-8?B?RzhDOWRMQ0k4UVRQQXRjc3piVHFzaE16N2tiQTFnYnRzWWxFMEoydWNQYjNL?=
 =?utf-8?B?am9lOXdHcUFOZWhVVWRjSDRqNWkyNzlFdHJYWWhjWmFLTTJkbE5UY1o2ajdk?=
 =?utf-8?B?UEsyeUVhSlZKajg3SGlHRytwaVNlalRVSTdNVU5UTnRCYjg4Tjg0eXJoMThZ?=
 =?utf-8?B?ZWx4eHpJU3pkcDNJUkk1MkowU1Z0Y1Y4bHNtMzB3WEVTL3RGeU82aHRnZlpk?=
 =?utf-8?B?dVV1Z0EwSis4MW8wNjl0V0lhQjdqWjNOeTBCNmYwZGhCc2t4amdzcXlHaDZX?=
 =?utf-8?B?cTg3cmJMelhRM0NOcmVmQ0NMOG0ySkFPem1XYkpueUpWWStaYUpPZjMwUzFO?=
 =?utf-8?B?aGw1cjVxMi9Zb1dUS0l3ay9GcHlwdWNNL0RrVWk2SUI3QUxIZlpVYlEvcEhq?=
 =?utf-8?B?eTduRWdDMzRRZ1ZTM0RZQ2grY0psOVBvaUFsTEhvZkoyZ0dJWmgvMEticEdi?=
 =?utf-8?B?ajFRbWhBVnFMTDBmQVpXaW1yTXMrWkFyc0JxQVdpQ3hCU2dkZlM5aXRBTXR2?=
 =?utf-8?B?azg1TVhyd21RdGpzdGRjSGpwUDZUenJXMER4bjMwejVIQWFybEMvU3lCdi8x?=
 =?utf-8?B?N2JJZVNDRmNXNkk5dHZubXVRT041d3NjZXNYSkpsbHVpK3UzRzdGMXE3YUZT?=
 =?utf-8?B?bkFTNDh3OERYSGxadzJKQWJ5amZWNWFsVjdjMk5BTmNWQ0s0cjBSTTBhTm9I?=
 =?utf-8?B?SUhnSndsZFRoZm9TcnpZZVFLRVA0Z1l0Z3ZWWExqeTEzUkIxUFd1R0Y5YVR5?=
 =?utf-8?B?elpEUjdLWWxXK1Z5ZVlOeGNZSHNZMUQ0UURUNVB3Qm5vdVVUN09oRkE3dklE?=
 =?utf-8?B?Z3dya3hObFBvOUVTU1BKWmdiRVdKQVl3cUNVb2gxNjdGMlMwSWxUSGxaN1pJ?=
 =?utf-8?B?bFB1cllkYlFuYTB2SldpSjBvNktNMC8wQ1lCelhLRFdsMldxbmp1VS9LVExM?=
 =?utf-8?B?QmNwNWIxaS9GRFBBTm9TVUQ5VndMbStiWGNGemtkbjFSWFpJRThzb3EvVjZs?=
 =?utf-8?B?QTNKbm9BMGJOOXAvVXpzRzJNU3REVkxIL0lEdlhlMXc5QnFoWDFUbUd4dW5Q?=
 =?utf-8?B?QWY0SFJGWlJWWFdZRjg4UzJMajJSUlM1ZjJrQVdYbWRsYVZlcFI4bExPbHZS?=
 =?utf-8?B?dHBUSVpneXJDRkcycVdBWGZaMWwzSUNaZ1Zsdkx2KzZMT25hbWVleE5PZlln?=
 =?utf-8?B?blBodGEzTkxNZGduV2xUVHJ4Sk9XL1BqWmhQUm5TdXVqdklONVNXZFpXT2xU?=
 =?utf-8?B?UEhSYUxJUFlYNWYzSUF0S0VvVVRFay83VUd0KzUrbFdWbnFOVndQUFF4Q3Zh?=
 =?utf-8?B?dnVSdnFiTHpJeHd2VExodXhSaTlEMTltcHYyY3dZVmM0cVY3d0hxZWRrZ1pD?=
 =?utf-8?B?Z2Q0OFlBbUJRMy9pdEg0bUpqZ0FpYU91a3VHcE1vcUFvblpVTURSR1lSM3E0?=
 =?utf-8?B?QVVqTXkwNHg1NllWU2h1dStmL0tUM3c3cnF2OGxlK0dtZXdpYWt5R1hvTi9U?=
 =?utf-8?B?VkFjMXFpQ3lmaGMzYUJvaEp2VVR1T0NTQXNqVGlrQTgyQm1ndWU3ejhzNGFM?=
 =?utf-8?Q?+TUFg/mxFN9PNOWXS2qE2pM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QkFWZEtBUjhwQ3hFY0c4bGFtdHBqZ09YQTExZmhMdnRQR0Rud0VtL3Jnd3Mw?=
 =?utf-8?B?N1ZLWlo1aHBnbVF5TjRZdVRkWUo5eFRNNVNhdnU1UUw5Tk0vSWN2WGd3RE1Z?=
 =?utf-8?B?RTlIYk8yb3AyUHl1Ym0vRXpNazZtK3V1TjFSM2JwY1hZSi9Kbzk4ZzBuYi9k?=
 =?utf-8?B?cnpRWHd1Z0JJbzMxelhMZThVcCtyU0N2OGVnSXVYckZ6MkFzaWF5R2Z1OHox?=
 =?utf-8?B?eVJUekRuRS8vWHIwSWdhSlEvWTY0UkhhcjZzVmI4RTlpUU90ekxvUUkyQlhm?=
 =?utf-8?B?TFk5NXhEMU1TTnVWUnFvT3ZwcXU2Y2R4M2dOcUs2U013Z1FNcithZTJpK0Y0?=
 =?utf-8?B?bkFHbk5jNkZYVXl3Q3Y4MWpjVEJaUkZXKzl6UlJpUCtwQzZ0ajJHZ0pNTFhZ?=
 =?utf-8?B?Q3hDVW5UVmc4UTJYUXB5N0NhcXAzNWttRi85MU9kNUFmdXh4cWZKVE9XMUxz?=
 =?utf-8?B?Z0w2S3lCTkRpZEdTRHZCUHVOdUoxZ0dWNWhzcnJOSy8rODhBRUxKdkdtU3lx?=
 =?utf-8?B?RkVkLzlKN09sUmpHS2RMc2c5S1BaZ3JMaXFzeERzb2Eya1M1TW5mQm5vUFV5?=
 =?utf-8?B?MkVKTXpNaytEMmh1eFZVbWdla0k4NWE2QUs2aXpkaTY3ZkJuUFhhZTZFYUZU?=
 =?utf-8?B?dDRYb1NnUDdFWVUzSTdrNzArL3dUUVFtZzFKeUN2Q0t0bnJCMlpkenN3UkVL?=
 =?utf-8?B?ZCtHamptUEt4WFk2RGNiTVRKQVpsQUw4c0F5UzJTZTNNRDZMVjVmNEVZT0R4?=
 =?utf-8?B?UkdvSUl1S1B5ZFlWNTErZVpzbXpMbTBFd3VVN1VDK0I2cFgzem5ES2cvcVlY?=
 =?utf-8?B?RVZTZGs1SXpoMnJkRktPSktLLzJPRW13RlVSMEo4dkRTN1F0RXdBYThmeU1M?=
 =?utf-8?B?ZnVKSFNnaWxYU0dtMUwwYXNFUjZ6YUp4bWNIbVVHWWNvU3djUWxjOU0zT2Ey?=
 =?utf-8?B?QzZ1WlAvZzVJeUZaSm43WXpTNUo1NGZaWFFockg5U3BqazlLWlp2WFdrT1da?=
 =?utf-8?B?U2RjbXBxMWduT0s1YXU3NE1MV0xjSHNQNVRYcXhFdU1nZnJiWVJDdmlXcVJu?=
 =?utf-8?B?SkdEelUxVXp2b1VQRnl3VE82MldwcXMxSjVEbFpSOEljcVhvNXI5UVI4bEdX?=
 =?utf-8?B?a1BWYzhWL3lpWFJGMFdLMkdOallTOWpBb0NYcUJTUUtTejA0SGg0RWtzRXdZ?=
 =?utf-8?B?K2J2dE5MZU04RTFMU214cXRiNk1DdE5XbEFvdXlPVDJTcXdVMTJWdjBIYzhX?=
 =?utf-8?B?WU5SQlQrbmhDQzRzd2FZcGh1bHNuLzFHajV2YmJEdGljdm5LTFlrbkkrY29z?=
 =?utf-8?B?L3pFMXRZbGNWdXZoMkRqTHBvRGF2VGRoNGVYeUpCcjhXd3Urc1dCTGFLb2ZC?=
 =?utf-8?B?allrb2Q3ZUFsTEx6YU1BTEt5U1E3YUwyRW5BeUFZWGFTd1dQMUhZT1RXM0Rr?=
 =?utf-8?B?bTU5bU4vUjBTd0dkMkx5bHJNNlUxaDM4L3hRbmgvNFhFWHhON2lmdjRFb2ZR?=
 =?utf-8?B?c3Qva05tVXErTGJEK2YzZTYxbnpHTkVDOE15UXluOVBLM0wrdiswaEMvR1VF?=
 =?utf-8?B?YmdWMDFBekZkaUlzNnoyYVp1M0trM2lyRWlsL1hFMVhRbVdwZmMvNVBEZ2Rl?=
 =?utf-8?B?YUxOYXVGY1JlTG1LRkVaUDMxRU9BcGRDZU80UXFtZzAxQ0tBaDhJek5uUjdn?=
 =?utf-8?B?RHp2WldXbUZYRlUxRHIxNnVIS1VvVUk1QUQ0OGl2cmJFaUpuaTJOUXNPcW9j?=
 =?utf-8?B?T2VVOXRvVEsvN2xRckNRRjlZTDdRZ3pGSFdUV2JtMnN2bU5WNDNXODVjMDRB?=
 =?utf-8?B?T3NlNXlBUUdqcDRzajladHBzZUNVUFB6NDJCTVJRWS9UM2ZtZDlJbmU4bXJw?=
 =?utf-8?B?N2VXZXV5YkJWMmlKaE1GejBtQlhFK09JSTNaQjZSZ1h1TkNJTEtZaTIvcjFO?=
 =?utf-8?B?cFFTVnpZdzBkYTdmYkQvWVF4WnRpRjY2VXAzL2FFemVLMXEyTHgyMklRcEF3?=
 =?utf-8?B?RDVwUnpxUk9BNFhMc0ROTUE2T2lNN2QrV01sUllOVUY2OTIyK0VKU0NrZXE2?=
 =?utf-8?B?dlJrNmlKODJYOWlaeGNBSGJTKzZ2UFZCVUtxZkxlUnJtemdEaU9XckxsYTJ4?=
 =?utf-8?B?Nm42dFk5QjEwYnM4cE0zQ0M3OTlXVElldWlab1dWOTMvQWFkOFNHRCtaRk5U?=
 =?utf-8?B?bnR4dmNMdTE5SytFYWxUMEVnUVFJSnJrTXl4R3l5SndCN3lIckZsSHFVUHlY?=
 =?utf-8?B?bzFYYWNqZTkzUDUrdGNnV0puYTl3Y0tJUUpLc0dsSit2OCtzaFRlN1N5dzNn?=
 =?utf-8?B?akJKTE9ITDBLdTFWSjZLd1N6bDkwUDBhK0lnaEp4Ny9LY2pCQ3N4dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2999946D026E7458DB30A9D5EE3ABFA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d39fac9-1daa-43f6-072b-08de64281ee9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 20:01:01.2501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Luwoj3DtZZl45eEVogtuWAbk/KQHQqXnX5rH29u14q+BnRZzuXcpxgsUCmVHogVJ0vtiB6liyxuCKF6tDjrtAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9539

T24gV2VkLCAyMDI2LTAyLTA0IGF0IDAzOjA2ICswMTAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90
ZToKPiA+ID4gRGlmZiBpbiBydXN0L2tlcm5lbC91YWNjZXNzLnJzOjQ3MToKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC8vIC0gYHB0cmAgaXMgdmFsaWQgZm9yIHJlYWRpbmcgYGxlbmAgYnl0ZXMg
YXMgcmVxdWlyZWQgYnkgdGhpcyBmdW5jdGlvbidzIHNhZmV0eQo+IGNvbnRyYWN0Lgo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLy8gLSBgY29weV90b191c2VyYCB2YWxpZGF0ZXMgdGhlIHVzZXJz
cGFjZSBhZGRyZXNzIGF0IHJ1bnRpbWUgYW5kIHJldHVybnMgbm9uLXplcm8gb24KPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC8vwqDCoCBmYWlsdXJlIChlLmcuLCBiYWQgYWRkcmVzcyBvciB1bm1h
cHBlZCBtZW1vcnkpLgo+IMKgwqAgLcKgwqDCoMKgwqDCoMKgIGxldCByZXMgPSB1bnNhZmUgewo+
IMKgwqAgLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmluZGluZ3M6OmNvcHlfdG9fdXNlcihzZWxm
LnB0ci5hc19tdXRfcHRyKCksIHB0ci5jYXN0Ojo8Y192b2lkPigpLCBsZW4pCj4gwqDCoCAtwqDC
oMKgwqDCoMKgwqAgfTsKPiDCoMKgICvCoMKgwqDCoMKgwqDCoCBsZXQgcmVzID0KPiDCoMKgICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2FmZSB7IGJpbmRpbmdzOjpjb3B5X3RvX3VzZXIoc2Vs
Zi5wdHIuYXNfbXV0X3B0cigpLCBwdHIuY2FzdDo6PGNfdm9pZD4oKSwgbGVuKQo+IH07Cj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiByZXMgIT0gMCB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiBFcnIoRUZBVUxUKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0K
PiA+ID4gRGlmZiBpbiBydXN0L2tlcm5lbC91YWNjZXNzLnJzOjQ3MToKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC8vIC0gYHB0cmAgaXMgdmFsaWQgZm9yIHJlYWRpbmcgYGxlbmAgYnl0ZXMgYXMg
cmVxdWlyZWQgYnkgdGhpcyBmdW5jdGlvbidzIHNhZmV0eQo+IGNvbnRyYWN0Lgo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLy8gLSBgY29weV90b191c2VyYCB2YWxpZGF0ZXMgdGhlIHVzZXJzcGFj
ZSBhZGRyZXNzIGF0IHJ1bnRpbWUgYW5kIHJldHVybnMgbm9uLXplcm8gb24KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC8vwqDCoCBmYWlsdXJlIChlLmcuLCBiYWQgYWRkcmVzcyBvciB1bm1hcHBl
ZCBtZW1vcnkpLgo+IMKgwqAgLcKgwqDCoMKgwqDCoMKgIGxldCByZXMgPSB1bnNhZmUgewo+IMKg
wqAgLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmluZGluZ3M6OmNvcHlfdG9fdXNlcihzZWxmLnB0
ci5hc19tdXRfcHRyKCksIHB0ci5jYXN0Ojo8Y192b2lkPigpLCBsZW4pCj4gwqDCoCAtwqDCoMKg
wqDCoMKgwqAgfTsKPiDCoMKgICvCoMKgwqDCoMKgwqDCoCBsZXQgcmVzID0KPiDCoMKgICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHVuc2FmZSB7IGJpbmRpbmdzOjpjb3B5X3RvX3VzZXIoc2VsZi5w
dHIuYXNfbXV0X3B0cigpLCBwdHIuY2FzdDo6PGNfdm9pZD4oKSwgbGVuKQo+IH07Cj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiByZXMgIT0gMCB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiBFcnIoRUZBVUxUKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KCldo
eSBkb2VzIHJ1c3RmbXRjaGVjayBkaXNwbGF5IHRoZSBzYW1lIGRpZmYgdHdpY2U/Cg==
