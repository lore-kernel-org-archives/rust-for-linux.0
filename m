Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2CC314B95;
	Mon,  8 Dec 2025 09:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765187699; cv=fail; b=RmfVVrmprajVS6hV20IzCtsuhpTY6WEuUcTn5+SxDzAZWzgPQbRIxvbvo0cKMPjxu5snShUWOIp22zVnUeKbIB70urnp/pBIehd3KsHs0J4wcLU6ag3+U57xxAupTkyTy4dcyy+f6PaSmuThTz2j4SCKQK2sqKJRpo8vUaK1uxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765187699; c=relaxed/simple;
	bh=gfaXeMBhP0J1U9Rc5dmlifzvlQL5Nrc5TW56BFQY+4A=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=gKG0jSYQOhvG2/TdcoM8Ri8VnxaBMzsDpW9iwQDtOWpCMFMirRLZm9nsC91ARAa0yoP9CxfF0z1ugEQ5akFt1rqLZHgR8qXES0HMBiHFdM41Gb7l9XB7kNUgmLIhVJNE/MU9ZtSdJuf15G0g8jJF0FOcZGiKP449K79V7H3Rgk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tozLArbm; arc=fail smtp.client-ip=52.101.201.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tozLArbm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+8ykItnXvV/N4r+AdTqLaQu+FKiGiZ4RqQOlbKpQffMv4/oPKX6xvfh+EbghyROqQvqthIj7V0ABpSSwEXfGUgSP1jz09oaBeDmVrrZR4HmXZiKOEquEBwFt722gf9alVvgsEoSQhCX8A1XZEwIUoDhkb5GbfMhbHzQG3qXzuvupamJb4m9B8NO2JOJ88ebkvCKJ/NjBrvluQQtiiO6aFcjnLKFlC6Mhs2LtkGEP9FHryvWynb5aZkT6xRWlcQBWtihvXYyKAou7z/fQLo7sdnxB4Wg5oyrwRoh6sy+SNn6Ke7CgS/SHAU1Fktl4t/Ka0+azn0RRAuIvUn35F4uFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxUnyhZ0YU19xf1uuC9jRPz7B6YoJ1WU8DMUORQzCL8=;
 b=GnjY2kyKujV84cT0WDs3vk9rsvPt2N3uWvjTVuh8t2CCX4XOd2ZYRUMAFPldQP5DtIxaFUVim1myuUG6LduWMyLHeKisayM0riLSmdpeb5Sa6av3JoJ1jn44jUFxZhRXAZphq4L/fUnCqnOIcf8C7Y9Kn6xKgAZEbGJIyiEw549sEW1xhpq6z3qJwOb1TQKS2bErUARM/qcIi/06gtgqhtdjt6RhANTulwK/ihUSMhLCO6mPicdK7vqf3AAYzKTJmaDPmuS2AN/BACH7rXsQ7AbP7xdQJop1qe2lk71jx4JtgsK3p5OK1Ldh20ZThuqGv9nABMYPytwAmmzGXmMHCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxUnyhZ0YU19xf1uuC9jRPz7B6YoJ1WU8DMUORQzCL8=;
 b=tozLArbm5WW0o5qaw6A11FEZeedS8qUNNOYSj3U7M4YgLjUnJDp6M5JZwPc/y9TlRzv+otbm+DO0bvVXmoru4iq2dtoq/HaXmAwQZZmACgP07PGAUhbLiqOrRrQYr+dycWkeKN7BX4rEBUusxcdT8eydpvEQ8D83DvIM+JNfLRMWqpvnjd5z8ERqfpL3dWf4tBRiiZcJ8LTjyFEAbmBznT5+LyBsr7+cnPkCMUOA9bE+3UKd6rYCIIAJ4Nt21aH+e21OZKJVdrIuOQEpH4guUsCObHoP6pGoGcoZODyFGd45knYIU8wREY+ma11bUTVoADNmkLnVILS+ZoaYBDod9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8005.namprd12.prod.outlook.com (2603:10b6:510:26c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 8 Dec
 2025 09:54:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 09:54:53 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 0/2] rust: transmute: implement FromBytes and AsBytes
 for ()
