Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011033.outbound.protection.outlook.com [52.101.52.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4ED376BFA;
	Thu, 29 Jan 2026 07:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769672763; cv=fail; b=L9YluTU1l/KX0YT0j8tS4J9E+eXLMheTdAqwOZjMMxm6Zjr8SaXCW5o6oA5myhdNJACRrP+0BOgzug1WM0OiUt1B33Va0aIT8KLSCyJl/VJ6nqMgMwKm/cUKliZxd4VBi0bUzpTc687wh+PqRdu3b+y4Ugzn4XF+GJ/PS5TYoA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769672763; c=relaxed/simple;
	bh=8rIUzWOw2m0lJks0qf4JTj2XKh35kN4qUVdz1y2VMU4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HibIo3wp8hDPguK0g48k3Pxq3/xktstcXPGgGs2LqlVTQ+0kkMIEIC8Y6cCGQOxurAeU1KqklKQvgPuOVvLv/KbD1xpev1W1Wx33OtUg7ZjPlg2Tn3CwW8VGl+6DcVIg4UAuxwKSM3AmJl1N74r5FfqeBCKsRZkEvDiTMF9Rox4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JksLdvE+; arc=fail smtp.client-ip=52.101.52.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JksLdvE+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0thSuc9Yy7QJRFkoqoHcSKE6exLon5mUY0+nHALGfbc545kYDAEYAtGAbbJioNP4wJ6cZko4aygwpphCO84LZYpcPwe6ZVNypJmZMoLCjGOW1W32mSnsgXYFsulj0y7eAqxuliTUN8Kh8Dh7IgPlPejFXVza1MKEUDwzlSGdpngYQmBlbSRzf/uwe8/Pv3Tr2Yx36cByZCyfLwd5qulP9fdVMnWfienmsJapt26U/fr9U4NZVjGhPEBdbVqFg62nCGRK9HZSyqd1J3/qMtbhIOg2ZY9OB98LH9/QOiWfmn08oUljAFwzgl9Mphz4B58lmc9r0aDeQ54f/4qxpAm4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDQME6pifpINFTLaMtqEGsoeM7XvyNJGzwHdXKLNwWc=;
 b=deFgzzLD5lVdl3mNK3XCRmIBWLp8YnnA4Rlh/mn9u9gKEcP9zlg9fEPTzBRfg42SHUZkHc++x0rj5qpdIHzGn/mr3SJvp8H4XOseTOVpigDJh4hNA4hcsSv8F3MgI/+X/tFq9qDfsJXvG2/iDv5bUGlXY5fCTHWi5/ONiY7yjpc/9FEHp4aWFUtCoZHtX+mcSua1eo7DWwcBiXtjbgzIg5tK9h2zD3Me9Bmn5QakMjwfv29fAVMmQDXGTgZr5fhI7GbDHzEDpTUwfIEqS3Ogtz8ZND84C4Qp0Hxo+mILaacTRDuK0CAz4GsQpBsfuhCSQGTVJzRwHrNpDeTRsZUYyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDQME6pifpINFTLaMtqEGsoeM7XvyNJGzwHdXKLNwWc=;
 b=JksLdvE+ZH8Jx+wrbN7QIupSOFdO5I27cKGTxu/LnrXhiiL6XQBHE2X4kFU2t8lYx3AZWmexG5v2DWLSAkBDkq1nGCcZiZygBR53eJoUMF2I7dpV+PxBLnH0e4Op2Iiz/sNHhZaaYpfQUWHPff/Q3g1ol6b42eweABuOgA0YBHl6Ruw82ZbQuK6FSqAHRrCXcRsvqFfZ+t8/2TOm3Dr1kXiRPqsBGj0zE51+Px7vgHxqXed3NofwTWYcO9V/MKDlmwVMsM9AoeABWk1GyWMoeOr1zdYmOmyjvFzIMSalWxo9SiCknebLwt8N33QUzxrSWQYfmq9nCitkgmb9dD7rFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH3PR12MB9124.namprd12.prod.outlook.com (2603:10b6:610:1a7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 07:45:57 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 07:45:57 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 29 Jan 2026 16:45:00 +0900
Subject: [PATCH v3 2/5] gpu: nova-core: gsp: clarify comments about
 invariants and pointer roles
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-nova-core-cmdq1-v3-2-2ede85493a27@nvidia.com>
References: <20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com>
In-Reply-To: <20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0074.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::17) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH3PR12MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: f1950ca4-b2bd-40e0-2755-08de5f0a7000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ci8yZHBNMTVHaTlDMzFFQVJFd1p4U0wvUS9rSFQycjlLUURzRUJDQStXNVd6?=
 =?utf-8?B?c0tMNCtzMmNwVW1wUS9KbCszdk5lVnp0bGx0UGtadU56dE9JMzVRN0ZvZXFt?=
 =?utf-8?B?S2l4b2V2WFRiemluV0lPMTdwVTZUc1p0SWZya1pHL3ZuMzk1elBtbzNQWE5V?=
 =?utf-8?B?R2NKNDA0MkJiOEJ6NTJxTGZ3OXBydEE5VDdSYWVHQnhlR0FyWFpNY2thRVND?=
 =?utf-8?B?ZWUwblpTUTd4TWdoUnY0eEhPVE1rOTlObTg5M1V2Vit4MDNlMnc2SDhod3BK?=
 =?utf-8?B?ZVBZaGVBaXhHeHlEN20zTkJjT3RaVUh2SklmaVdESGNjdWFRYVE3RDQ4dUpD?=
 =?utf-8?B?MS9ndURjSnllL04wV0hRb1FFOXJUYWRSR1pwb29ZY3Byc0VHcmh5UFZTV3Q4?=
 =?utf-8?B?OXVMc0JvZjZVcG00VmFzb0srNTdjemc2L0F3aWl3OHhxd0FjTXFUWGNIajEx?=
 =?utf-8?B?UG5yNVpsRFNsNTIwSktwLzBPQWpETXdJc1E0YVUyZmdUa1Nrdmg1ejExaVBD?=
 =?utf-8?B?cC9ZRlc4dmRKSTY4SzhZMDZ4SXljWEVLYm5QcW5lNzBTcGtXZ2VUWEZuaUVH?=
 =?utf-8?B?YVB4R2swRkR2clBwWU5udno3V3RteHQrK2M1d1BQVDAvK3JzOVdUSEg0Z2Fz?=
 =?utf-8?B?a0JKOTNNWXpVRUFHSXZ3ckh5YXJHcWZyME1lOWFNWXZ6MTBsRDR1MDVyK1lC?=
 =?utf-8?B?ZENZOUU3a2V4RXZUY21iOUNTY1BpWlRRT01VTDlnT0FLbmJRUjhLYVFPbUpz?=
 =?utf-8?B?QUl2QWlRU2FTUjJSYnhlT3VPaHRHOUtqN1dFQ3FSZ3c5M0VsWU5ma3J6RWVW?=
 =?utf-8?B?T1BPRmVpT1Nab2MyQzY1L3pwdHNsVnNDdVZlUGYyTm1CVGhSa0dpamRibUJ3?=
 =?utf-8?B?TmV3VENGSHdzNEM5YUVqdmdrRzZ5NUx0eWRhWFRxRWtRQnNVV0VlQkovOUNp?=
 =?utf-8?B?UlEwOWxtZm0ySEhHWXhEUThhbXY0YkJkdS8zMElEbXAwcU1RNUQ4UG10U1E3?=
 =?utf-8?B?K00rdTRScm5INWJiTlFKdDJVV0VRZHRDeFJvT25rSXhpNW9wb3hGaithR051?=
 =?utf-8?B?V2V5MFZrV1B5djh5cU9HeFJpeTdPSE5JVkYyMEo4SzRxNlpQa1R0VGVtU1FV?=
 =?utf-8?B?RURpaVRYV09LeHpVL2tERGNXaC9uTjh1MmE3VzdlMmcwTkNhbDZuaVhMNTdl?=
 =?utf-8?B?WmlnM21Vek9HcTdua29qc1FCaTRWYzVlVUFWWnBqOVcwZnZVbVJsZ3VHOVhn?=
 =?utf-8?B?Ry95d21KV1dFbkw2WktxQjZYZE8vbTNZMHJ3eG9Na3ZEQ3A5ME5SWDFMSyt3?=
 =?utf-8?B?SVFPVktxNklhOTJ3RW04WVI2RXNwMXhIc0dmVmhBSmkvbDBXbEFFbkRXeEdL?=
 =?utf-8?B?QkxCbW4xckxNNmNnYnk4bFIrUFVYankreWNRc1pSZHIxYnpGVHpvcWZWNk00?=
 =?utf-8?B?ZnlFVEJHZ1RKSWpGYnlxUXhwdzVaZm1wK2xRY3dpUUhIT2w5WC9QcGtTRXVY?=
 =?utf-8?B?amVWdzkrejNadTJZUm1Zd2s4cFE0ejZJRkw3VnJySFNDeWdpUGZ2Q2dHK1No?=
 =?utf-8?B?OVdzaVptZUJVWlllNVBnOWIrdDUraDJTbVdHNkE0V3NMd1FaenI0c2RRSm1q?=
 =?utf-8?B?R0JqWTQzMHpYYkcwcndUZnk3MzQxUk44MCtHdlNuWmJjNFdaNmxlM0NnNjEx?=
 =?utf-8?B?OGdHTnRFQ01SS2tYTjZNa0NMS3UyODNScndqRkdSTkRWcWoyUGp2KzhOOE9K?=
 =?utf-8?B?VDhRcktMMzJSM2pUeks1dXgwRmNsdW1lMnl3eW05d3liYmxuQzJYQi95Znkz?=
 =?utf-8?B?V2NzeTVlWXNZOWEzTGszUCtNMnRibUxabGlLZEdkT0ZvcEloK01wazk2NERC?=
 =?utf-8?B?bFBlVmRqYWVCNlc0emlQQmpiRjhNcWJwc0dPRVQ2My8wRy9Bakh0d0F6b0JO?=
 =?utf-8?B?UlhuT2l3bHZtNnVUMWJCeUhOekhDU1FhOXhlSWUwWlB2NEN1V2FPZ2wzOE0v?=
 =?utf-8?B?SFVtUXg4bE96VW9YdHRwQktDMWZ4Sy9lVTVYUXBLMUtqL0NwbXVVSEtJam90?=
 =?utf-8?B?ODkzTElNL2RPb21PT2tZVnYrRm9lQ09velRWN0NYNVREZ2dkUG0xL1pEY2xN?=
 =?utf-8?Q?Kg2c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXhUWkJLR3dSdml2bEwrVDZTMmtKRHFvTHNTVW81ZFprNHhEMmZmTVNKcVg2?=
 =?utf-8?B?WGNCT2J1ZXdmajRhVlRGSWRQSmVRa3FWcnJCWWFoTVhyU1VRRS9qZkJEVCtZ?=
 =?utf-8?B?NGdLQVZ0eFpjSUZ4bGpjODhlZ2R5b0R6cVU4QkRHaEo1UmlBNk9EdngvMENs?=
 =?utf-8?B?bUs2WXJEVFNUQkRybHV1VVZWQ2hVTFhveXVuT2FqMWhFeTFLUkxzRGtQV2c0?=
 =?utf-8?B?N2dCWElJUG92c2VNdTRZMHFUV1Erb2tPWTBWM24raVIzTkkvOVJUaFpHMjQ0?=
 =?utf-8?B?bGN6Rkt3NDFyU3lGMHNzTVUvT2xYWVpxVEluMENDdFc1Vm9vUUpWdnJMdzhJ?=
 =?utf-8?B?YXRieTZuUmt2M2oxQ1VGc2ZIemI3aG5KYjJ1SlZSdW5LbTNxZ0RBeWlGdGp3?=
 =?utf-8?B?NGZpTDJ3TE9rcEMraFhGQ1lzWGpKUnRSQ09SQzdkaUU0Tkc0TjF1a1F0emw0?=
 =?utf-8?B?SnRrUVdycCtTZld0ajJHNjhhV1BjMUozaUJyN3N6cXFyUG5VY1RGV2hGSnRx?=
 =?utf-8?B?ZWZMMDJRN3BLV0piNmUzbzByM2l1d2hSTmRiamNqREFEcnBBRzMzMXN3dnhu?=
 =?utf-8?B?SnRnQTJqem04cWxmOWJFQW85aHZ1OHcybEFwUzJreFJpZW9RMVdoMks5UFhG?=
 =?utf-8?B?a2F5a25CQXhBWUhTd1NNM1ZxaDhCZDlGUzFJTEJ2bElGdFhqYW15aVBZbmhU?=
 =?utf-8?B?RGt1c00xZlhGaGlnV0VMYTNGNjJUVm9ZQncxOHhIOTJGWm5paFJ0UkFaTGJq?=
 =?utf-8?B?L0tyOW9VVWdvUkdlblNMak10UE44R1NTSTVqZTBmYVRhSks1djJVSXIwZXhB?=
 =?utf-8?B?NS9pVHNvVml1UU1sbmQzZGNXWVJFbTBEQUF3THQvblRkaGwySnlLdHRDRXlY?=
 =?utf-8?B?UFcxRXkyYVZyMzhMdWY4U1l6MUlKSjhjd0k5WUc3Y2VscVlDQlUvc0pVbHZD?=
 =?utf-8?B?c0pseUY2eTlyeG5JbkJrSDh4ZzhMMFdrbFpCUUxENFNnbkFUVWhZdkdOYm5J?=
 =?utf-8?B?WHdXbDMwSFhudnhuOGdMOU9kN00va0QzV0g3WUd1eWJkOGRaeFFUTmZVQnho?=
 =?utf-8?B?UVl5Tlc4S05NQWlmS2g5YnloSFMveU9KYWQwSnF6TnoyMjVsNE0weE9VM3BK?=
 =?utf-8?B?NFBDQ0Rjd3lzVG9vMXA4Q2lWajdoVTdhN3orMnIyZklKNDZSN0QxNU9uSFc0?=
 =?utf-8?B?aHFPOE01akc1dkJzQ0x4aS96ZnJKaExwWnRpOWwxWGNrbVZSYnlPSzJaeDBa?=
 =?utf-8?B?WlZvRHhjUVA1ZzVKa1FNVkZKeHoybTQxTTN5SFNtemU4M2tDQVpMbTN1VFd3?=
 =?utf-8?B?UFpPZklQMHFYRWwweC9HNXU5YzFRQmRXNkZnOGRQWDhxVmN1TWUwRUh1ZFpq?=
 =?utf-8?B?WHZVd2NOMCt6VzJHRUJqa2pnbHNkQk1hdVYyQVlVOXNCenJmNVN4SThFdjVt?=
 =?utf-8?B?TEFPaXBWMm16ZzF1UkdvQTh0Y1IxQ3liSW9pc21hd2hITmhLUUZtWndYQ3lT?=
 =?utf-8?B?QUZrakhQdG9FQ25PdUlUNnErWGRLVW0yVzFHM1RGbmZ1eldzZnpPSkk5NFVy?=
 =?utf-8?B?WHdhcGhOcWhBOCtaRlFJSWxLc1RQdzZiWmREQjhZSUdIRTZ3SzlReVpTWWNS?=
 =?utf-8?B?bzBSMHBGY3RRWFZOMXV0TnZ6OGFlRjRBek4vNExTU3JBRmxUL2xaM1o0RS8r?=
 =?utf-8?B?cTdCN3hYanRlK2ZqWFBMMU83ZmtiYUxQTDRRS3I2QjNKVk9WTytzc3BzMlA4?=
 =?utf-8?B?cDhocHpWSlNLZ2RwYmNaWnlLejZSZFB0VGRtQlpKZUlFUHJGSVdrdjZsdTlr?=
 =?utf-8?B?L1V5R0pzWjl0RDdIS3FRa0p4cTQra0hUcFZtMjYvM2taa3Q2bDljdWZGNXpQ?=
 =?utf-8?B?TnF5d0FIWThCVGtNeUdJZXh1LzlKWFR1b0NVVTcwNVBhUW0vdzZuaVAraE1Q?=
 =?utf-8?B?dnlHd004MmttcnVpYlF3b044N1ZVNmRJUDJ4RHgvNDBVUXE1aW1QQWVsbEJH?=
 =?utf-8?B?d3pXMVN2Z0JqT1hCTjdaQjRzK0hjeWorY2tIQk92dGh0RVVDak95L2M2TlpH?=
 =?utf-8?B?NWxKQ29BVms0Q2JjUnEwN1psRk0ydmhhOFdUT21YdDROQTBBS1JKZ01EQWd3?=
 =?utf-8?B?Rm4wSUdpekFsOEhRaXdMMVJldC82NENqKzZWMGJjRVY0QTlBWG1PeEhudWgx?=
 =?utf-8?B?YVRXQVpTNGRWV0JQZC9TT0dOWnhua3pVMW5uMnhvQUUxM1hiS2UzS1R3Njc2?=
 =?utf-8?B?WVZxZ1ptdWUwWlhkRGRPTEtTNDZVWklwUTAwUkVVdndyVXJ4TWkrQmllR3VE?=
 =?utf-8?B?RE5QakxNTmhSamVQT1Q0ZDRiZmdubm1jSEZBcG50WkJMeWkrOVBnZEc4T0E0?=
 =?utf-8?Q?e5Jc3HUhJNZ31eWUSPFduD2Izig8Q8ZSLuTIrkivMrbeX?=
X-MS-Exchange-AntiSpam-MessageData-1: HadPSpDMCBwB1w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1950ca4-b2bd-40e0-2755-08de5f0a7000
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 07:45:56.9840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0WUoHtSRAabfI36b2oClrPfT10cozSwaqQ1r/bJwMj1ZNdUaFJJFOL4T6dW6vcdIvf6M4nJ4ZcRhG7b8K56aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9124

Disambiguate a few things in comments in cmdq.rs.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index f139aad7af3f..0743597779f1 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -161,12 +161,14 @@ struct GspMem {
     /// Self-mapping page table entries.
     ptes: PteArray<{ GSP_PAGE_SIZE / size_of::<u64>() }>,
     /// CPU queue: the driver writes commands here, and the GSP reads them. It also contains the
-    /// write and read pointers that the CPU updates.
+    /// write and read pointers that the CPU updates. This means that the read pointer here is an
+    /// index into the GSP queue.
     ///
     /// This member is read-only for the GSP.
     cpuq: Msgq,
     /// GSP queue: the GSP writes messages here, and the driver reads them. It also contains the
-    /// write and read pointers that the GSP updates.
+    /// write and read pointers that the GSP updates. This means that the read pointer here is an
+    /// index into the CPU queue.
     ///
     /// This member is read-only for the driver.
     gspq: Msgq,
@@ -222,7 +224,7 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         // - We will only access the driver-owned part of the shared memory.
         // - Per the safety statement of the function, no concurrent access will be performed.
         let gsp_mem = &mut unsafe { self.0.as_slice_mut(0, 1) }.unwrap()[0];
-        // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `<= MSGQ_NUM_PAGES`.
+        // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `< MSGQ_NUM_PAGES`.
         let (before_tx, after_tx) = gsp_mem.cpuq.msgq.data.split_at_mut(tx);
 
         if rx <= tx {
@@ -257,7 +259,7 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         // - We will only access the driver-owned part of the shared memory.
         // - Per the safety statement of the function, no concurrent access will be performed.
         let gsp_mem = &unsafe { self.0.as_slice(0, 1) }.unwrap()[0];
-        // PANIC: per the invariant of `cpu_read_ptr`, `xx` is `<= MSGQ_NUM_PAGES`.
+        // PANIC: per the invariant of `cpu_read_ptr`, `rx` is `< MSGQ_NUM_PAGES`.
         let (before_rx, after_rx) = gsp_mem.gspq.msgq.data.split_at(rx);
 
         match tx.cmp(&rx) {
@@ -315,7 +317,7 @@ fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
     //
     // # Invariants
     //
-    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+    // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn gsp_write_ptr(&self) -> u32 {
         let gsp_mem = self.0.start_ptr();
 
@@ -329,7 +331,7 @@ fn gsp_write_ptr(&self) -> u32 {
     //
     // # Invariants
     //
-    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+    // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn gsp_read_ptr(&self) -> u32 {
         let gsp_mem = self.0.start_ptr();
 
@@ -343,7 +345,7 @@ fn gsp_read_ptr(&self) -> u32 {
     //
     // # Invariants
     //
-    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+    // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn cpu_read_ptr(&self) -> u32 {
         let gsp_mem = self.0.start_ptr();
 
@@ -372,7 +374,7 @@ fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
     //
     // # Invariants
     //
-    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+    // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn cpu_write_ptr(&self) -> u32 {
         let gsp_mem = self.0.start_ptr();
 

-- 
2.52.0

