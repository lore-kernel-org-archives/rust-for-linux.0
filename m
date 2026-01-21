Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020073.outbound.protection.outlook.com [52.101.195.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2AD2F7455;
	Wed, 21 Jan 2026 16:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012165; cv=fail; b=bilTS5JYP3JfSPxlhQKMulQMyBmp3p5lbWIf1gOXSYJkf2B75m816rrwWYb2zi48pigfB0qVT60wTdK02u67VaWiPmiAUnycee0q7/b9fAk8H40LdRFDUgbk77p/BpsHYFaJ+3MmH7v6Q5PdCcxZv+2TI5WaTiquta1JonHLuOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012165; c=relaxed/simple;
	bh=kiDk+x8/G3421BS0YRjovthiFOONIOfCtcUrWGUSj7Q=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=dOL5nwu+YUq1W8kGuqXQfayrkzTevvzzduPwShsQhlXeWuHErXrp+Ge+TOhgYKEGL0QWhnvG4jcadR16zvTttoPDh8iwnYjCo+Q5VuLKpp39NsyrHjxwn4UlDipapwvbWSzEmkZkA/cFhSWl1h9xgazeRM84XPkdG4XWybWptjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=injnGyO7; arc=fail smtp.client-ip=52.101.195.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="injnGyO7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBdyXxF79B5W3Kwpdyd9jqULgVSvDH3ES7rpQjjc0/JME6fV1mpLicpXwfstFjgpHEJrkq+rauSqq8CXBVb+8lY82fK87uKztlxmMsqgHsTu4pJFCL4o/95weHmnO5uMFTUCNXYP47okjlfbXNFJHmdH8NgWt3/IMaFmsfMk3iU5GmqplDPuNgcu4UO1HT8qYbWEgGaHxUkjBScao8tFsIoVtke3bfHo11Q2bbMg2Hm0d32HjrVpU2l3vQaAzqxVkCFqQDWWM9b6XMZGdZbRsg+AXoYU1NuJmIT2uE1DYFL/rmpsbA/+dxCq2VdKxIwG1e3PeLxSRiRT+E0EuwnR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X021feX5Yk4MHgcTF6Wi5/N/UF36p05Jj9eBPRSwcaA=;
 b=haUcEFghxfbFUlW0eKqLm18c2yReXYIONRNNHhJVCf/b0PL1WF2JF2mtu3XRSevJfvyfaEHdSkxHjvulAJjBEWf3qTpGOIFOT71cTe0IQBoEA11DAbsu75BU8l9qeF2Zm/zzd/olHmoM2EEvtNc4/czKBYGgdHw7DyogBK/vscEyHUiyJo18NakMwY3Sl6q+vGEeLcKDrtRJGizXvQpRxrEbTCbbvcgCbcQ6k6YPyoy8JUSR+skqQ5khrkX+Xh/EfrJ4GH4ALxhV71rWpzHEq5R9oMogPhRsoVuCSQkqDAxJ/aXp14UKEKUfNk1YYJ2f5nw7llOZLJOEFP0gqqmSRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X021feX5Yk4MHgcTF6Wi5/N/UF36p05Jj9eBPRSwcaA=;
 b=injnGyO7YdEwWb52HkjxyqgDRdd/jULlWWfTMzv4fOgvEE/Pq8OwYeSW4tMYDlxhjXlLlvs3PAev/6tV6RamMnEMou+NqkhQRFSPiAqNN/4VEmNYTdd1ljyDD2rL16As2EOrtSYlRRH82l1GaQVe0K0EtAuyTep4Ejfs+NVLThk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3318.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 16:15:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 16:15:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 16:15:57 +0000
Message-Id: <DFUEH29UJBR9.1I03EHD1ZO88G@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 21/31] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-22-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-22-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P123CA0113.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3318:EE_
X-MS-Office365-Filtering-Correlation-Id: d35ffa1d-853c-4f39-0ab3-08de59085ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHhXWDB0YVhQY3BuNUJpM2tMM1gzMkxUektBU3BlbHk3RnUxWHlFSkxRQlgr?=
 =?utf-8?B?RENyVG9sUDFPTHFXVGgybmxjbDhzQi9sNlN0elEzbk5pcng1OEhnYXZkQnBn?=
 =?utf-8?B?OTB1OHo5S3Z2Slc3VCsvWUU2aVZLMVJxaGp1S3d5L2Y2Y1hsakRwSWE3NXRD?=
 =?utf-8?B?LzNzME5vdm4yd1R5anNtNUpJQzUvR3ZEeUJ5REFObVhVeGtvclhuUmFqd0pS?=
 =?utf-8?B?MWh4QkptUGJKRldOMG1FVzNvN1RaNmU5bWQwT3k4ZFB5T0tBbmpHSUFnVFRt?=
 =?utf-8?B?RzBJK2FSWHQ2VGZWTWNuMnRrTUJBQTF6T3QweS9yQm9CRVpCWjVxQ3ZDekVX?=
 =?utf-8?B?RWVUblBVREFGelRqSXIwT09vd1VZUDJ3L1dpTGhlYXg5WVlYTVA5MkNtRk1s?=
 =?utf-8?B?ekN0dTcrbzVOUEROVXMxdVFwSDRWZm04K2tkZnJsajBpNjlOTSttdzl6d3Nk?=
 =?utf-8?B?L3J5Z0xjUU5JSUhkVnhVR09PNEFtRDVyeXJWU0c4M1BWa2E5Zi9FK1hsa0I2?=
 =?utf-8?B?NWw5TUlpRzlJczA5emlBU3R5dDdWRzdhREVtTWlaZitLemRnYTJlRnEzWE56?=
 =?utf-8?B?NXVacS8yS1U2aFAzVmRwRlM5MFhrTEM0ZUNXa01QeHA5UDhKaDRtN1V4NFlF?=
 =?utf-8?B?L0luNjBpNmlwcE1xbXhhbG9MZ2xrTDZ5QnVESVJZVjkwWlk1MDYyVFlQZW14?=
 =?utf-8?B?VHFFbFpOVDQ1UVExZVBqSWl5Wi94L05Hb0tBK292QzFkT0RidnIycmE3WnBq?=
 =?utf-8?B?ZXV2UElGLy9mRFR2NmFLUVd5WDF2QVpQa1YzNHFuMS9GSnBjd3FlQTRWNkpY?=
 =?utf-8?B?eUVySzBFUXBGN3RYM3ZwdGx3TjZiaDhQOHhPMEM3RWE2TUhnY1NGQkZGdkpN?=
 =?utf-8?B?U05MMVdlVkU2TW5hK0Q1Rnd1bnZSRjk1cVRubGJ2Zkw3QXFBRk15Zk5kSi90?=
 =?utf-8?B?SnBHYk53ZzNwS1dhN1U1SkxuZWJpSW5hR0xZUzR0NXhhNHdOUzFZK2QrL2dO?=
 =?utf-8?B?M0JiQlNrQWozWGpmWU52TDgvRGdwd3BhRUF0MUlIbWVhZ2N6QitFMEZjREVB?=
 =?utf-8?B?cXJacVdyVFpYWGM0MHVmSitNdGFzUUtzaWcwWHQ4ZTRpdVRvQWI1QmFmN3dy?=
 =?utf-8?B?eXVrTmZraGc1ZEpBRUhjajhFQnZVOVVsT0lRQ0RJbC9wMjEwVHVKdHZJeEtv?=
 =?utf-8?B?RVA2aWwzanlBcTlxajlKSk8wNnI1LzByMFh6VnhSYXRtcDVWYW9NUzJGM1Rq?=
 =?utf-8?B?WC9FbHVNblpxREp3UXpKenRwakdubWtqTUUxL1VOSmkrekVTejBDWWpXcjg0?=
 =?utf-8?B?ZWlGN2F5T1ovaDA5OWgwSmw4QmdRNXB0WDFrOEd5THF5NFZHNCthL2Z6WVlW?=
 =?utf-8?B?N096QUtUVTA2MytGWlFPQWN0QVIyTlJ5T0VGdUdUUVdteGM5QkpscjJsWlJx?=
 =?utf-8?B?NUNURkdPTDBRc3hSMUJRVWEwbElqOTViOVF4bXBKWkpSM0RpME9RYm5EZU9q?=
 =?utf-8?B?Y25yRkxUdTNsai9xNEZKMFhVT3YrNzhwdjljZUN6ZzdlNEpHRUltdFdVdjVN?=
 =?utf-8?B?TWNOcENnOHBpRC9FZWpIMVlmSlFsMmpXL1ZrOUlsdFVDb2IyNUptdis5Q1po?=
 =?utf-8?B?alowb2dDaHpJR2tYYTYyMUlSVlVQNTh1d0V6cVRWc1crT3ZnMGY1ZTNkT1dI?=
 =?utf-8?B?MU1OeGtZN3Rmd3h4RCtwSDlvL1pJT1IydklXMDNVNTZPUUlCT25VODZOVXJh?=
 =?utf-8?B?ZElSQ0xWTWZnS1BGc2VCSlZNb2NzWDR5eXdnSm8xZFlFQnRpaGd4M2NNODE3?=
 =?utf-8?B?MkVqQ1Znc0lPL2tQS2ZkT1grRTd6dlZkZCtHVlQ4MTlCQUJhYTZzVHJ3T2xZ?=
 =?utf-8?B?cWJZTkgrYUVJWTRoTGlQTTlueFh2M3JFM01mam1IcGNBUC9qbTQvQTBLdTAx?=
 =?utf-8?B?dlZtUThnV0szdTFreUZDekJNRTJjbElQVCtDVWd6WElPaTl3bnpvYnRiY2FB?=
 =?utf-8?B?WWhIRnJINWFhQXRqSGhiZlEyZXdNMkd3aGRUZkZ4MlVWbGhUR0EwWFBNQzMr?=
 =?utf-8?B?TTQ2Mk40RlBqcmtMS1BWdC9TM1BWcHVmQmVGMWtHR0N2eVIxSkViVk5nVmVL?=
 =?utf-8?Q?eNTY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(7142099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWpnT2hGSkhsdGYrQUNVVFVxOHB5RGh3WUg4eXBHWmY1R0Z2T1U2alVTQkxJ?=
 =?utf-8?B?bmV4V1RMQVYzd1hFbFVYdlN5Z3JMd0VUSFJNWmZMSXA1b0V4SGdTcmxUV21R?=
 =?utf-8?B?cGlpL1pIRjhTUWEyTFpmdVFwQ0JUckpQSDJNZHFzS2tySFV6TWowTUl1TnRB?=
 =?utf-8?B?VmNlZjdYTHkxS0djWjd3MWtKMWJINDMyWU1DbWNuNzJCY3RWczFnTkRteUN5?=
 =?utf-8?B?SHJhU0E1RFU5YTYvZG1rcm5MYUpLZno1WWlua2c0aXUvQ3Rha1NSQUhhL1ox?=
 =?utf-8?B?TFlGaEFZb2JZdnRTQ0cva0tZeUlsem52TzNkZC9SekVLWkpUZHpVY1B0TDR2?=
 =?utf-8?B?eHVqQzcxOE1GcFZsZzRpQmlldTgyWGQ4d0xKbDJPbHBrRGEwV203dm1OL0Vy?=
 =?utf-8?B?TnJWdk9lT3JDV2hReFczU0ZiRnhyaFVBSXczYWdlZXJxK2YyMUd3TTk5TUM0?=
 =?utf-8?B?bGV0TjkzZGo3UTZLQU4waXZQREhVM093dHpaWmFZcmk5MTJLWU1Kb1NqSnZt?=
 =?utf-8?B?Q0xvUFp5SExUVlV2ckw0bDZWUnAyR0FURUlyQTloQi9IaisvaXNpdGJORFpk?=
 =?utf-8?B?WEs1b0lmVXdLRndlV0VIYlBVbU0rem95dVdXaDVZSFRSdDE1S1ErbzMrRmox?=
 =?utf-8?B?MVdhKzNMOFB5bkdHeDErdHA0bVQySDBFd20zWjFSNFRvZGlJWEdTd09NcG16?=
 =?utf-8?B?dk9nLy9xL3J6VEN4dzlFS1Y0dXZ3TXpBTC9qR3U1c2RvYyt4eVVxeFF2OW16?=
 =?utf-8?B?QVJMcS9GZGd6UzJjNEhqK2NCc01Od2JzSWNFZjBRb0lNVEJtUHhmMFBEbWFR?=
 =?utf-8?B?dDJ1N2hvUk1vVEtieU9VQ29JeWI3eUJXQUNoOEY2N1VmTm5EMUJZcVZlOTRX?=
 =?utf-8?B?UFkvcU1Fc2dWU0VMUU41VURIbllCZCt4SWN2bE5USDJKQytmekVpMGFkcExC?=
 =?utf-8?B?RDU4MGxQbTJaMFpSL1Z0QWxPQ0ZCR1FXeTRLR05VblJXdGkvK2MrUlhFRFlq?=
 =?utf-8?B?Y1BZRHhYOGFUVUNkdjBNdjh5Z1ZYdWRBQTU5MEtVVDBzeHNhVkdDdy8wMEpF?=
 =?utf-8?B?SlI0L0x5ZDgyb0FOTHdkOE1NbDRYOTlrbkozTzkwMVhPeXc2WFo1Rk9uQk5Q?=
 =?utf-8?B?Vjc3YTBGR2Q3cjlWeUNaV1dEWG1EMzV1ZWNjeUIrMnprUzVNOEkva1RSc293?=
 =?utf-8?B?dklNQlRzMGFyUis3bnp1d2UvZDdXZzR1OXI0Tk4zM3NxZWNEM0srSEZyOUdp?=
 =?utf-8?B?Y21uWGE1Z2tXbmZiYWRIZURUWmRiUjhuSmVUYmdudEVRc0R6ZHBjbkNkNU5o?=
 =?utf-8?B?d2R3NHBhLzVSbDlpNzBrZnBaS0lVb2JZM3IzUFR0YnEvMFF0UWpXOWZqVjFa?=
 =?utf-8?B?ZUY4QlY4eFRBNi9LY0lFRDZNa3djL2pvVVoydDJab0h3WXU3OWMwVExqUlZQ?=
 =?utf-8?B?MEV5dzZoMGNmSDNhdGxrOEt4N0hsVThKbXloZkxtRldMSTNvVUNWWjZ3VTRD?=
 =?utf-8?B?UHlNOURuZ01HS2ZxY2F3YjhPYktJKzdtcmwyTjUrWndscHE4T3k2Sk5vdTJW?=
 =?utf-8?B?ZDN3WkdjMXpQaGw2UGJoZkRpUllVY3BFMm9adGFxckhVTE1tckY0M2dWR1Iy?=
 =?utf-8?B?dS9BdVZKazVPdkx0NjlqK0pCem1SWk9IZXlvV1VyKzYxZVo3enFzbnRGQUw5?=
 =?utf-8?B?YUY3K2ZSZStZR0N0Qys4SDFNampCa2RETnN0TlBub1lMYVI1bCs0QUZaWDJq?=
 =?utf-8?B?YmNQQkxESnc3N3VaUU9NVWFEci9kTnRWSGEySDZyeDdtU3hVWWhIVGdZMGRk?=
 =?utf-8?B?anE2bWdPbUNzR2dxYWVjb0c2STNralkzamFCSVBLRzY0TE53OE4rVjBHUzBm?=
 =?utf-8?B?dmkzWE5aVFZWdi9RTnNkZWhHTnNTSVNsQmlIdTA5a0pFcWZ3MnBlemZBS251?=
 =?utf-8?B?aFJUSE5xYkhRK0Zpb3B0TDU5YUtpbjB3RGg1aGk5UzlXWm85aXI5UUFocVJI?=
 =?utf-8?B?NXJrUlRROTFjS3ZBeGFXUTJtcnkyNWlDMTB0SE5KNThjYlRaa3MzM3l3Tm14?=
 =?utf-8?B?aWpZajladC9URlVhZFV3M04zeVcvN1k5ZXMzcGQ5NXllQjJlUVI3QzdudWFX?=
 =?utf-8?B?MWR1aW1pMmFFaXNrM21uUzE1ZG55UzY0bEI2aVVLTGZqNTl3VUplK1dnR2pG?=
 =?utf-8?B?cjR5eFcwRDRXZ3NJZnFucUk0blR2b010NHM2NWs3RlVpc1AyZ2hIc2wxV01J?=
 =?utf-8?B?QUlEWEZMWTIySU8wSW9NZHF4WU9PWnRZZkpXaEd0TEMwRmNZakd2UTA3bkJM?=
 =?utf-8?B?Wk8wcnE2ejBacVd1cmdkWDlHSnkrQmg1TkVnZnZ6OVBlVDlSbFlNUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d35ffa1d-853c-4f39-0ab3-08de59085ccf
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 16:15:58.5519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBT1rg9SbKdbfTbtAcKnNdE/rCTv1GjiAVkZBZYTVS5e2/PYhNCE0TbICCDIjDDX6tUN5wzQGwVwIGpydGWN+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3318

On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
> Add extract_fmc_signatures_static() to parse cryptographic signatures
> from FMC ELF firmware sections. This extracts the SHA-384 hash, RSA
> public key, and signature needed for Chain of Trust verification.
>
> Also exposes the elf_section() helper from firmware.rs for use by FSP.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs |   4 +-
>  drivers/gpu/nova-core/fsp.rs      | 104 ++++++++++++++++++++++++++++++
>  2 files changed, 107 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 5cbb8be7434f..7f8d62f9ceba 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -23,6 +23,8 @@
>      },
>  };
> =20
> +pub(crate) use elf::elf_section;
> +
>  pub(crate) mod booter;
>  pub(crate) mod fsp;
>  pub(crate) mod fwsec;
> @@ -419,7 +421,7 @@ fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Op=
tion<&'a [u8]> {
>      }
> =20
>      /// Automatically detects ELF32 vs ELF64 based on the ELF header.
> -    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&=
'a [u8]> {
> +    pub(crate) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&=
'a [u8]> {
>          // Check ELF magic.
>          if elf.len() < 5 || elf.get(0..4)? !=3D b"\x7fELF" {
>              return None;
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index 389c43bfd538..311b6d4c6011 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -256,4 +256,108 @@ pub(crate) fn wait_secure_boot(
>          })
>          .map(|_| ())
>      }
> +
> +    /// Extract FMC firmware signatures for Chain of Trust verification.
> +    ///
> +    /// Extracts real cryptographic signatures from FMC ELF32 firmware s=
ections.
> +    /// Returns signatures in a heap-allocated structure to prevent stac=
k overflow.
> +    pub(crate) fn extract_fmc_signatures_static(
> +        dev: &device::Device<device::Bound>,
> +        fmc_fw_data: &[u8],
> +    ) -> Result<KBox<FmcSignatures>> {
> +        dev_dbg!(dev, "FMC firmware size: {} bytes\n", fmc_fw_data.len()=
);
> +
> +        // Extract hash section (SHA-384)
> +        let hash_section =3D crate::firmware::elf_section(fmc_fw_data, "=
hash")
> +            .ok_or(EINVAL)
> +            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'hash' =
section\n"))?;
> +
> +        // Extract public key section (RSA public key)
> +        let pkey_section =3D crate::firmware::elf_section(fmc_fw_data, "=
publickey")
> +            .ok_or(EINVAL)
> +            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'public=
key' section\n"))?;
> +
> +        // Extract signature section (RSA signature)
> +        let sig_section =3D crate::firmware::elf_section(fmc_fw_data, "s=
ignature")
> +            .ok_or(EINVAL)
> +            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'signat=
ure' section\n"))?;
> +
> +        dev_dbg!(
> +            dev,
> +            "FMC ELF sections: hash=3D{} bytes, pkey=3D{} bytes, sig=3D{=
} bytes\n",
> +            hash_section.len(),
> +            pkey_section.len(),
> +            sig_section.len()
> +        );
> +
> +        // Validate section sizes - hash must be exactly 48 bytes
> +        if hash_section.len() !=3D FSP_HASH_SIZE {
> +            dev_err!(
> +                dev,
> +                "FMC hash section size {} !=3D expected {}\n",
> +                hash_section.len(),
> +                FSP_HASH_SIZE
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        // Public key and signature can be smaller than the fixed array =
sizes
> +        if pkey_section.len() > FSP_PKEY_SIZE * 4 {
> +            dev_err!(
> +                dev,
> +                "FMC publickey section size {} > maximum {}\n",
> +                pkey_section.len(),
> +                FSP_PKEY_SIZE * 4
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        if sig_section.len() > FSP_SIG_SIZE * 4 {
> +            dev_err!(
> +                dev,
> +                "FMC signature section size {} > maximum {}\n",
> +                sig_section.len(),
> +                FSP_SIG_SIZE * 4
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        // Allocate signature structure on heap to avoid stack overflow
> +        let mut signatures =3D KBox::new(FmcSignatures::default(), GFP_K=
ERNEL)?;
> +
> +        // Copy hash section directly as bytes (48 bytes exactly)
> +        // SAFETY: hash384 is a [u32; 12] array (48 bytes), and we creat=
e a byte slice of
> +        // exactly FSP_HASH_SIZE (48) bytes. The pointer is valid and pr=
operly aligned.
> +        let hash_bytes =3D unsafe {
> +            core::slice::from_raw_parts_mut(
> +                signatures.hash384.as_mut_ptr().cast::<u8>(),
> +                FSP_HASH_SIZE,
> +            )
> +        };

This can be `signature.hash384.as_bytes_mut()[..FSP_HASH_SIZE]` without usi=
ng
`unsafe`. Same below.

Best,
Gary

> +        hash_bytes.copy_from_slice(hash_section);
> +
> +        // Copy public key section (up to 388 bytes, zero-padded)
> +        // SAFETY: public_key is a [u32; 96] array (384 bytes), and we c=
reate a byte slice of
> +        // FSP_PKEY_SIZE * 4 bytes. The pointer is valid and properly al=
igned.
> +        let pkey_bytes =3D unsafe {
> +            core::slice::from_raw_parts_mut(
> +                signatures.public_key.as_mut_ptr().cast::<u8>(),
> +                FSP_PKEY_SIZE * 4,
> +            )
> +        };
> +        pkey_bytes[..pkey_section.len()].copy_from_slice(pkey_section);
> +
> +        // Copy signature section (up to 384 bytes, zero-padded)
> +        // SAFETY: signature is a [u32; 96] array (384 bytes), and we cr=
eate a byte slice of
> +        // FSP_SIG_SIZE * 4 bytes. The pointer is valid and properly ali=
gned.
> +        let sig_bytes =3D unsafe {
> +            core::slice::from_raw_parts_mut(
> +                signatures.signature.as_mut_ptr().cast::<u8>(),
> +                FSP_SIG_SIZE * 4,
> +            )
> +        };
> +        sig_bytes[..sig_section.len()].copy_from_slice(sig_section);
> +
> +        Ok(signatures)
> +    }
>  }