Date: Mon, 08 Dec 2025 18:54:39 +0900
Message-Id: <20251208-transmute_unit-v2-0-aa17a6848afb@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF+gNmkC/3XMQQ7CIBCF4as0sxYDGCh15T1MY2gZ7SxKG6BE0
 3B3sXuX/0vet0PEQBjh2uwQMFOkxdeQpwbGyfoXMnK1QXKphOSGpWB9nLeEj81TYq2xgzKD7VA
 j1NMa8EnvA7z3tSeKaQmfw8/it/6lsmCCacPH9mL0oFx385kc2fO4zNCXUr6Wyu7qrQAAAA==
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
 Edwin Peer <epeer@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f911b18-2ccd-4b1a-1ed3-08de363fd62a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eE9EeExmM042dXI0eUwvVXc4N1kxN2orN1FGOGR3OXk4ZGEwdjl6NzBhTjlo?=
 =?utf-8?B?Q20rWmxMSHlUVi9vVkkrd0F3TjlBNEovcEEyQ21ZaXpvNTArQlNhSEw5T0Fu?=
 =?utf-8?B?cWZDTFkzcEN1c3BMTUR2R2pXVnFBdk9weHBrOWtoNTJpLzIzRCt1ZStxZFNr?=
 =?utf-8?B?Y0VkNGlBaDZlREc1L21YRE5xSnVsSllwdkwwcjZXaG1SSThvSDlMMzhOWFVY?=
 =?utf-8?B?dGJ5NUdVQzFjSVFwajlFc2hXUnB4Ym9rcmVhYk1yUUJnQ05RM1JZbUVMb3Bx?=
 =?utf-8?B?VS8zT0Z6Q01Vejk2blRDR0xtZDEwTUlvb2ZVVjNOZ2w3M1pQc0VjNXh4cmJB?=
 =?utf-8?B?VVFZNE1mT2FHOWJ4RFBJSzk1TmgyVzhCc3pnTEFNbnFwNk5hWndqeVVlbEtV?=
 =?utf-8?B?SjBscmJiVE93d3dpWE81Qk5uaXVOWW9GKzRaQWcvSmtHTkJicUV1S053M1RW?=
 =?utf-8?B?NkFrYmtsM0NDZEtvQ3RjRDdLblBWR212NHJKNDZKZ3N6N1BpUFlwK245MU5R?=
 =?utf-8?B?OWZyUldQcU1waGZERDV3VzdSSXJhTGtCd1JNb25DeDZnUy9Qc0l5VXg2SWx3?=
 =?utf-8?B?RDRRTGd1UGRiNDJVS20vcUhmeXdyRzFYVFM5U3JKSVNJUzEzeWlESXRhd3FI?=
 =?utf-8?B?MXVvbDJUMW9NSzZHWmtEa2ZIU2o4OGNnSWV3bzNSK01jcXU2VTR2RU0vQ2RY?=
 =?utf-8?B?eG9FeFdKSlc4S2FSK1FGVlk0eGNjUmFEby83ODFPQWZKSUw3WDhQYitZOGNl?=
 =?utf-8?B?emgzeE5wOGN6dkZmNVlsUlR3VEtGNXhkbzVadHlKWEcvajEySUdZQ2xUNUg0?=
 =?utf-8?B?NW51eTNQSG0xanRkSC9XZjd6azNvYXl5ZCt6ZjdkajlrT2lpS0ZvZFJkZkFR?=
 =?utf-8?B?SUR1MG9QM29xQW40ZlRmZjZUV0lQSU5UTHdvT05KcHpXMTUvVFp2a3Y1TWhE?=
 =?utf-8?B?S2hyL012OHZEU1U1VXUyWDRhMUFEZ08rOGZUamEzdWkvY281cWZqNDlBMHVB?=
 =?utf-8?B?TE9TcXFlUUhqbCsrOXlleWYzT3VKbFlGTG1Td2NiS0x1MWZjSVYwVkk5VEJp?=
 =?utf-8?B?MEdKY1U5VzhjQjM0T0UzTXNlcmFCdEJ4L29PVUsyalYxUTZ4NWRqaFQ4VGlJ?=
 =?utf-8?B?K1h3cnVJbG9hQzJIMStqZnpZWUxKcG1mRWM0eWl5NFlDcHhJK0hMR2RUTUZv?=
 =?utf-8?B?V0ZsVG1RWTdCTlI4ZVJ6dG9wRlNTM0VBQ2NXK2U0VkRzMVZZRVZIUjBOaXBo?=
 =?utf-8?B?OGpmNjJmbVRKU3BwTm5GbU51SmpaNzJ5RmMwMVhHL1lUb1pXbDNVNW9vdGJi?=
 =?utf-8?B?UWFjdXRwNUszakxMbWNRbkhHeHB3SEw4bjB2VkZHeUNaOVVmcUhscFdWZWJo?=
 =?utf-8?B?RWNmMDVaS1AzRFpBVXhWWVlXa1h0c1Y1UHZtQnlUNzE0TjdUa2lPMzJvMGV5?=
 =?utf-8?B?bk9qa2pPdzZyY1BWVHowT2ZvMUNCbmRsU3lVN0JjTkVuREFmYUFoS1hid2FR?=
 =?utf-8?B?bHBabVdDbWoyTDhBeUlYTHplVW9FcTZEOEtjV21IMjZKNWpHMEpzdUJ5ZFFL?=
 =?utf-8?B?YzJxYzBJTisxZlM5WWNPb1FkSFFrQW4vbUw5ZXp1SVAyTzlTOXIrRENZam1k?=
 =?utf-8?B?N3ZsT0IyYmVPcmsxejFXamVrSGgxL0htSjNyTnp6YjdzSDZGRzltSUljd0Rw?=
 =?utf-8?B?TG4vZDJoOTdBVkd0cU80b3Rrd1BnNXgyS1MxejE1R3lhMWUveEZSdjBHa2Uv?=
 =?utf-8?B?aVkvaU85RmNCSlBvVGxnT1o3Y2xDV0N6NFJCd05zano4QVR5dXF4YnVWSXBP?=
 =?utf-8?B?RzRuaDhTa3RuNExiVFV2QjVUMWtPOEt2VEtHZjcxWHRYQWszd0k0Q3ZjQUJa?=
 =?utf-8?B?WXQvTXdxSEpFVHJicDl4ZXFWdllobmdrRVp5RURmWHREdVBWYmUrekpEMVJJ?=
 =?utf-8?Q?10G4UpLhie3L8+d+D+rzsjeyPuVb2jvt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzR3UnVYc1VXWHo2Q0Z5WUZrOTRFU3p1THpGVkdNTFZ1cGlYcFl1MDR5WXVV?=
 =?utf-8?B?dXJoOWFwV2Z0c1hEWFRWYUI4K0owQUdiOFFzbFJoMlB1b1NOUGVGRzIxcXBL?=
 =?utf-8?B?a0taV29yQnJMUXZoWTE0ekRFaG9mNUhUdmlrT3poMnIvQUJZaXVoUzBMTGsv?=
 =?utf-8?B?ZERGbjlJU2tNNk84L3ZHeG1aQVZCSHRmVUIrZjgreWVmS2FHa21tTnpRTTdF?=
 =?utf-8?B?Njlwa3JYOEN6NkFJajlsYW9EUjFYVkJkU05iOFozQmsyLzV5WUhaaWdZeVZV?=
 =?utf-8?B?Y3E1S3Ribm5QWUJjNk1xZ0MvaVFLTzEzcm5Rb3dVT0JiWDZINGNzdEI5UmhR?=
 =?utf-8?B?dUxxRXkxL0U4VVRrTVlIVW9Scm0zMUZpRGhad2lwSVZZMWVpMWhNbEFXa0tm?=
 =?utf-8?B?QnhaY2pMMWJOSlhVd1Jhem54QkViNlJ1NnNTR25IVWt6MkdzcXlYMEZpRkYr?=
 =?utf-8?B?ME5MV2ExbXBBbWtjdUROdU1KTnV5cVRUczl5UStnWndRSmpBWmxwTDFvTTYw?=
 =?utf-8?B?YVhPY3IwNEtTTXdlZk1sTS85Q2RTQUliN0hUNHgvYit0K3kxMndQZ0xOV05t?=
 =?utf-8?B?WVlGZXFLZEJzMEhnOWkvV3k2LzhMMmF5Z3h0SWU2WmMzQjhlK1JJVGZTeDlM?=
 =?utf-8?B?MEx0eExEK1BqTlVKU09vNDFqTEIvUzZHMmZpOFFtOUtVMDFHbXRpaDdCQkU2?=
 =?utf-8?B?eGpYYXJMRmJ1NDFqd1N3dVpGNFdDUUdtL1k0L3d5dFpXczZhTUZ0OTN2VWxq?=
 =?utf-8?B?ZE5WWGZaN3lBMXRTaDkxNzdLVDU0RitrdHBCSmhmTjZwQXJZU3ZTbVlyK2J1?=
 =?utf-8?B?MzJwbDdsREsxYVNkSEd4REhleVZlR202YWQveVBIbSs5Z3YrYXhZdnUxd0Iy?=
 =?utf-8?B?a0hiMGJiZXpqSVNDZHBwbXlIWkxESFY4bXBuVGh1YzFpQnNFcWZ2bEJVclN0?=
 =?utf-8?B?RkRsMFZ6Rk5ia3VVbXYvU3dQRVhORFU3WVU2QlJrLzlnTS9ta2NlWmQ2RGVi?=
 =?utf-8?B?dW92ZE5JSTF0TlR2OU9RNlU0c3VLSFRuYVhRcGx5K085ZXVvYlNsbUNPY29B?=
 =?utf-8?B?MnlNSmFkUmRSUGNFRWx3dDdKRVRiWHRiSVRMSWlHbUtIVVZyUmJrQXBjUklm?=
 =?utf-8?B?M1FUQ3JJaXRycHh3UGZqNHFiUTJZRUhKeVdGcHhoVkppbFBmTmViNGwzckZ5?=
 =?utf-8?B?NXR4anM2bDBFbmZ6ZzVESHQ4Q1dpTTFmUEx6UEN0cXdwZWVtdWVhZFp1N0I2?=
 =?utf-8?B?YmdPMmo4bFhFaXRvR2FqNC9yd2NsTjM4OFo2dmdsdTFKTWMwd1ZZVXZzUXIz?=
 =?utf-8?B?TldvbnI3SDlGSUxSWkxySFl6cFFucGFWN3JWUGRHQk1qZFMyOVh3ZUlQWFhC?=
 =?utf-8?B?ektIMGVPUlpRWDc4bUhabTQ3NGpaaGNnNEpTaUtUUmpVUFlFWWg1eWgxTGp1?=
 =?utf-8?B?Y2Uyc1JkUjBEdnQvWEZHMUY0UWFIREh6U1BzeFRadjVMYmE5alptalozQ0Nt?=
 =?utf-8?B?NEZPZlBWU2h5UWNOY3RzY0xmd25JdHllVlAyY0t6dDg1MFhMZXBrbnFDcU9H?=
 =?utf-8?B?U2psRE11OVJCVlVvNVFsczV0cktsc0IxeUszSk1UTDl0VW1DYjhuU2N0VnRR?=
 =?utf-8?B?TFRiZ2NWWDlWNzM4MisyNTc2R1dETVQwdXVGWE9xbEcwclZ6bEhsVmZyenJ0?=
 =?utf-8?B?WTVvVzE0Smg2NEJvZ3NEZCs0NG5jWnkzN293d29NdWd6TTBBMGlSazRXWDV2?=
 =?utf-8?B?UDl3N0haNUJZNWtPYXlKMi8vWndCMU8xajRnYnp0SHFZVDNCcXNIMDhqT3pu?=
 =?utf-8?B?cW5vR2RaUEZockE2UnVBbnNVNm9RMXM1d21XMnZ4VjlhdjZZQWkwSlQ1WXAw?=
 =?utf-8?B?Tm1iVTNKOFRvNVg5dXFIZkxyQVgvbHQxeXp1Q0QyZ0dQTzdVR1F0c1NMUGN1?=
 =?utf-8?B?cTYxaktLS0hhOEV6ZHVVMlpLSTIzeTlPOEJ2UTFSNTN3enQrNDhLT3hBMjZq?=
 =?utf-8?B?MDRNaUZSck9Vei9QZHJ5RGtMejE3TjdCcHdHalZGMWRlL21GRGE0ZEs4bFJ4?=
 =?utf-8?B?SEs4MVJPRmpxTVdDNDgyVlR0YzN0b2FqQ0RsbC9Bb2psV2swVE1BSEtEQStH?=
 =?utf-8?B?ejQ2REdmbk1VZEpDa2dlWHk0djNLdDRCeUdQZkJHdVc3SW1EL1ZwWHZ2elZT?=
 =?utf-8?Q?ZPbLsSGhwA+TOC6lccArQ9EyEaIsQ918e93/n4lXCOy3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f911b18-2ccd-4b1a-1ed3-08de363fd62a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:54:53.8488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VR7ZTMee+IM5pYpU0urP4EWHQRQWw1TBj1Tg2YyjAaVvt16OavznfDtcUL6ISOxj+RGSJY0yM4WkkEPfxBAadg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8005

This is going to be useful in Nova's GSP message handling, as some
messages are empty and we need to explicitly use an empty structure for
them.

If accepted, I would like to merge it through `drm-rust-next` so Nova
code can start using this feature quickly.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Make use of new feature in Nova.
- Link to v1: https://patch.msgid.link/20251208-transmute_unit-v1-1-680c7386b5d9@nvidia.com

---
Alexandre Courbot (2):
      rust: transmute: implement FromBytes and AsBytes for ()
      gpu: nova-core: gsp: use () as message type for GspInitDone message

 drivers/gpu/nova-core/gsp/commands.rs | 6 +++---
 rust/kernel/transmute.rs              | 6 ++++++
 2 files changed, 9 insertions(+), 3 deletions(-)
---
base-commit: ba65a4e7120a616d9c592750d9147f6dcafedffa
change-id: 20251208-transmute_unit-78ab58ba9e6e

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

