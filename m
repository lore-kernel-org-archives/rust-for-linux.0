Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013034.outbound.protection.outlook.com [40.93.201.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4F428FA9A;
	Tue, 24 Feb 2026 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771948848; cv=fail; b=lNpGpwxDGvN56DXZnOH3qrih37cnstNVIoVj490LjiknlUsH+8oT6llx4QptJ78RNtExwIzKw215DQ4achpcqerSMiTBNuxM2uxy2g3eDonghu734QORl4ogmwr9RxI0tEbCUNfPdlS4Lc07Lyd+rHHr0+1RqAT9ePs/2LNGcvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771948848; c=relaxed/simple;
	bh=k4gwOIjwm27fIZESp5zL/qA7kl8/5SFjuGjZPqoTLS4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LdJA2AIuLwrJgBTHkToIV0vQHabn/8RGxcYatC61kTIAMnGSbq2F37MFM/SGAJVDzk3VbcQZ5BPsxv3GqXRg0qzDcW7V0sbP/NhTcq5N9rM/e72aiCmlQ1ntUgzUwLEselUZZuDyzktFRLnzuRNvXnXUbsJX56ZcPkmjCw9e/rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UokBFR9j; arc=fail smtp.client-ip=40.93.201.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UokBFR9j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPMtOQVj5dPKAwOKx9i2khia12EJ6Ks5MdmCt6Ns0NN6H24rgk7bw3MgGOkdFMlWmNyGRTJELCDAFtgTZv/rCupfEaz3gyCPGYbfPZI3Q1u0J7jZ35+Q4xkOoeRYPjB72gUNFUBDFlVkQ+t2/oZUdMSD4bCF3vlPARvknqJBooXv2elllV4y1ugjqTsHQsIwhVr2fRlgsQFxQbgbuTVPBGOk6E2BBr5v4puGfv8fhHUv7L3xhEYjuJfn6tBQIlVTOyuPIYWU8PqjQBJk/lG16eUV4J8z/7jZ5x8uaAJh6Rt5nBaFuqlIhIG7vqwket+b1MK71sIy6ehzhWW6dAnjJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PII/8Y3haWZpCeuiwRr6lzeNJRbc4m6y5wnIf1yBHM=;
 b=IKUzMmaj+WdAZd/YRtIMa1iOmKcNrOJmXPuUvrcxMDy+IgpzOv+xhSxzbj5u9n1lXSnmLhYslnbcVrirwur4wEGH6KgcNlXxEgyiEK3h65PA331ryjY9VyPA1+ofkqEw5rcWxJY+B90D0MqfTJay0Th6nMDIunmac2zJwrh8FE2ZwI/wCxt30EpkN6ANpfie6RwJx0wBIpj5y5RyMxJAEJYFDA/MBtSteIlF9XsPpfeMZJe9ORdggNFeiBI7WPz0sJeSdpfPb3s+eHLnXTHcHttw9ZB8oMJkOiQ8GKOnxCSmukUgMaIwbWhOap7VUBIKKr1vNT15ztCu4xpb3RVBYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PII/8Y3haWZpCeuiwRr6lzeNJRbc4m6y5wnIf1yBHM=;
 b=UokBFR9jM+wzoWddfEMtrA92kOx+BUxVVUEEY6Ydt7dGffC5I5eT6/dwQFmGDTwpDud5gEboA5RItugg5mQfsBXlakkMBHEhIEKLqvQAUVL9BvllhOrXMJMabGJqjNXKXh7J4Re5uvhykZ9u2Els5j1wr6VeYKi+i10uuvErdmYSoUJrlg/gbrd3/vDRoc2HFvfMqdzJ45YDotJ1hJkwNewwa1TQ+mU/nrenZnSvF3wOZfQ+APMR4DGTDgOEcd0TzdcNDnQhDEMmKOGNFAOLnmdOZI3vEexpqaFcPSjYqpDJRQ4QiS5VWy5ebEQiXWbYWRbcYAyWnpANZuQ66cnyvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DM3PR12MB9436.namprd12.prod.outlook.com (2603:10b6:8:1af::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Tue, 24 Feb 2026 16:00:38 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:00:38 +0000
Message-ID: <7cfaea1a-52aa-43ee-910c-7fa09c7f0f4a@nvidia.com>
Date: Tue, 24 Feb 2026 11:00:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Alice Ryhl <aliceryhl@google.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGJN2M93S4ED.3272CCZWMRYOA@nvidia.com>
 <a7be758a-65ee-4572-b8ba-6d4a8d65af73@nvidia.com>
 <CAH5fLgicH9u18pWYYkQqxZBT8WEig3bDP8JFT9VfDtG6McijQw@mail.gmail.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <CAH5fLgicH9u18pWYYkQqxZBT8WEig3bDP8JFT9VfDtG6McijQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::33) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DM3PR12MB9436:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e2a6f94-d907-43a9-03a2-08de73bdd9e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UytLOXdFUnhtTVpBRGZhUkE2dHRkTmlmVzE1dDJSdDR0QTlPRGpPUnlReHFJ?=
 =?utf-8?B?TTY0aUxjcTNWR2FlZ1I4Y2xDR2N4ZEtGZlNTTUI3NU1ablJpUEg2SzhUVDdu?=
 =?utf-8?B?VUNITlMwTm9FSTJJZGJZT2lOc2l5SHhnTU4rRmo0eVNvTjNuMWVOcDVBMm5L?=
 =?utf-8?B?Y0xKb1ZBTjFubHFrYitsZUpDNGZpK1A0MXpXc1hhMU4wKzRvNThKNUFTQ0pO?=
 =?utf-8?B?blVZK2M1QXFYZTM1OUJuS3QxVHU1UmFsbGhzbDRMMy9xK20zQyttTG9RMGxQ?=
 =?utf-8?B?S2k0VEozUWpqK0hPZG5ROUg1ZHQvMm1ZRVh3c3NXT1NKaFRDcDhSNWlINzJU?=
 =?utf-8?B?UitpbnpzL3VZUnRmOVNuZ0ZRaEJOcEtjWTN5dVhGRVJIMFVhZEdLQi9QSDlX?=
 =?utf-8?B?VGt3UzF5NlpjMVBaYlRhbndQQ1VoTjBldVl3VFhPZUNxaDN2eEJwVW9HZVpM?=
 =?utf-8?B?aHhsbk9IMGkvRWxiOVhUcmkyRGV1ZHUzZTJDWStHY2tlbWYyNnQ4S3NlbUU5?=
 =?utf-8?B?Mjl1S1BpU3ZrWUFzRWJpY2hyZUUyMXUyZHZCVHhsT0xwTWFnYkhHSlhNb0Y1?=
 =?utf-8?B?T01rVVUwYzVCREZYb3c4UkRaWkJSWEx0Yy85aUdzZWVWZnJydDZBb0lRcGhs?=
 =?utf-8?B?TWRUQ09uc3l0V1BKWmdGK0pVVEtINTM4QVoxc09yaTBsMkt2WnNsOGJiWitB?=
 =?utf-8?B?Rm5QbE9TM3BSNDE3SnhkU0RDWnJKN2pHR2NNYmtGblpBc2NueERzZXdNTDhx?=
 =?utf-8?B?QkROS1YrbENFT0RQZW1tK2dYT1ZpZEpBNVg2UWM4OXN2UTA2UjdPWkhRcGFt?=
 =?utf-8?B?NUNGY2NrRFUvTFJBWTh6NXQvMlh0VkR0aEkxTmpqYklUM2ZHak9TL3RvUjRD?=
 =?utf-8?B?eTBlRE5vVzR3N21FbThmaWZsaHhnS1NUM3FQRFVEaExGNzdYR3lCcC9qejlx?=
 =?utf-8?B?U3VKL2xFVFM5K3Y2dlgvY2RyeWlEcWRFUXZvcDc4cVJDeThvclU5alNRMjdh?=
 =?utf-8?B?SnczR3dXV3kzckdMVkJMbm1BOUN1OTMvZXV1eHp4Zk92Q0tySXJMVTJYQUFS?=
 =?utf-8?B?OFpCYURxYjhOd2NXYlRTWVl2WjhmSlJ3NjM5U2lhWnhkcldWQW1kUVFJSW9Q?=
 =?utf-8?B?VE9mREJ4YUJMQnptdURNK0ZxakRqaERJV0w5MzN4NTRrL0ZWN2Fua0g3NTlx?=
 =?utf-8?B?WFcwb2FDYTFtY3J2R2tLdkdzY21tUkY0WkxLRkR6T2FYVDJGVWlHVmd3REJB?=
 =?utf-8?B?TWE1UlRueE1kWXdLemV6Q3lCYmZiWUlkNVU5MkVuMUhEaUpaUENzUHBUcXVi?=
 =?utf-8?B?a3lsNFVkYjVidUxMZ1loTk5PVUh5K21BN1hqdU9zejJweXV2NGU0dU93bFhO?=
 =?utf-8?B?Nk9FbG5vVnpkQ1J0RHRWOWljZ2lrbjJuSms0c3l2MVE0dC8rOGliMFl2R0hB?=
 =?utf-8?B?aTQwZXJqZTRBbkJWSHpkaGNWdUpCM2V5WDBGMkdOUDNVckR5TS9WZHdxYjR0?=
 =?utf-8?B?UG0rNWRKVXVESWpTSmVNMlNKNW51R01SQTFXNTRvdzhRc2tteWVSbkY1eFBO?=
 =?utf-8?B?aFdxUXJ1dVJyQXZ5MXM4WGxwSlZJRWRjb2Vkd00vYjlhV2NmTmVxc0EvSkJi?=
 =?utf-8?B?eWJ0U2tkVFJKekxaYk5HVXltVVVxOXFhSFVRR3lnRkNURGJaL0JtUWppQzZS?=
 =?utf-8?B?ZTlkVXJVL3FleUFVNDlOVzdKS3pIeWY5TmswcmE4UFZFc1h0Zm9XMW9tMlFn?=
 =?utf-8?B?RFR6YXY0WDhrOE5YSG1xL1luSWtjVjhiRlg5RXpEUDkyTFo2Zk9Dam9kTXE3?=
 =?utf-8?B?bG9Rb1B2dFlXbUxFOUVvOHlhaVFOemEvQzlOVkFKUzFXNnVuVVByTWRGaitB?=
 =?utf-8?B?V1kyajNMQUFGaDNkNkhJZVk4SmM1L2xuckord0cxbUJ6M0R1TEN0STJiYzBQ?=
 =?utf-8?B?aEsrZSt1cWIrMW1vMzI5NUxNNjhobTNxUWlVNUhqeHdnaFR4eG9rUlBNSWJ6?=
 =?utf-8?B?eWxBZDFxeVpPZTVHUWdmWXo5b3ZQdUREZnVHV0s3NE1rWHVsZTlKMTBVd1NS?=
 =?utf-8?B?Y3JkYjUzQkk4U2grOWE0eENIUis4SU5GVHRQZWhiTnk1L2VpUy9ucGI0TUdO?=
 =?utf-8?Q?YwDs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHhISzNKNldNT3VJNlYvOG5pRERXZFlBeGtuZVZRZzRoSG1zdStZTVppWitK?=
 =?utf-8?B?RXZ2NUtBMHZyaU8yd1M3QWd3UmozeThER2l5eDJhWlIvU3NkNWZJWUxxcFJL?=
 =?utf-8?B?SDNKVkhCTXFweTI1aUpPancvY3YrWmVUVk05YmUwaEdVS0U4elBrUklVOGM0?=
 =?utf-8?B?ZTRIVUtPQjQ3SjFyajJNQkhHb1ZQV0NQS2F6azArQlNhb25FTU1DWHJmbDFE?=
 =?utf-8?B?a21rb2U3S2xveXhpV3Y0VVgyUjAvZ0g3d1FqeXNZNzBqOEY2b1Z2dGVwckpZ?=
 =?utf-8?B?R01LUjVqWUpuUjJ5L01VRUE0ZDVKWjhrK3pBV0VjMUlSaGIwM0cyQVBhLzJH?=
 =?utf-8?B?ZlFBaEZQYzViTVFuTDVxNW5yU0wvZ09Xanp4a01hbU94ZXZjVy9ab2VwWUZP?=
 =?utf-8?B?NDdXQWIzOWhSYWl0aEZ4WUhOMS9aU1g2ZHNEVWVoSldTWE53UE5pRy9qb250?=
 =?utf-8?B?YmQ3VDNzNy9kQ0xWUkdiaHo2S2YzeGViNkU1TnR3WTg5VGhIK2x0NkI2N1ZK?=
 =?utf-8?B?eG5xZVNKUEpITWxtTld3MUx2a2VKRG5zRmtSVUswaVl2aVRzVFdUQUh2c2xo?=
 =?utf-8?B?YTV1eUlLc0JoR3pHL0tibEV5Q0hVMkpxdC91SWU3MUcvNkdvQjRwRjhEdWly?=
 =?utf-8?B?MEVab1VYTk9rdEpDRVoycWxrYXpGdThYbTNBT2J4b0JieUowT1daTlZwYktO?=
 =?utf-8?B?RkhRVUpwRzlsMXFsNC9xZDVlR2hzSGhQRDJmdTBpdzZHQUJNdWIwU2pXdjQx?=
 =?utf-8?B?L2ZiTCtqaSt5eDg3S3VpZXBSNU1RUVRyQ3RLWnNJeGgvNVZKbFFnOFN3aWVB?=
 =?utf-8?B?U2hMZG4wWlZnRTdmY0FGVUJubEZyZURrVk1raGZQR2Vwc1gzQThtTUl5S2R0?=
 =?utf-8?B?cWxzVzR0bVZTSjczTkx0VGsraXRIeG45dEhxQm5Rby83UDB4ZFg3ZG1lYk11?=
 =?utf-8?B?VXFEdnAvS0FIY2kzRFdITjlSenAwbmIzVXNDYXVGNFhHZWJCWGFpNVliY1hI?=
 =?utf-8?B?NWJyeFV6OW9FSEo1bytIQnBHSUEwYzgxZVpCWnBrSHA4NnZjN3ZOMk1NMlAx?=
 =?utf-8?B?cmZmREEzMmZjWFQ0YU52d0g0eTlTc1BLTWdvRTJ6VkFSUG9KVG5OdTdqT0t4?=
 =?utf-8?B?WlBkSHdVcGtuQVRDajlocWxER3ZiemtvNEhxclFlejNCWWtzenFSUGhoR0d5?=
 =?utf-8?B?KytZVXVJSkJETjhiTDRpSGlkZG4ydVRMbEx5c1dXQU95SEplYmVkWjJRL29L?=
 =?utf-8?B?MkFFNEZmT0grSm5HajdrUkdlUjRZQlFXSkJDSWhDTHJISWR3dHBOY3M0dEht?=
 =?utf-8?B?bEdkdnhCWFJwaXZwVjZINnVkcUdIYUVCbjBzVmlCam9zZVovMjNHSTFmUExJ?=
 =?utf-8?B?OUpBNlpDMi9zeEJIWjlPWnpSU1MrQmJoTC80SnZDM0pkVldKWmUxN3ZMNU13?=
 =?utf-8?B?N0xnL2xNcGpFT3V1SndnR29TTUcxdzJ1SEdZelFJeDJ0TThMbUhSTXpqZ1h5?=
 =?utf-8?B?cDRmZEEyeEZkd0c5cUlrOXVremRKSjRYNkJmblViZldKQXJQYUFNTitUZkVL?=
 =?utf-8?B?cXhhcXIwSTFjWE05cWNBWEpHUkVoM1BmdWI0c3NsMG9Ma0RUUEQrallZejNo?=
 =?utf-8?B?ckZRSmJkYk03ZGJSZmk1VHUrcHVFMjJmbDZBQ0d6b2xXS3NBZlFTeGdMNHc5?=
 =?utf-8?B?Sm81YUdrQnBLYjhTbEZVUWR6SDFYZzJLQVY2bUFkME1ZT3ZaQTFNVno2T1RB?=
 =?utf-8?B?MGIrcDNKWWRoT0VMbk1ieThiTVZkK3oyVzBiVDFRRm9IVTh4akpOQm5raDZ5?=
 =?utf-8?B?ZDI1WnlGVGxWZTJTRVhZLzRDWm0ra1lWaGpqQ3lkcklUU1FDYWFqaU9oQ1Nx?=
 =?utf-8?B?WHB3RkdUUHdOcy9VK0ZGYW1iV3pBb0h5NUxPbjNXdzB1NGNXUFdrVlRESW5y?=
 =?utf-8?B?WFhuVi9ieENXYVhUNTdXbERNZHo0R3IyR0lvRmo5Z0p4STRVa1BqOVlFekVD?=
 =?utf-8?B?ay9haGlSRit4eVlLN0RDWVpjT2E5N0NkS3N0TG1EdDhQdmlQZEtrNkJ0OEtQ?=
 =?utf-8?B?M253ZkhlK2NLTGxnT1pwT2lSdmM5dFRzL2tWb2xFcGxmL2lKWVVmdHNaNFpI?=
 =?utf-8?B?WHpHZlJuU0NlLzIxNzVHVURFWHYzc1hoQVEya2ZSVDNyMjZFV0VZNXFCZ3Zp?=
 =?utf-8?B?MjlKQ2gvWGNrYkNsMDdSWjI3RHcrV0l3SG1nOGh4RDhtQ3g0ek5ueWF6OFRt?=
 =?utf-8?B?YWJ3K3pQcU90NmNyVWlXbDJEd0ExOC9aMk1lV3MvMVBJQ1JJMlhUa2ZpamM2?=
 =?utf-8?B?VG4wWWhBbjZyVmx1Zkl1QVBuRDNqdzdoZVQ1dXN0c0dZRnBXRCs3dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2a6f94-d907-43a9-03a2-08de73bdd9e8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:00:37.8314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZJDgngswiC20wWRffObMZDyO+nFoL+bvI2F6ldqeFbxCmkwD9mxNPKnYykyT5SAmOpMx1NaZrT8ctdarHHMTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9436



On 2/24/2026 2:28 AM, Alice Ryhl wrote:
> On Mon, Feb 23, 2026 at 2:13 AM Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>> Hi Eliot,
>>
>> On 2/20/2026 3:16 AM, Eliot Courtney wrote:
>>> On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
>>>> +/// Create a C doubly-circular linked list interface `CList` from a raw `list_head` pointer.
>>>> +///
>>>> +/// This macro creates a `CList<T, OFFSET>` that can iterate over items of type `$rust_type`
>>>> +/// linked via the `$field` field in the underlying C struct `$c_type`.
>>>> +///
>>>> +/// # Arguments
>>>> +///
>>>> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bindings::list_head`).
>>>> +/// - `$rust_type`: Each item's rust wrapper type.
>>>> +/// - `$c_type`: Each item's C struct type that contains the embedded `list_head`.
>>>> +/// - `$field`: The name of the `list_head` field within the C struct.
>>>> +///
>>>> +/// # Safety
>>>> +///
>>>> +/// This is an unsafe macro. The caller must ensure:
>>>> +///
>>>> +/// - `$head` is a valid, initialized sentinel `list_head` pointing to a list that remains
>>>> +///   unmodified for the lifetime of the rust `CList`.
>>>> +/// - The list contains items of type `$c_type` linked via an embedded `$field`.
>>>> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compatible layout.
>>>> +///
>>>> +/// # Examples
>>>> +///
>>>> +/// Refer to the examples in this module's documentation.
>>>> +#[macro_export]
>>>> +macro_rules! clist_create {
>>>> +    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) => {{
>>>> +        // Compile-time check that field path is a list_head.
>>>> +        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
>>>> +            |p| &raw const (*p).$($field).+;
>>>> +
>>>> +        // Calculate offset and create `CList`.
>>>> +        const OFFSET: usize = ::core::mem::offset_of!($c_type, $($field).+);
>>>> +        $crate::ffi::clist::CList::<$rust_type, OFFSET>::from_raw($head)
>>>> +    }};
>>>> +}
>>>
>>> This uses offset_of! in a way that requires the offset_of_nested
>>> feature, so it doesn't build in rust 1.78.0. The feature is already
>>> added to rust_allowed_features, so I think it's ok to add
>>> #![feature(offset_of_nested)].
>>
>> Maybe I am missing something, but why should the feature be gated behind
>> that if all compiler versions (>= 1.78) support it either in a stable way
>> or via an unstable feature flag?
> 
> The rust_allowed_features list only applies to drivers and such. It
> doesn't apply to the Rust crates in the rust/ directory, which need to
> use #![feature] annotations manually.

Ah fun! Ok, I will add it in in. :)

thanks,

--
Joel Fernandes

