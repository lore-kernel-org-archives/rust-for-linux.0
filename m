Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D8C313E3F;
	Thu, 29 Jan 2026 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693555; cv=fail; b=UqltcTZGv2Ne2llPCr9eavhrdgpisQGYrjlTWtd3LYeoNCx4fJjYOev3ypO1rVSsAiXdti5lVxqhuvNN/EzSkzwoYkACvaycklKxP4j/ECJltllvDPV1qFJhZkXruqpmCDt8rqDQTlbERv1P8HtzH8JapkfWJ1XNqDIzEWq2Q/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693555; c=relaxed/simple;
	bh=5NOnpB+JkmYoNSdg0KQsq9hm7oPd1cdUicHldYc6Cwk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cmqQtS+FNbtoheWigyUforTMBBETiALkp7RiyXYOatu8KFtr4D3kAkm7aQwhOedlMQtNEigNjIjtlY9Cg4mwIGA4NJU3WCVNq+jGyxyLrI7kIxbpWw2slvQZmwgAC1jQZORiuQ2eY9aICq2F6rg6yVZmmz4IiicBJ+7n8jaBvIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WnovwmDZ; arc=fail smtp.client-ip=52.101.62.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WnovwmDZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcqXXvu+zBB7XXUrI8Ddv083gsxKHCjYa2CgqenjgCldDmKkeoU2Pmqwfm2QBuY8muDb9+Tp6vTQwaXUU2gAk16+GfS6W57yT86oXh/wcqyJdxvmTNEIE7hL31Y6/tuXGTb8Wxeh0u9ptUb17dbAxs6iOGOQubmsW6awz9A5+BJ/psnidps0q49ktUr050s/eVjokDWd9aqbY3fN5qObpJmfmMNKQsNL8MLDGBTrhl6zdfiWXjvVC6xaoMXWOOx7wabfbd25TlCUjkHw5mBVVnjrmH7Nva95pd9ooLwJ296uOniFUHc85JxJV1X+p/B3cuQCLrCv+NC6/rZxRZpxFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91pNgxioMuH+sfUTVSRDOfhFd5wIMV0Ph9XbSJHEEOg=;
 b=KCaPYtsn9FRpILDKzbzJGI5untDKuBfxhC2CFvrtIIZuKMfNSdnW6Sl8iZPW6JfreM9PiJVb67ZtYMPh0LcWiR/t7euWfjWjwz9xy5tjQVqLro8QYg/jUt9XbVNrlHr/BbmCgCDjpsVXgO01Nc/JVCxItSUOdnRoyKPUai0KHzGG/9sma1Bs7lVJoIyp4eXu3rrsjPS3UuVOIR7lGiyGn1+WcBKs+byyUN6vSuQAq1RTMw01cCAFsm1U7F1DuSORiTGjPbeam6KmgLJ3ym7ay4bleG9vhbpx/xYJKtYXHd8h7Kxgz7m+X46969/HU+o6yaL5Fe3f1tcEULQ2jfNxKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91pNgxioMuH+sfUTVSRDOfhFd5wIMV0Ph9XbSJHEEOg=;
 b=WnovwmDZAdgSeiJoyBPP0eZ+n4CSQDFrcuZOWTlNuklD2kK1EVnQpXGKm4ec6zPV/i47zcW7bF3fxldfD0lub1HexSAisJ1FhJmzLqVB2P7aN+U02CFKazHAuUoXimkQAO2EmB1mzkip0B9Y01/sXRCU4Gdk1nKqFKkaQ2jHG2M/3lSKxSbIUd6Ti+aeBQ6G2cSKRxfNxQVU/7Ayxyz+iTr+AOhPtqb073qYtXszhw3SEBiK/J+L8dIS9voAJIokfPGow3mHxRgYYeyFZrgF2SAX+WuQdiSXJE9QrUX0EpWj6XYfiZ7bibcu4SLb8wmY0Lw5/082m9V/SeCeTaBE4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB8146.namprd12.prod.outlook.com (2603:10b6:806:323::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 13:32:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 13:32:28 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 29 Jan 2026 22:32:04 +0900
Subject: [PATCH v5 4/7] rust: num: add `into_inner` method to `Bounded`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-register-v5-4-c4587c902514@nvidia.com>
References: <20260129-register-v5-0-c4587c902514@nvidia.com>
In-Reply-To: <20260129-register-v5-0-c4587c902514@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0238.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: d1df6ccd-1bd5-426a-4563-08de5f3ad87c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWE2SjNpMlZxcWFMVFdvQnJnYWxJYUxmTUFHa0NVZmp0NFY0SVY2TW42bHRv?=
 =?utf-8?B?N1FDdlNBdXhMU3dNVnM5d3N4Y1pLMmVNRGRFTGZaeWFhQU1IQ1NmeTZwdU03?=
 =?utf-8?B?Mll6TW00K3NDZEpaWm1GZG9CbGx5WUl4VTFxR0hoM1pQNlUrYUgra2VucXY4?=
 =?utf-8?B?blo2SlFlSko3MDJzWkoyeEVIMlpRVzRNODRPQm5WdDgzMVAzUGxkQ1BPSGdG?=
 =?utf-8?B?VlF4dzk0QS9saHZBYnFjOGRkbnN6cVhlRXNNVFAwcTZUbXNFMkM5RzloQ0w1?=
 =?utf-8?B?L3dmNVlsY3dCRHI0UWQxVVNpbkZwNEtGdytGZ2JQSEdpamlSRFcwY0Y5VG1o?=
 =?utf-8?B?OWJIOXVyWUdCUU5hUW50MTF0VDY4T013THI0bXA1aWdMQkdBbkZuTlJCOXl2?=
 =?utf-8?B?N29TWi9yVmxyd0gwYkowU1loUTVqZVpuMXlLZXR2L0xYbDZzalQ1bWFBNGh4?=
 =?utf-8?B?WmlCSFh2TXFJVzBmWTlsZWhYcjNBZzA0UzNVMGRTWDgrOTFJdlllNUxhYmdZ?=
 =?utf-8?B?WGZVQ2c5ekNiazA5cVcrdndtR28xOFBSTnN6dVNVQkNoZkM0cE5wVjBpRm5s?=
 =?utf-8?B?UVVOWjkxSlJib1FGam00bU5JL0V5Vm9KeXlielZXb0ltelp5Qi9KdXBiNGJG?=
 =?utf-8?B?bU9vazB5b3BUU3ZjbkRGbWVudjdIREdMeC9ibXdUSVJGTEVGdmMyaS9ad1dE?=
 =?utf-8?B?WXhOWVFpK0JST2JzbEFLRFpBb1VvK09xa3FoYk9mREw5dmprSE0ybmNTMjV4?=
 =?utf-8?B?U21oQjZRUXpFN0gzdENZRlhoTWIzODVweHVaMVR4S25YOWIxbE1OVlIyM1NW?=
 =?utf-8?B?SDAxTXpLM0t0NHV5bExNUVlqRTZiWlR6dHhSR1dpWlFXOG92dENneGdnckVW?=
 =?utf-8?B?ZjFKM0ZPS3NDTVhUdWxGTUJ5d1pFTmdUbnFOMDhmMHgzN1VLTDJ1UkVJZDcv?=
 =?utf-8?B?V1F6emx2cjhXeGczbFNxcGFQQ2NuVjRXdDlMZVVmZnJQSTU1dEI0c3RoWDNn?=
 =?utf-8?B?MkdQRFJBNW9Tb1ZBN1VPRHN2bENrN0ttbkUwNS9haExMSU1UbXlyNEVjKy8w?=
 =?utf-8?B?VzRvNW45czZQbHQ0anYxa1M2UzM2bm9kOU5jTStiVWdBc0Y2elk5RlA2SnFH?=
 =?utf-8?B?UUpQSm85Ly93T3ZkdkJqVVkwbkJMQXgwcml3Zit3M2xDS3VBZ1hEQllqMGRD?=
 =?utf-8?B?bjRMZk1uSU5TVEVXNlNYY1lUeXh4TGJuSGV6cksvclArOGF3bjZTRHlzT0o2?=
 =?utf-8?B?RlI0VEwwRko0dnRVdXh3Qm1GeHRJckFybUl0UHZUQmRxeTNiUEZxUnVmNE1v?=
 =?utf-8?B?WURKaTRxUXdCQWhYL0N3QWhlL3ZVMElaMVorSUxHdHJZTGJQSENEWE9jUGYz?=
 =?utf-8?B?WFM4T1FHanRMRkhMcVRpNDZlL0hqU2ZXWTEyN2lRcE8zSVBoUnhyMWx1RFdI?=
 =?utf-8?B?Z0RtL3NsaWJweUQxZ2NlSlNrZjhZOXZGckx4VGxWV2RsRkRlM0NkT0ZvWXc3?=
 =?utf-8?B?Vyt3Wk0vUXBuR0FadGxnZzdCZjB0NWFZOFEzNUVMWlF6VlZXT1RXM09pdFZS?=
 =?utf-8?B?cTFVdjJEL1VuK0ZPWmQ4bFNjZmZUWXJ3S3lKZllySm1mN09xMWV6bTNkM1dF?=
 =?utf-8?B?dndzMWhRL0pDYXJ5Lyt4dFVteGJOa0JlbkNjTEhKeG02Zll0Q1craTlCemdB?=
 =?utf-8?B?dzNHcUd0d1NLaW5IenRxKzQ0UTBobHltbU0vZ0M3U3djcHBOQ3ZNY2JXQ0g4?=
 =?utf-8?B?MmNaeUNCRk8yWGEyQUZNSCtVOWZneUtnZmhUNWRUbkswaXBYQ1pvbGttSlF0?=
 =?utf-8?B?T0NSVTgrNWZXOGdDd1hNZ2lTZ0ZIRTVJay9LTEwxemo1anFXczYyMWMzWHIz?=
 =?utf-8?B?K3Bwa2lnK05hM1lmMkdNdWlobG5VbTV5TDBuTGo0OTdQVDJXcXJYVXhYN3FL?=
 =?utf-8?B?T2hwWTNNT3R0QW5uRDI4VjdCYnJJaWtjSU93Mk0wQmkwbS9LQlkxT0IxUDlv?=
 =?utf-8?B?SW1PWjYwbUxhRXlRMENaUGRWU2NjNkNNc1dBWFJWaWRDWWc5b1NRVnd5V3dz?=
 =?utf-8?B?dndTNnJGYk5SUUl3c0hEcmljSDc1SGE3eHBqVG9kcUlQSi9hK2pEeE1pQ3RQ?=
 =?utf-8?B?NmxsL2ZlOWFlUkVSN1RuQXdvaVIwMmVyZVZNcVpBV0pqZlFyaldwK2QvVHpT?=
 =?utf-8?B?bUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em9EOGQ2Mzk4aUJ6WTc3SDBtVUw3WDBsMWtwcVdmRW9mK2ZKdFc0Y0I3aWFL?=
 =?utf-8?B?V0N2bFFTUjVSUjRSUERtc080aXY0V1VXMzJSVFNkR0FQVi8yTWY3UnYwTGNj?=
 =?utf-8?B?cWM4VmdHeGFpTU93am5hMWtuVzg0NlJROHUyY2IzSzl4dmtIbkxDWURPZXhX?=
 =?utf-8?B?REV3QXh5RFk0aUZDSUxnMW5YUC91V1k1akxhb043N1NoNE11NkorQTVoVXRB?=
 =?utf-8?B?N0cvbFVyVzZxd1pyYUxDNHdFNndZMU1aVTFubEJBSXdLSXk1M3dDOExVa0sx?=
 =?utf-8?B?WXZLdzhOcXFKRVFhMndnbTFOeTV6SEkxemFhbHZmZ0o0Z1craVc4L2pWWVVU?=
 =?utf-8?B?WHFYUkROTXlJZkxsR1ZERlRoR0VwaHA2ZkJhdmJWNkRVQUVpUDgxZ3JsVVhu?=
 =?utf-8?B?enhRM01RL0VnWUJMYnZoQnk1ZUhUamhUclh0Ym4vKy9GbHBWWU5GZ0NhcE5B?=
 =?utf-8?B?MCs5bzFqWklpeWdxSVNJT01KODB6TzVLN3MzUVA1Sjd4NFVWNEt6eUE2YVU1?=
 =?utf-8?B?Wlh1UG1FNkdlYjJJS0pqdVlTdnd3Q0tPZGNjSExBYmxwTUVSWlNHS2prWk9k?=
 =?utf-8?B?SURmeTF5blFKL2xYYVNDM3VTQTlxaVNMYmNDTmt5UmFrWmNRR05teGdMdHF1?=
 =?utf-8?B?MnJtcWRiWjBVbmxSTitFVThPNjYyaFk2UkhFRWl6ZEpwT2lmWUxtNU1jZXRk?=
 =?utf-8?B?c2J3c01WMVJhTS9IeENBZU02SGFhTllyZDFzcjhkV3lVOFo5MU4zYTVsdkRv?=
 =?utf-8?B?SWNIVm9PNStuQmo0T2wrYlBNOU5DUlo0U3NGc3BEWi9CWmlJM2FSMWVpTnNX?=
 =?utf-8?B?SUpZcVh0NXpDVHpiSFBOcmJ5VHA1ei9DdlNVaHByNVB1b3lZdzF4UkFlTUth?=
 =?utf-8?B?R2dFYTcvcDdDOXlWVHZWWkxKZlpSRGR1ZEQ4Q09lcjFCK1FSK3Q0aHFkT0Y4?=
 =?utf-8?B?SGpoT1p3Y2x1OE82QmwxeENGRU8rRkI1ZXRNTWFaSFZ3RkN2L1hWS3owUlR0?=
 =?utf-8?B?UjVQUzFaRmxLa3hNRWFtdlFBNlhCenB0ZUpLb1JlSFZLMWZhMnM2MnlLaU1H?=
 =?utf-8?B?VU55N3hWVW0wQ0M5SkFZOXhkaG12L2pna1FBSnFrTGo5SVpabDdxM3p3OGdF?=
 =?utf-8?B?T2Z6eG1RQm5vTWpUTytEZ2JpeTgzUjBORmIzMTZKZzJVRy83TVpRbTllVlh0?=
 =?utf-8?B?MzVaNnRwYkdrU1ZVR21HQlJUSld3NXNaY20yR1hDb2QxMTI5Smx5U1JwSktK?=
 =?utf-8?B?L0Joc1BQOGxrYXJOYVdNdDdySmVtS0pzS3FuM2R4U2FDWnpMbGJETmhYSGxz?=
 =?utf-8?B?emU2dkNHQlBzSzFXZXdBWjZXZTlDT3N5RkVQUUM0QTBhVmozeitvQUdRUXhk?=
 =?utf-8?B?VnpMRTVCV210dnh5Q2EyU3dOUGJpeGdIZG5wOFZ0a2R5N3FvWnpCcGtWcU5i?=
 =?utf-8?B?citvanJMYm9GUzNaYzV4S0JnREZVV1ZUdWVzbzZ2WmE5M1NDblFvdVYyNmJY?=
 =?utf-8?B?ZW9RNGlualdnSXlqN09jMzZnUG9iL0U1WW15bWF2dWdsVDNuQ2FpZmtndWlB?=
 =?utf-8?B?K29EMkNJMjBYZzdqOUdzTHdoQ3BaeFJkMGZZTk5zdDlJYmJOZTRPUzBNdStG?=
 =?utf-8?B?K25IMkZnNFBnSERNdk1mNEFNVlFPS251ODhtYmVEUmZqdktjTnN0RjRLcFc2?=
 =?utf-8?B?cjg2UnUxRUx4VHpsQjBmbnFtRU9rWitJRnhleGlsWlFMUzZMNExsNWtpV2k5?=
 =?utf-8?B?bGlsWjB1Y1J2VnJseDVOZGNlRENyRmlTT1NWSGVLVjBnVFVHQlN3VG5qWW1V?=
 =?utf-8?B?dzYwZDh1MVlhZGgvSVhCQnZIK3ZDam11RFNZZGtZMlFQM0ZWY0JkVjQrZWdS?=
 =?utf-8?B?ZEowZ2VYaWpPZXB0bE9ZUDFpeDRkbUh4OGluZ3RJVnluTmhZZWY5UEtHWlBy?=
 =?utf-8?B?NXpES3FEWjFSK21xbFJZN2lrMS9zT0lXOWdVU3MrdGJ4aTkrWFQ3Qm1uMXBV?=
 =?utf-8?B?UExZQ1RpT29GNEFtdnllY2Y2UDlyN2tYVHFuT2RvN0d0ZjBYWUljOXdLaVM5?=
 =?utf-8?B?cHhXK243bk5FZENyTEFHN1VabFFqaVArZkUvd2ZjLzZQbjhLVW85TkVVL3Q3?=
 =?utf-8?B?OVJJNk9TSEJzM3Vlb0ZJREEzL3lqajlaellHSVpmQ3h6TmtKazFXbHUreWFj?=
 =?utf-8?B?TS9FQmd5WUdYWE5CSk1DcCtKUW16a1kvQXlXUGhhaGFDQ3FQTTMxRkVBbGdB?=
 =?utf-8?B?dVdEK1ExekZjaTNOenp5aW1naDZvc3g0ZDRKWldvdEZ0dW51K0Q2UTI2L0F2?=
 =?utf-8?B?V1FiTDNVL25mV01oZHgxTEdWdDNKb2xnYlpnemhWL09yYzZ5Sy9HWkR2Ryta?=
 =?utf-8?Q?9sfmcFxLmSmiPT3oQz/Hoy9RYKkAa3UTbgmEYC4PuSIpt?=
X-MS-Exchange-AntiSpam-MessageData-1: tAuMx6ECqnXFWQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1df6ccd-1bd5-426a-4563-08de5f3ad87c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 13:32:27.9956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zevty+6mBzy3cCtYgCGciqq4wng348FIsVVF/a+ttwz1k49UQHHt79OIOiOWsMUy87kIrQpjGsJGba8aXXYs5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8146

This is useful to access the inner value in const contexts.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index b41ca6df1525..850827033f67 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -388,6 +388,22 @@ pub fn get(self) -> T {
         *self.deref()
     }
 
+    /// Returns the wrapped value as the backing type.
+    ///
+    /// This is a const-friendly variant of [`Self::get`] that can be used in const contexts.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// const V: u32 = Bounded::<u32, 4>::new::<7>().into_inner();
+    /// assert_eq!(V, 7u32);
+    /// ```
+    pub const fn into_inner(self) -> T {
+        self.0
+    }
+
     /// Increases the number of bits usable for `self`.
     ///
     /// This operation cannot fail.

-- 
2.52.0

