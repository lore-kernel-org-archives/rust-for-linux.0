Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010024.outbound.protection.outlook.com [40.93.198.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D3831ED8A;
	Mon, 15 Dec 2025 05:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765777761; cv=fail; b=b6N7PRd3lz2PsfQF+sbOge2hcexIJsjpU6yYsn8jVsz1mpOsWlUJbN24LoQhPa0UtQp+59B1YOuY7I8Db6BaWPlCSE5mK0/VQIbvVHtBDGVg8sK9nSLe9v+/RlvROtvlTy2IUBwItsS1Us4zePy5KaPgd6jzzJhNxx/vBQIoCt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765777761; c=relaxed/simple;
	bh=cA3lwhnacka7/vHTmYJ25VGmc2l1u0QZtySLi9n42LY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=JOizdwNCC5K1T4xLrqvtmArUAFhVQrHn+/ShVsJ3bgGb024DxFWZTlPlx2xv7PVDrqsd6xpE/N/u34tJP1dCBF+jrQ2AKffngfZ6ltf/8ZOH3z21/JYy+VgWOy1hzuG8auSn/mo8Q1czehfOebQyAm5RTFxP0lHNvbb/wtk0wiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IVISTrst; arc=fail smtp.client-ip=40.93.198.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IVISTrst"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efZf9VPVjILfV037pcCxXdBxYMck/ozk59PYFFu5zV8Bzsvdy9BTtuX3kGK5j9a1FcWUASyIuY38RUDW/saXbj0lvabwtqvZeKbRyriGEuhE87jgAXGaiVbVuxFZZyU9s3ZD7uY0fkzb2QAO1aWFgbIuYrYKQwVJhZdnnLrSnwucmsq7jEHR5Ga7D/UrFoeG8cq7ds1N0Lm6hBoMmq5c0Kcq41DEj3coIb8eV8xMq/LK91aXr02WaZEdIYPZVrE7+6SJT+RGXqFaY3Kz3RMblTxAGmgso4t8RKO2NaBJCEI01EtuZMC7s/iyXrhl0Iu6PLZ/nQXHTFWbYVMcqf53KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CNPqxAJxzEhrYhWdepSuy6e+CLyFHOf7iRTne8Y9X0=;
 b=GT7vmqNitr3deW42qbc0SlKkuIElMfprfIiMSwhfVAcRF/Fi1UjNRUNk9d1j/pCq+JT1utJRhR9LRKT51xpj+JzHgJs5ZGWtxnBJgVeMNZsYhOXzRlkjHO1cB0MApU2vfJbSwAi8Ou/L+UZeOBpCMVbEabTBxr8mVE24v0RvcIqcl/B4o9m8xFCLgLGhg6AfBNyuOuL0LlVmsvRLqTqlUI1Jmc1MsS3hi5w4cx+09vpZfbaMfYZhs0PbiCyC92g5sQDMtpqDKat2F4l5K72xhAgI11CBJ7Njv5hLV/UUAYS4dXY+Cuk6kQ5L2qSu9O6uglCIZr/+KqQrUUlWtCxE9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CNPqxAJxzEhrYhWdepSuy6e+CLyFHOf7iRTne8Y9X0=;
 b=IVISTrst9CjGKQIMzbLFkJxWqh+Ve5rGx2sV+YtHAwKb/b8z/fmTYRcmm/ha9NZLr5hQR2XK2MUOuK2dgvlv5EXH+XvkRFEf+Gs7RW8P5RW56TUaRn1V1vtX9q7t1cp5k+eGVj1ebcHPX880jSXdRW+ZpTO9ps9fySkTbCOMZ+ZH0t1k7dFatQ5IO1WKAetpch0vaw+GuaHtKsN1PKFqC3BqKEpYYgsUCW6loxiDXkaabnq7s+9GIT4ybUwrj0arZRzkmqUENRnFeoBkV2ds5EiMiOyzFrEUU31XGSGPbWYtosh/+sLC7A/c+gSL0leJR49IwWZEHFr9E0/OuqONeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6935.namprd12.prod.outlook.com (2603:10b6:510:1b9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 05:49:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 05:49:16 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v4 0/2] rust: transmute: implement FromBytes and AsBytes
 for inhabited ZSTs
Date: Mon, 15 Dec 2025 14:49:08 +0900
Message-Id: <20251215-transmute_unit-v4-0-477d71ec7c23@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFShP2kC/33MQQrCMBCF4atI1kaStE2nrryHiEzaqc7CVJIaF
 OndTbtSRJfvwfc/RaTAFMV29RSBEkcefB7leiXaM/oTSe7yFkaZShsFcgzo4+U20vHmeZQ1oKv
 AYUOWREbXQD3fl+D+kPeZ4ziEx9JPen5/ppKWWlpQbV2AdVXX7HzijnHTDhcxt5L5741UElHXa
 KEE7N2XL9598+WL7EE3PVVQOlT2w0/T9AL/0u4lLQEAAA==
X-Change-ID: 20251208-transmute_unit-78ab58ba9e6e
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0065.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fdb5bdb-3d2c-47f2-6706-08de3b9daeb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHdYaFl5bE5FcHl1cExsNFJRSVVySGpDNHdKZTB2S25aYWhrdDFqbHlUdUM0?=
 =?utf-8?B?VlZNSEJwUzRycU93c2NHUTk1Z1pwS1JTc3k4NFVlNWdEVkNiZnVaNHJvdGVl?=
 =?utf-8?B?d0FyVW5pVU5Rd0thK21hYXF6ejZJN2NKMzAyZitkQjdRRmt0bUVSdjhvb01U?=
 =?utf-8?B?azRxMjhhRGVYWHdqVFUyTWMrZnJFK3NFT09Ec00vN2Q2b085MkY5VEQ0NGpv?=
 =?utf-8?B?NkU4ZnlTckZmYzExa1FlbUVxWVFsNUlyZzMzOW80NlJHNEd0M3VHeGlxM2Zk?=
 =?utf-8?B?ZkRyV3dxU3hQNWo5QU1xekRkbGdqZ240d3RkbFhTWmQ0UnBVQkxXckZSU2Yw?=
 =?utf-8?B?YUx1N2FCZW1sRDNmMFd3QXR2cEd1UEtpakFwdXFISUNrSzh2c1V4eU1SaGtV?=
 =?utf-8?B?QUhsNUJFZXdkMFdNcnhjZVhjWDJhR2NaZjVTSXduSFJWWVBRNFRmcWhrVnVs?=
 =?utf-8?B?MmtuaWVvOW5uQ2ZFU1E3NFh2NlJidWNFQVZGekVrM3JJL0RMYnVlcGNJWm9L?=
 =?utf-8?B?d016RWJkZytYQi9lNU5WYzNEN2RteFRuUFh3RUlpK1hWdWNOeDJqVlFCcmk2?=
 =?utf-8?B?d1Mrcm9qQ2JPejFCbFFKYUNxL0tDQ1hySDBTRm0xRlEzTlk4SzFGU2dCc3Zz?=
 =?utf-8?B?bERjMEcrbDgxQ1V4NC9ETGxsSW1iMFRQQUhoQWJneGc0VjFkbWZxSkJUTlh1?=
 =?utf-8?B?dW1Zbi9kS1VxaFZsdjcraWwzV3dCNUd2cVBtcThFVk1SZ09vODRIeWozQTZ0?=
 =?utf-8?B?SCtOM1EvTjNNcWxabjg2MExmUndhcFpZaW1HSlFoM2E0ek45engwT3JTNnhO?=
 =?utf-8?B?RXVGS01vZUVRSFlORkRBZHZsR2ZHTEYrcWphTHlTb3lZcmxBbWFWdk8rV0wv?=
 =?utf-8?B?MkUwU1lVSldXeEVZTzJQZmVxMDR0ZW5jbm5kUGtiVVNjU3pCaHV2L3ZlMjU5?=
 =?utf-8?B?ZytKNGVZSjhEQmZ2MG1QOE1XV2h5Z0puR2RZOFJGSmtYejh6d25acjYyTFhE?=
 =?utf-8?B?MmI4TzRRdWg2bVpyUThIbnJvdVIveVBhUDk3Y1hNMXkyRUYyYlcwTTNmeFJy?=
 =?utf-8?B?ZllOV3pLdjFZVGlGcHhyeE1KMFpldE1qTXIxZ2FXOFB5S3pCZ29rR2IzYXcv?=
 =?utf-8?B?NVhKcTZxV0JFeWp2RFdzTlJ1WEVsenkyMnlkUHhLSHQ5aW9JM3FVMFhWVytj?=
 =?utf-8?B?UmQ0ZjJLalBGc1Nveis4N3FDaEZYeEFwb3VLZDV3V3lDc0J0YnpTUEZkQWdq?=
 =?utf-8?B?TkxPRXNQMVM0R0xMVGZiZ1NSeDlXVmxVaE5LZUR5b0hVWkphVDFxZExDS2kz?=
 =?utf-8?B?SkpranI3QzU1UjFzcjlaS0hQREJXMnd5Uy9ySlJjRDJJcGFUOTVBdlZ5L0ky?=
 =?utf-8?B?SmRWOWg4UzJiVnZFeVhEYUJuK0ZzS2V4UVRTcnpvc2UwTmpxZ0NKa2JneXEz?=
 =?utf-8?B?RzNydkhXbEFreXQwRzZZakJoWlVaNStHQWVWeFNhR3A4U2E0M1ZhdFh2bDZR?=
 =?utf-8?B?NXc3cTB6OEExVGxUWnJ2ZEFoRWl4UjQvS3gyOGJjS1g2azNZK1ZOWXl5Rk5a?=
 =?utf-8?B?UlkvdWJVVks1Q0xpNXdKcWw5ZzlEZnJZSXJhc2NJUS9zd3ZEUE5ucGlaVm5i?=
 =?utf-8?B?ZDdRV3FHOHkrbjhXbGdtc25OakJHTDFxZTU0TjFWTFVWcWhXSWRKOTVreTdh?=
 =?utf-8?B?ajBja2cxNHRuZDEzS1ZKbWV5c1Evd3pRZDgvclFZakwyOHFITU1NT0ZPcjlz?=
 =?utf-8?B?Y0ZndHZ0WHFOQWdvRy8xMEdyMlR0cVAwUUlIQjkrMjF3c0l6ejZsdjZNWHhH?=
 =?utf-8?B?TWlhWko3MkllcUJuUFArVzhyTFZqZ3J0VnlEQjhkQUs2RGhYN3Z2azFOMnZ5?=
 =?utf-8?B?Q3A4dzlTWmtocy9RL2t1amVtUDk2WjBsUGNBRm9aTGc0cGE4M0MxY2N3Vi85?=
 =?utf-8?Q?cZz6xRUdCkgzregGQ2bs6ci+HYWsRo2Q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW0xVXYrbmtlMXhYS1FiRVlnQmR3R3NnaFFRZUlXMGNJL0dKUExmcjFjLzI2?=
 =?utf-8?B?QW9qZ3Y4YnlBNHFqTEZKRlZsYTVjeFhWUk1ETFFiMUs0L1dLOFJaVmVzRStL?=
 =?utf-8?B?WmhJSGt6dnVqd3o4bWF4aFpnQVFsMTVFSkZ3WE1mOHBlVTdrS0JiNEk2S2JF?=
 =?utf-8?B?RlpPZ2xSSHlIR0x2Vkg3dnQxQVZmbExvaTNWQ0pVSWVrK2UzSHdpeUpIU2J4?=
 =?utf-8?B?dGhiVzZMbHJqTUtKcDFEbDJpOXF3UlB1OTVJZlZRZGU4dUxTVG8vbjFqNWN4?=
 =?utf-8?B?SnhnYithdW9IeG5TNUZPNXhnUU42Yi9Mc2RGd0ZwYmtuZnNJM05IRU9JTnhQ?=
 =?utf-8?B?TWw1dWZuSEhrVjZDWjU1ekJFdGdnYi9mZlR0Z1UzSCtQN0s4NSs1c1Buckhy?=
 =?utf-8?B?RXQzMncwMUh6dGxKQ3N1VS9TZFBsd29xd3hRSkwrVjZYWjV4VDBwL0tOQm1k?=
 =?utf-8?B?bi9pb2llR2Z1S1lSMVBTbXlZTHNGNndmL2JIaTZGa3V4M3ZCcEs3dlZBNlpq?=
 =?utf-8?B?bVg2TmxhcWtrcVlsNGR3bGpLUXo3SnJ5REpvN0Q1c2VWRUxSY2dobHRpK1Ni?=
 =?utf-8?B?QnpCYjVLdTVPWkhvRlV6bE9pcXVQeFRTeDJzWnFFc25scmpwaVk5L0dzVncx?=
 =?utf-8?B?ZXhUWkhVOEJuK1BxdjBFQS8vbTBsc2V0YTgwWVdFczhWVVNscUMxZEE5Rmha?=
 =?utf-8?B?TWozWHFKWWo1OHo2YTBVaXpFdllOU2N6Z3llTDFWVFFMZGJ6WTl1UVRiS2xv?=
 =?utf-8?B?RUNMUGpXYzFacXZ6V1c1emxpZy9HYlFWajNDbEZvVmlxWVc0RXFDWXpJSXM1?=
 =?utf-8?B?TjBhRjA4ZU5tSlBUSmN0cGJwalA0SzlRQzRaZ1FQcldHMkRJSXVBc2xPaU1Z?=
 =?utf-8?B?ekY5dmVNT21zRXlVWDhqL3VwYzR2YitwdGRMOXhiQWpxU0ppZSttRVkvMlBV?=
 =?utf-8?B?WXpKVjFJVUl0K205VXpuZTloaHlXandYYThDN2RzYmpCdWVOQXluQ2MwbHdV?=
 =?utf-8?B?dTNDcjRuTTU4KytjK2daVkd6YmdOVHdWcVJZNC9VM3Vjam02RnoyTjVySm1h?=
 =?utf-8?B?djRtckF5dHJYTGZJWVhuR3NrQ3VyQkR3K1V4eTFUWDBOR0ZRVmY4Qi80R0tN?=
 =?utf-8?B?bml3Ti9vTFJ3ZXNyUS94Y0xRc21Tc3VTQjI5T3U5dktFY3cwUmxwVHdrZTJ4?=
 =?utf-8?B?YWg2a1MyZUozd0FxbWRRTE56L2RDNTE0WG42UWNmZW41ZVEwZHJtQXRmZ2Zy?=
 =?utf-8?B?V3UyaTZlQXBNNEVTeURPekszMm80MHZqM3dWNnc0VFozMnE1NWlsRnF6RGZG?=
 =?utf-8?B?Vmo4alN0TXVyUE1NQk01eDJEV0lSZnI0OEpoRStVNUpHd2p2bzhZQWZkV3R1?=
 =?utf-8?B?Q3B0YUZUdDQ5U21kcTNScW9HRzd5d293SUpnbUEzRmQ3K1kwMUlrTEtpbG5B?=
 =?utf-8?B?ZWp1Z2N3YzB1MjRzaWhzZm96b0J4OXl0eFZkZmRkcUpKMHFsVjllR2c5Tk0r?=
 =?utf-8?B?TXZNTmt3cFl2R2w4OFMwQTZ2QTVFTkhoQTVkdmUweHlCYThHSmtHa2QrQnRs?=
 =?utf-8?B?d29lTnl5Z0xldDcraXlRTnF4UEs4RmpJWFgrcXJjbWRlcVI0QmFHMTgxWHlD?=
 =?utf-8?B?QWg1ZmYrUlJLZnIxQmpTYUo4NzQvOE9MaFdlc3N2M1dPMHltcFhLbkt4eloz?=
 =?utf-8?B?bkF0cGpJWnpzNVNnOWNBSUVaL2FMTkQrSUk4WkRjZk8xOE1DbW16eHlha1JZ?=
 =?utf-8?B?bHpHZkRlS2t4SlZ6cFVVRVpLNHEzeTB5SjYrbjFrTnpyK1Y4TWo0K1Z4cEti?=
 =?utf-8?B?TENDYXEvdzQzUjg0b2FoNHVaRzg2VUxrOUJwVmdWa1VWT2NkWDk4ZDUyYkJI?=
 =?utf-8?B?RHFzV05EbnhNTXptcy9yNlljNHRUdzkzdUdXeHdDbWRtRFdXN3A2UWFwMEJr?=
 =?utf-8?B?cGJZeGlmRjdxTGxTZEJaRU00U0lkNktyZFZFNE9Nc044aTR5dG1iZjB0YTZQ?=
 =?utf-8?B?d3RXb2hpdEczU1JQU254MDladWN4MitCMkpvQTZ6Y2RSamtHK2p4MXJEN2Zy?=
 =?utf-8?B?SFFhMXNOS3dDN3NlclRWZzFGcUl1K0EyWXFzZDlVWDZWdVRCVkU1OHM0QlI3?=
 =?utf-8?B?Z242MVNSS1BLUlhJNHYzMkM2dHFvK0hTTU4xNGNJZFRmaGhPdUVQb3dBTExG?=
 =?utf-8?Q?taVVbCFPCc0abHNEek3h6XyBdueAy0sIhk++SqPfPSCH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fdb5bdb-3d2c-47f2-6706-08de3b9daeb9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 05:49:16.2471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFzX3D/Yv/DD1U14EneVDhdCU8lP3uvoC035m398EcwbFLxniwNVPQoQm6LRqh1lzjACTmsTy2366uZsi70vKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6935

This is useful in Nova's GSP message handling, as some messages are
empty and we currently need to explicitly use an empty structure for
them.

If accepted, I would like to merge it through `drm-rust-next` so Nova
code can start using this feature quickly.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v4:
- Improve safety comment to mention lack of invariants.
- Link to v3: https://patch.msgid.link/20251209-transmute_unit-v3-0-819fe584ba06@nvidia.com

Changes in v3:
- Use better safety statement. (thanks Gary!)
- Also add `PhantomData`. (thanks Gary!)
- Link to v2: https://patch.msgid.link/20251208-transmute_unit-v2-0-aa17a6848afb@nvidia.com

Changes in v2:
- Make use of new feature in Nova.
- Link to v1: https://patch.msgid.link/20251208-transmute_unit-v1-1-680c7386b5d9@nvidia.com

---
Alexandre Courbot (2):
      rust: transmute: implement FromBytes and AsBytes for inhabited ZSTs
      gpu: nova-core: gsp: use () as message type for GspInitDone message

 drivers/gpu/nova-core/gsp/commands.rs | 6 +++---
 rust/kernel/transmute.rs              | 8 ++++++++
 2 files changed, 11 insertions(+), 3 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251208-transmute_unit-78ab58ba9e6e

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

