Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011063.outbound.protection.outlook.com [52.101.52.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D286027FD7C;
	Wed, 17 Dec 2025 03:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765941140; cv=fail; b=hF0M6Q5rp8IN3Zs61clgUBnOyamBsqxXMBD7G62Et1CPwn156UDKiEUIUCjem1MCROvbTLpSIZ8Ad3kCbJtsmhGJNLUDlZU6/VjhGG0oXsNTRP9joY2u/KAW1ZGALlLlKhmSRmkAQgW7m98sTyC5uqpbz3okpuak+hCtXui4Akg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765941140; c=relaxed/simple;
	bh=+Zm3IAhPSddlGMwhHER6+Jt0/v60TRkZFwO7FR6U3W0=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=GBedMUY6sUOSoCNgKngGJ7KH2N9ebP3tiHLuHT4QyB+gnaJskbU6FYNeTE7mdfO0yWlJpwL5Dv89KWMVmcrxjSHhyHqI4K7gKsnS7Q3cIVLkHu87aMRdfPkRgs++NqFdhFKrl6iS108MSvbaYR/ECBreudTuI2cr6a8GgsTufaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YNtfZvv4; arc=fail smtp.client-ip=52.101.52.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YNtfZvv4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQYJdLUYKowhMP9mVXbT2AVF/n9SS9R979hffuvJu5jRL55PkcZ1NLtwVln8CeNQi5JPYgH2HpgtGwS9wp1U5UkscENiwX8+bnEnE4NkA9qwx2q6QTaPJux/Q/Emt2KHfp0hpRWenrvENKPx2FHW68ok4OhhRxVIt86l67D78pbzb8Vm5E2lZbDdDKpW4nI9F7YsZOKHxg1ua5+irZDZnS8pXlgeYNyzx8eh5evB9hf092OVZ0XL3hT1YMYJNOfqG15INAcZoJrZH0jI1k5bNR85wGPiZ+mdkzIPNDKFcXNqjBTJYgBkTMiFOGRu3HLxXYZE9V2U2YRd1NYtmXSF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=to6W25bFfe2qbzS/H9w2csxPG+QxUOp7/V4bQlkRZyw=;
 b=SRHGb710xBayxwVF7DtXQ6pwpByGq4zN2zLX9XKu/6bRkkAmKgmeOx6Rhu7cVDQDWEsslO+aedkWN4jWSV18RbmatPjDWmfVFW+5fC+h9sHo5Eu7DIopB/I8Kqe+U//EPMRR+KWq9Moerb17mKo2BsUTYjPZp03XVIKJ7pO8WXQUWfARTjkaHKACdOce8Z9Kwo7nHhJ6a0YTy4RBpFZaMANWLzjvK6XiF55eU6Wms4RxxhekAudiVKbRd4dtZcdFxDOhg8KNpYbepvuN8IIS3s0xUUNQPEfpz+toyvizpWWjGw9Ua08CC8L+EpRdDkfS9SrxbAuPsWtlPtWc6oH7FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=to6W25bFfe2qbzS/H9w2csxPG+QxUOp7/V4bQlkRZyw=;
 b=YNtfZvv4DwD5jux4z3G7EeHnaO2V1SqcnVaKVFdO5jW/mBTCsg9oAK8YkqNA0GU+OJcUJeX7QMrOlMTKl29p+dNYtVY8JACYXG+VpegE9s98THTLNrEMmSdIBLX6wKMjnQbp/xY8ukwkt4tjdVJEFumH6ix999p3NBtewNZMqt6/afsQWx3u1GsxHvk5szBjalZwvuToSYeVNuSdtHiyzzqvmZ3zIgnAUlbfUqlWM71VDz0Rkrn1feaxPA+GNXo+Cw2n6h7INSojRAoguzYxghiPVEohzSsLMABfcXU0vpUVw4tEDd/iWbiwk0XNH9nTQpUy70ApfrK8WVuJKTlfXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6388.namprd12.prod.outlook.com (2603:10b6:208:388::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 03:12:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 03:12:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 12:12:10 +0900
Message-Id: <DF05VVOUA70W.30GJE9P4Z3OL9@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Matthew Maurer" <mmaurer@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] rust: Add support for deriving `AsBytes` and
 `FromBytes`
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251216-transmute-v2-0-b23e5277ad02@google.com>
 <20251216-transmute-v2-2-b23e5277ad02@google.com>
In-Reply-To: <20251216-transmute-v2-2-b23e5277ad02@google.com>
X-ClientProxiedBy: TYCP286CA0326.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e92659f-e97b-4f39-0e8b-08de3d1a13b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nm8yd0JFaTYzeUVBWFJiWkpwMVlCYnVYTkJwRG01Z2QwZGg3Snl4RGM0VmtX?=
 =?utf-8?B?RWsxOUp5QXcvdUFDcXFjaEt6S2FFNGhqQmtQcTA0MHlyc0xUSk1VQW1oeExX?=
 =?utf-8?B?VjgxUmVRWDJUWEVQRVJ0RDM2UHdaWUJPWnpQWGJLaXlTN3pWenNPTG5qbnRD?=
 =?utf-8?B?ZWtTVkprUDg5bUJncWJOUC9iSXVqcWdDVDhuWG11bGd1Nm1Kb3p5U1FUT1B5?=
 =?utf-8?B?NjIzWkZ2bHdkcWtzbVRDTlJyS3lwZlhYZmtzUHVHczNhQVVQdm4vVjJzWHpn?=
 =?utf-8?B?cFA1M2d2SFhXTVVWb2RSTlF6SklWUWRyUi9HK0ZZKytPdjYxbGVRUUQrcWo2?=
 =?utf-8?B?QmREOUNKdUF2VEFWaWtSdngrTlVtazZNK2RSV0VmbThpMFBjL1F2bGF1RE1C?=
 =?utf-8?B?TFFoWmdhdWRWc1daM0dYNERGTUU2ZWloSlBmQW0rVUpQQU0zUXZkK2E1TFV5?=
 =?utf-8?B?WWszYXVUdzVPVU50UzkvZUNudExGSlZzZS9EWmQ2aE82L05kdWl0RUJmV3Y4?=
 =?utf-8?B?VEttOGRLWHJWYnRFaGsyVkpjS2tOWkVkSW1DTDdiMnZ4NjFNOTljd0I1RmpD?=
 =?utf-8?B?Q1RQOG9sYzFIWlhWa3UvRGJEZjlHeTFUeHZUZXpwYW5Ua0t1QWhUZ0lnU2ZO?=
 =?utf-8?B?d3RINkFFZTBOdGhUYXNBcHVCOGV1VGhpWWk4RWdZeWxTc0tVUE1jcXpybEF3?=
 =?utf-8?B?Y3FLTndYaVFFYjZVOWc2L1I3UjNGV1Z0VEllY2NnRWZiTm5mNUVJdHRKSXBH?=
 =?utf-8?B?RkhzeTJZcEhESk14cVRUQ2JaTzBnRkJCQ3d5SDJTaGtzRUh5Ym1DWWxnRHM2?=
 =?utf-8?B?VUErUnFGVHhxOU1wdzRRUlVHYmlvbEhIUzhKcjdFWGgyZGRBMzJyMUNZclFR?=
 =?utf-8?B?NFZ1aXhLckpNUFlUR3hva2tIL2djSWpwdno4elc4VzZleG1JeHJxMWt1ci9L?=
 =?utf-8?B?cktaUjM0M1RuOE9RYmxndEdyQnRoYkQ4US9YTG96ak56T3Z3TGUrdnRKa1JM?=
 =?utf-8?B?VzVKWDdhK3MxNkt1RXkyNnNtT2xqU092dGpPK3g1TmN4TWhSZXlpYXZQa09M?=
 =?utf-8?B?SGtOL2VmZlhocGc5ckN0WnkwbTZMV1Q3YzVBUjl0Q1BkdjlVbGQrT0kyQWRk?=
 =?utf-8?B?Q3IvN21vN3BOZGtHdnNRVFdxYkhMNjlJZE5qb2cxazQvR0JQYm1WTlM4Y2Ex?=
 =?utf-8?B?U1A0djNibVJVRDlPNkdLc3hNNXFNVldrUndPcklwcWdUT2JGTTBHcXZXSVpl?=
 =?utf-8?B?bEJiUVNxQW1JTjdyMTA2cnVaK0k5b1ZVSjVkc0swbnBBbWhBcmIwVXdwOGo0?=
 =?utf-8?B?dUx1Y1prYlJvdEd6M0RTdlVlVTBGRVExSXFEaWN3bTNjSUpWUDR0bHIvZ2xr?=
 =?utf-8?B?c1RsUHphVDhBYjNRTXRxZFZUdTBsTjRkaTJqam1VMnJmSmhXRG54anJkL1d0?=
 =?utf-8?B?RkZwaDhFaGZSRDdGcEtKYXpNa2N4TnhiTjVpVTVQdUpXaTY4cFpGMmlKMmg0?=
 =?utf-8?B?WnBRQXc0TjdVUUxxQzNiNkZGNVB6U0U5RFFoZmRVTXRGZlFpTUVZQ0w3MGdk?=
 =?utf-8?B?di93bis1ZjI5eWxtaUYzSStVa0tUL1BRYUZVS2ZWc2JDZThtSmR2RkxpeHI5?=
 =?utf-8?B?UW1mWHJHV3lnMzZFOGZwNFpUSmgzZ0FlTCt6QUhGT2IwdklZdWdxRE93ZHhn?=
 =?utf-8?B?am50clJjUmhPNk1HYUtsNkFONzBkYkRZUG1hOGY0SlJPanEzdDlyQjlGb2ZQ?=
 =?utf-8?B?WGFBN2EwUStBSG9TVFBERFp6ODhiVy9Pa1pNQVhVSm5nYVNSVjkvYUwvQUho?=
 =?utf-8?B?aTlscE5kNlM4aFJzRS8wUjREb1R3Yk5HOWlTM3RzaldUdjVId2tpQUhLV2M0?=
 =?utf-8?B?VXVyZ1RVejhOSU5Ra1hGUnBHcDFxVTFXSjMwZllBeUxFbVdsV3dvdE9qQnZv?=
 =?utf-8?B?MVNOaXhtVUE5bHg2SnVGL2xZcDdPbGZ1M1hDMllLeUxoNklqdEN2VHhSUzlr?=
 =?utf-8?B?dVZZMDE3MldCMWh0WTJHVWJJdHRJSjNVVGVHRjVtSXF5b1hYRCtLOThHSHA0?=
 =?utf-8?Q?14dW3Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NW8wZjJoOVUrcm5MWDEzZ1BBVXVzSjVvMFhrN2Z6aTNQU3VaQW82M1Q4ZldL?=
 =?utf-8?B?M2EyeW14T2FIMGNtWmJMMUVhS0h2L05xUVpvVUIvSSt2MjJrckR2clFVYkJm?=
 =?utf-8?B?Z3A1ZHpEdnRKdnBubVQ5VGRTSTgrbENtVHpvQVdkTkd4WGpyVFA3ZW03WjMx?=
 =?utf-8?B?bVBPSmZidEI5V0RiaUo5MUVjRU5Rano0cFROS2h0WUR2dEM1bG5NYjBEdDdj?=
 =?utf-8?B?Qm5WSzJUZDRUQXNNWDNmSzJkVHdDMlFKZnBxUFNRTGJzclpXQTR2QWZoTElk?=
 =?utf-8?B?Q05jbVJzczZxVVQ2ejZJWExBT293RUwyUHh4UkxxOHdEaVBUOU91TEpmUWVY?=
 =?utf-8?B?QU9HWFMxOFkvanZWeW5pV3ZPTkl3cTZJK3YwNXNVUDZRVFRLZDl6c0ozYkFl?=
 =?utf-8?B?MEs0cEJJdHFrbG56ejJESzZubDJiSDFkQlZqTDhGaFZ1ekJsb0VVNGxSeUFI?=
 =?utf-8?B?UGIwMkgyYnl5MkFxUWRhRWN1ZmZ1SklSejd6SVYwOFNWOGdjb0VCLzFCYmlr?=
 =?utf-8?B?TXlIdnVJV1NiSXhkTWE3UVlxc1BHRlRpa2ZoaXRZTWdvS0ZPYWtuZGp1NHB2?=
 =?utf-8?B?WU9zOVhSUzlWZys5WVFQdy9FOXhsdFRHTnI5Z1ZRVDlObkRsQ2ROSzFjcXZi?=
 =?utf-8?B?NFFaSDVVMDBIeTFDY3pXb1NEUWwzUXFsK0VkOW9pREFvNXZmclJCYlVXZWFN?=
 =?utf-8?B?ajhMTzJBV3dnNy9USkFheDdQSks0bEpsTGFJanlWN2VCcjRZZEFKbHc5WXpV?=
 =?utf-8?B?ZWJJRW1sc3RLRkxwK2NhUkMzVWoxV1BDR24wcFRYVndtYTBNRmMzTmF0Wm1w?=
 =?utf-8?B?enpFbVEyUDdKQ1JkdVVrd2R0Z3VPWlhjYjFIWEw4Y2VKSk00S3UvM3lwbUNB?=
 =?utf-8?B?dW4vSzZPZlZxdGgydGczbm5hQ0JCMENoZE9ZRy9POWllTTFvUy9SV09sdlpU?=
 =?utf-8?B?dTFaUFhSWGVRWS9KdkNaRFJOWFpzaDFQNEFSL1dGajlTOGF2RXVpOGswRlNC?=
 =?utf-8?B?Nmg3WmpscXZRWTBtem9QVkVQejFiZ1R2QmFIVE9WeXNyeGkvTFlOYmhoMXdx?=
 =?utf-8?B?aXQ0Y3hwaGJ2M2VTTHUzbGtHQjY3OWpBTHB6NmMvTTZNNjB6UTJvamZoS054?=
 =?utf-8?B?QzJCc2JwNkdOWDFCMk0xcU43YzJDYzVaMUtBUmFhczFQTHFNQkM1MGdCSHpV?=
 =?utf-8?B?VjJlNGtCT3hOYmQ4U1VhSEFncE9IM1B2QnFieHFMb1pWQkx0anNKMDFNaTcx?=
 =?utf-8?B?c3pTRmFhSnh3clo5VjRaN0g2RHV2NW02NUxLcXlxa09zQi8xS0EzQ0RmLzdx?=
 =?utf-8?B?SVkxc2ZiKy96U2ZJbnQvN2MvTm9ZMTFHczlNWnV4SVJPMGUwSVcraXIxNXVU?=
 =?utf-8?B?MTVNaVRRZkFNRDFZSmMyYUlud3lsbkF1U3B4SjVmckZQVnR2YXhZOVRmUjEv?=
 =?utf-8?B?MVI5c09aU0tueDhSeXhydi9CWFdLSE1qZlVKcWprZ0d5QmVJZmpycWRDZHd4?=
 =?utf-8?B?QzE5UU1GZFNrV1hKKytlcjdLR2YyeHJUS1ZaOHExbWFacVoxU3N2NHVpbFo3?=
 =?utf-8?B?YUhVaGN6eGkvVkRnaW1CVFZlcy9WTGY3WEg4SU5tYUtFWnI2L3NUTndVd2pK?=
 =?utf-8?B?UThUK2UwLzZUY3ZLOVVZRUt3cVVEVVNOeWt4MXMraGQzOE1wMnBURkVwUXFh?=
 =?utf-8?B?NnVNQUhCbENkU2ZqNjJNYjhCSm5qWG1reGhlYnBwQnRlV291VENjQmZqVXpa?=
 =?utf-8?B?dndaQ0NjOVpja1E4aStvMERnemRERnVHYm40U0lFVGtwd0hlNzNDMzN5YnFJ?=
 =?utf-8?B?ZEhjOTBkN3k1YlI5N3k0OU1SQ3dIcXRKanRVWEhzOFlJOG9kLzZ1THJZMi9E?=
 =?utf-8?B?ZzZrZmRrOTBFZTlBSjZiWGxOWXNqeVNkWkdSeDdWVXRBTkt2bEdrNmxPWlBn?=
 =?utf-8?B?a1dzc2tNS3Jrc09CbFU4Y2lOT2FUNVhEU2ZDY0xva3BlZHd4RE9XWjZqT2ZE?=
 =?utf-8?B?em5PK0NWdVYwTGF5UnpzOFI0VjdPL3dZVHVDYjJ6YW5oWkI2MGhGTXZLa1Fv?=
 =?utf-8?B?VmRJdFgwanhIaThwUmFoa0kyS0s2cTFoRmsyczdzdk1LM2JPMEdvWWI4WStO?=
 =?utf-8?B?T29ZOU9ZQzd5c1k4TTVaM3FVVlFRdURzQXBEQzRMMzdXZUZaV3dybTVWaWk3?=
 =?utf-8?Q?LxAbQRyHFaQXVE92IvwhfIbvoZPvdPQ3QmTsIZLjL9YJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e92659f-e97b-4f39-0e8b-08de3d1a13b4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 03:12:14.4731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3T3WHMyVUn7yGXitS80BEVki00DsmB5koUuA99OGqA9J7hjCLLmAcBp/+p9I3bPtSGTI8c6SV2h9Rpym5FOt8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6388

On Tue Dec 16, 2025 at 9:44 AM JST, Matthew Maurer wrote:
> This provides a derive macro for `AsBytes` and `FromBytes` for structs
> only. For both, it checks the respective trait on every underlying
> field. For `AsBytes`, it emits a const-time padding check that will fail
> the compilation if derived on a type with padding.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

I like this a lot. We have a bunch of unsafe impls in Nova that this
could help us get rid of.

Amazed that this even seems to work on tuple structs!

> ---
>  rust/macros/lib.rs       | 63 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  rust/macros/transmute.rs | 58 ++++++++++++++++++++++++++++++++++++++++++=
++
>  2 files changed, 121 insertions(+)
>
> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index b38002151871a33f6b4efea70be2deb6ddad38e2..d66397942529f67697f74a908=
e257cacc4201d84 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -20,9 +20,14 @@
>  mod kunit;
>  mod module;
>  mod paste;
> +mod transmute;
>  mod vtable;
> =20
>  use proc_macro::TokenStream;
> +use syn::{
> +    parse_macro_input,
> +    DeriveInput, //
> +};
> =20
>  /// Declares a kernel module.
>  ///
> @@ -475,3 +480,61 @@ pub fn paste(input: TokenStream) -> TokenStream {
>  pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
>      kunit::kunit_tests(attr, ts)
>  }
> +
> +/// Implements `FromBytes` for a struct.
> +///
> +/// It will fail compilation if the struct you are deriving on cannot be=
 determined to implement
> +/// `FromBytes` safely. It may still fail for some types which would be =
safe to implement
> +/// `FromBytes` for, in which case you will need to write the implementa=
tion and justification
> +/// yourself.
> +///
> +/// Main reasons your type may be rejected:
> +/// * Not a `struct`
> +/// * One of the fields is not `FromBytes`
> +///
> +/// # Examples
> +///
> +/// ```
> +/// #[derive(FromBytes)]
> +/// #[repr(C)]
> +/// struct Foo {
> +///   x: u32,
> +///   y: u16,
> +///   z: u16,
> +/// }
> +/// ```

One thing I have noticed is that I could sucessfully derive `FromBytes`
on a struct that is not `repr(C)`... Is that something we want to
disallow?

