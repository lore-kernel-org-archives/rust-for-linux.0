Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012047.outbound.protection.outlook.com [52.101.43.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE7F392C24;
	Fri,  6 Mar 2026 12:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772801411; cv=fail; b=oiVT383oFveynWpqc+La99FN0RInpDnsJRkw8JmWENVJ5fc/Z523EfePbboZRYoDWtiPREaOTIBGhjfhVIgq75F03zK0DyoCBsdizgOwiDgLfoMU7Ei9pADYgT+i2KYLL7PyvHkmKeiV9J8xibs/p51ZmjrQazu7qo8nsATz9/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772801411; c=relaxed/simple;
	bh=O1KHvtbUnoh7RPBXS1hsqX1fl+9RPIa7BLyRmpBR6rY=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=OIqbgrbwKE2b66m7RwmU4KoOvf+Ee7oJzCPxok2XAATU/mP1aeh3ohQRbgrj+DZhGx6BivDTMDW/Qx59H2PxfPUq+NUboFC/ip+nscCW9elIU466Igui39bA/WTf+m8Q+rg2RWr4zDgmr5iVLPBsXHy9Y7tWH+D1+10Lltxps7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kJBDMIC5; arc=fail smtp.client-ip=52.101.43.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kJBDMIC5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjmdoPzPvLKpc4l3BDKAR6XdTuCW8Jw2mh2buNPzjIR/4h9PdJUD+rPX4+jnNnwWBBv2Gg/UORa7NCH805ToPQgyyZjv9eJknWBZCS+UDug4Ccb9GoEqrEzm6WBvyOybGXkGmeWgqcJ3v8BySN7i9/fcFre2EY+z8kwiYZdPLkQkNO2iw8A6BbPIp7MACJ3QIzWyImyyVZXpEfzZwPU6L6Ex0gzmX20mC+fe/kB23DU+6ZovJPy5N2mH9rE+I4cXN1HuGQPXNvUawR0NVGzyRqGmNaoNKZ1lexJWMcY8Ym1HZF6o7TJqzfQzMBN+8QUIffrl/hMBwV5Ygr97RX69tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCUpoJuDjo4d2wwvUDrL4x35TIXI0izxllVj1ZUCRhY=;
 b=OP1cVVB3yC/5VvAcLZbpuUzZZ53vLzOijEqSAKq/yUQ+8uwkOsSkOx7MR5zc6clJXTC36xyOtwCEN/h22vZgp1UH7OT1K+519z9ddlNGmwf3GC2sVrCkq5jZ3G5chI7fAqmg9LYz6yoO/aHh8c15Au/LR8xccbheH9Mwdzik2wZx4+MGYZBQL2xAPYfBfOaq+pUm2T8ypWBRc9NWTT7n156QaowXiRLFLkM1wsPLTbGJj+BTmJ/zV8YbKPkiDoCPF5ZxA4OHsdN4jaVFVUnWOyTrHTE2Bqpz3eOQlMn9wa1s1FiDmfqnwu+JS/wBhkJMGY2H2rOBg492PAXw24o4YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCUpoJuDjo4d2wwvUDrL4x35TIXI0izxllVj1ZUCRhY=;
 b=kJBDMIC58fxZ0ioS1wUQiM+hEfneKx7t9c0ml9aG6gUb3YMVIS2PtWcSDIpnNGTeqLscG00MNH7Y53oSgVnqwZbkp8mMXsp3cii1SNK3dyXM1T+4cn4tsQHSYeSb3D0HxGt3Si3HFCXeY5vevsuyFRIzKC503Jfm56yudUiwY9KMLgLUOUzlzY4xWHvhLthjrTjoQ/Q1lhQ4XgAgFVwcdGBAA/aRC9EdWMch+lv+12jw2I8fuvKDriYS87K1jS6SBslAkoSgcQvOsUy0D2HhRDhfV3hMGH+xZM6d/k0880InVg3UAm64eD/eNGR/cD5RA8YXZbb6MNkeal2JcEUcYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4375.namprd12.prod.outlook.com (2603:10b6:208:24f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 12:50:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 12:50:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 21:50:00 +0900
Message-Id: <DGVPNC2HE0JB.1HOBJZX8L8XMQ@nvidia.com>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
 <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
 <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
 <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
 <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
 <DGU7U81KKLCD.2LEPJ73BGLQU@garyguo.net>
 <DGU88IHVRYHD.9WP9Z40UAN37@garyguo.net>
 <DGU92W2W71JI.HBIFK6L78F9C@kernel.org>
 <DGU9AZ43QK6Y.115RDSK0M9JY5@garyguo.net>
 <DGUAC0GJRR0Q.34WBS7BIZ58WF@kernel.org>
 <DGUB44J4FNCA.32QOV1DYI7VBK@garyguo.net>
 <DGUBN1HP1F8I.2RZGSFCBO9FQS@kernel.org>
 <DGUCFC9NJG5B.Z7YUXK4NEE04@garyguo.net>
 <DGVGGGBSC9PI.1TJV2ZAIML0BI@nvidia.com>
 <DGVMXCZGEWV9.41R0TPTD22S1@garyguo.net>
 <DGVNJ8ANGP3Q.1RAGWU2HJGRIB@nvidia.com>
 <DGVO2O009306.GNU06PZ13VA6@garyguo.net>
In-Reply-To: <DGVO2O009306.GNU06PZ13VA6@garyguo.net>
X-ClientProxiedBy: TY4PR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:405:378::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4375:EE_
X-MS-Office365-Filtering-Correlation-Id: 72c1bef8-3233-4d29-fe2b-08de7b7ee2f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	uF1XTxgd6d6mvIiMUzaOTtJJgMGiN+JnBXRaj9PtHLjQMyhviGbW9gePCVOQ5YvxslfFlMeMDqmON78P34ZnlpZ/A+RFRQpQeDDNp7K22a3CJUc3B3F7Z9CECzXZnBYiBcqVq9Ll98SPANpJnS5+vhb8gSM9XM+ZdW3c1NktbNaJVeHxajp7n7VFSp0YTOqZosftvBajxwxHt29XkXlKwQdbgFOsJk1ceqocO448BSKK7fIRoB8oR/VkkaN29LZ8M9Kp+CI8H/iIPnsk56tp5c5/TdPQm6T/hS8EO1Mm07/970wy1ojBXq1+fs3DqeEY2hXQeSgMZgKGYVb+XQQNdIBmcDCD5RyJ9Br7SsflwLYfTQrcY8q2trXpujJoE8228PAw22E8+RhZMgpTBw38HgjlKaN5ZTC2TYgWF8gBgQN0e9DT7xo3Dz3eZOTkrPoCd2tTZCdU3SG7jq2Vi0Md3rkxUsOlRxHN8dz92VG7Fgqn9FATHKlDylmxa+Kb3rG0IV5byS8cTH6SEUTSig9/0Z0raPeswL9wez73T24oW/yFc+pEuBG9AQAsMnuTR8jvM4G7adi9vS5zFWAYyHeHi9bT5IBfveXRf42bNCS+MYVXGkuBGt7zyFl6O+tXSCKkB0s8VGXklvmxYIW1khik53c4+2UGsi8ahOiS84+CvecgiG9G1lWyIXk1wwS4pKHJtc1/T6ACWEPpQYoARZtk2OhFIZeV/WlMOCchRiC4oEU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3IrMDVuTVF6N0E0dWIzd1BZYWZkemMwUkhhRk9pdUQ3cHplcHU3SyszTkRY?=
 =?utf-8?B?dnVmMDZ1Rkl0MDVjaWxkNGx1R1MzU3JDZkFIbmlwZ0Q2VjBVS0laT1ErTWp2?=
 =?utf-8?B?NmJEOHd6RTVWNWVTUzRHdGpIckhIUWV0YndhYnZuakhlSXBTdnNXNDlKdisy?=
 =?utf-8?B?V09JY2tDUW50V25aeXdwZTgvWC9oT09TbmZnSm1yTVRuR3lLVHBiYlBSbDk3?=
 =?utf-8?B?dlgzOTZPZDRZaUlwU2VNd2VoRDFvZTUvNDVuMjcxNEJaRlVnU0hBdGhCRkpw?=
 =?utf-8?B?aGlscWMzbnZMaUJLQVVzLzlkRnFLaFVNclhkazVxcHR5ZFY3VE9vY2dhUHpy?=
 =?utf-8?B?aHBuZURBTDNKWkM1ZUdNaURnb1llcy96RnlmT1VnWTdmRm85VUZrczlvY0lH?=
 =?utf-8?B?QXd0eEcxakhPYTNuZ0VaQUxuSG9DSFVaSklWajdxRXhEeGxKUTcyZzJjcGZS?=
 =?utf-8?B?Y0ZRd3lTVlNmUlIrcUVBSzloUU9QenY5ei90RFJ1UE1oUG96Zjh0NUd6cVlH?=
 =?utf-8?B?Z0xoSVdxVkovR0Z6WU9icE52QmFIWlhXK2R6SVlTZ1NlQXYvT3hFWjBlbEtZ?=
 =?utf-8?B?NVJNdFBoOEtZdHV2YVFrbU9OYkVMOEFrT3RRZ1pkTWFsYitPVDVBQ3d2SmxE?=
 =?utf-8?B?b3JOdnhlcDBLU0U1aHFMUEZSTnpjRmdKeDA0MzVmTkpiSEd5VmkzOVQ0K1Fi?=
 =?utf-8?B?UG9jTWxIMVBOVzBFNUk2Q2IrM05HUEh3VnlHSmtWb0hQS1JuZzArMWV0UkVs?=
 =?utf-8?B?aUxWd0VjUG1GUWc3eFI1Z1lHeDNpVnBNZWZLcmhDTklSYkR3bk5mQ3FFTitQ?=
 =?utf-8?B?Q2piaWVNRytLaXFlTWNBK3AzdjNnaGhrdDl0dytNRy9WWTVFSHJ0TXhvS0h1?=
 =?utf-8?B?bjRUNFdia2dOeGp5RUFOeW10UE9yMGRPdG5wUlByT2M1OFNEanNrUERoaFU1?=
 =?utf-8?B?R0l1TUlicElNbXR2RXpPVSt4WGl1S0dCa1ZWa0FJbzJvRjNTOC8yV2NhQWZL?=
 =?utf-8?B?V1dxVVdNckJFYlJxbnFIRTVUb21qeGJ1V2xYQXBwd2FpSGMyb0Z0Qk0zaWlR?=
 =?utf-8?B?U3J2S29aRjRGb2MxMzdTZ2lMM0owRWFockJpRklzdGZoZmxVSTZPTzd3THBX?=
 =?utf-8?B?TnFHUkhhSlJzemhEMVZkRi9aQ090QThhc3VidmZzNmVuaG02STg1eGFQWjEz?=
 =?utf-8?B?QUxFRisyME5DQWpzUUpJbUpmRS9DQXVIckFIdHBpbVRKWlIxeEVBbWZLWWFW?=
 =?utf-8?B?L1pMbGxXV29aZnVSeGhHdUpSR1BzRUdlK3YyWHlERlVuMWpKZ25oS0F1NjAr?=
 =?utf-8?B?QXVqVExtR3AyekZ6L0hOUVkrckNHVHBXMzlxRVI3VTRvNEl0WmxIeFpqbkUw?=
 =?utf-8?B?bUgxQjZFRk5VYVZQTG5objNPU1crcktvVzRkc3lKQzA0c2pST2xCZUNFUHBh?=
 =?utf-8?B?QUVseHo3dU83YWdyWkxHRk1kT0ZQck9pdkowRHZCZ3NIVTF0eVhtQnJGL0h0?=
 =?utf-8?B?Uk9yOEdVTGhuQ2FYVGcyQ0l5bFM4TzBXVFJUM0NzMkwxcER6anRKSWFURkNH?=
 =?utf-8?B?cUw1V0EyMFBSRTNTcEc4S1JmZmVLZ1k0QjU5SlN5OTZIQzljNmJ3ODlRS2l1?=
 =?utf-8?B?cUh5U3dZYXBjTVE0QmpkL2kxbEFwV2Z2YW1uS1l6YlNQd0Y3ZjdIZk40aXN5?=
 =?utf-8?B?S3FneW8vQzMyaGl2dDgwRExTMTdPdzFqL3RxM1d5VS9JcjNscStRRXJoMnpT?=
 =?utf-8?B?cW0zdllQcUJ1a2dqc0pHeTk4RGhud2E3bU9Eakt4cWF1aXJoVnIxVHh3RHBV?=
 =?utf-8?B?ZXI2blFDVy9jSjBrVEJoQ3o0M2dZUTBqZStITTdqNUdJQnZ4eUwvbFFoSGxo?=
 =?utf-8?B?dEdyYktwODRqc21nSlRYelRrVDJKQ3VTTHJ0azRwR0hMWHZiWlVLUUtRKzRa?=
 =?utf-8?B?RkRFd0tkTmExTmRyeVFRNTRXVXk4WHpPMHdRa1Z2TzU2MllzaUUwU1diYUhD?=
 =?utf-8?B?WXJGWHVJSTROQVNaN1RLdjZ3ZExBL1MvWlpEN1kvRVltc0pSalJyWnlLNnlR?=
 =?utf-8?B?d1lWY09ieEp3UXloclY4OG1ldm5IZHVQRUxWK2ZwWWtaYXdxSkpONmNDbEY3?=
 =?utf-8?B?R3FmWWVIbUpNbTRjR2xBUlQ5WFhwT1Y0US9veFNmRDFjenllSm5sS1ZYYkNj?=
 =?utf-8?B?Tk5LWVIzWUMyN0pMWWpGbThPNTV2S2orSlJoSFBVZGhiNVhDaC9ncnpiaXoy?=
 =?utf-8?B?b0xXSXNuOXZpSTlQbmY3MjJjWVBSK3BxQmptMzlQWm1SUkxkZlMyNTk3MmZi?=
 =?utf-8?B?cEdaQ1pPNmpkeGpHVTZsZFk3S2x2Myt5NjRZaEpUOWxrcTlKWWVRbDhOTDZX?=
 =?utf-8?Q?gEHyk41Q2muhQduQKMjaQW2Wy0nzc4yIYo+xUGdNgEMfZ?=
X-MS-Exchange-AntiSpam-MessageData-1: r08Kbo3ZgpHLdQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c1bef8-3233-4d29-fe2b-08de7b7ee2f7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:50:03.9848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYTxf7GS2wWiAfeOrX1efvX8f/KlckA9YzrH1+A7GqXwwjdDLpCO0/fN8RGAJBAHQg1rXLcN0YCByuM8YvT9cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4375

On Fri Mar 6, 2026 at 8:35 PM JST, Gary Guo wrote:
> On Fri Mar 6, 2026 at 11:10 AM GMT, Alexandre Courbot wrote:
>> On Fri Mar 6, 2026 at 7:42 PM JST, Gary Guo wrote:
>>> On Fri Mar 6, 2026 at 5:37 AM GMT, Alexandre Courbot wrote:
>>>> On Thu Mar 5, 2026 at 7:15 AM JST, Gary Guo wrote:
>>>>> On Wed Mar 4, 2026 at 9:38 PM GMT, Danilo Krummrich wrote:
>>>>>> On Wed Mar 4, 2026 at 10:13 PM CET, Gary Guo wrote:
>>>>>>> Even for the cases where there's a PIO register, I think it's benef=
icial to just
>>>>>>> get a value without a type.
>>>>>>>
>>>>>>> I don't see why we want people to write
>>>>>>>
>>>>>>>     self.io.read(UART_RX).value()
>>>>>>>
>>>>>>> vs
>>>>>>>
>>>>>>>     self.io.read(UART_RX)
>>>>>>>
>>>>>>> or
>>>>>>>
>>>>>>>     self.io.write(UART_TX::from(byte))
>>>>>>>
>>>>>>> vs
>>>>>>>
>>>>>>>     self.io.write(UART_TX, byte)
>>>>>>>
>>>>>>> what benefit does additional type provide?
>>>>>>
>>>>>> Well, for FIFO registers this is indeed better. However, my main con=
cern was
>>>>>> this
>>>>>>
>>>>>> 	bar.write(regs::MyReg, regs::MyReg::foo())
>>>>>
>>>>> This specific case is indeed more cumbersome with the two argument ap=
proach,
>>>>> although given Alex's nova diff I think the occurance shouldn't be th=
at
>>>>> frequent.
>>>>>
>>>>> It's also not that the two argument approach would preclude us from h=
aving a
>>>>> single argument option. In fact, with the two-argument design as the =
basis, we
>>>>> can implement such a helper function cleaner than Alex's PATCH 10/10 =
(which uses
>>>>> `Into<IoWrite>`:
>>>>>
>>>>>     /// Indicates that this type is always associated with a specific=
 fixed I/O
>>>>>     /// location.
>>>>>     ///
>>>>>     /// This allows use of `io.bikeshed_shorthand_name(value)` instea=
d of specifying
>>>>>     /// the register name explicitly `io.write(REG, value)`.
>>>>>     trait FixedIoLocation {
>>>>>         type IoLocType: IoLoc<Self>;
>>>>>         const IO_LOCATION: Self::IoLocType;
>>>>>     }
>>>>>
>>>>>     trait Io {
>>>>>         fn bikeshed_shorthand_name<T>(&self, value: T)
>>>>>             where T: FixedIoLocation +
>>>>>                   Self: IoCapable<<T::IoLocType as IoLoc<T>>::IoType>=
,
>>>>>         {
>>>>>             self.write(T::IO_LOCATION, value)
>>>>>         }
>>>>>     }
>>>>>
>>>>> No need for a `IoWrite` type, everything is done via traits.
>>>>
>>>> That's cool but will only work for fixed registers. If you work with, =
say, an
>>>> array of registers, cannot implement this trait on a value as the valu=
e
>>>> doesn't have an index assigned - meaning you would have to build a
>>>> location in addition of it.
>>>
>>> For array registers I think it makes more sense to use the two-argument=
 version,
>>> no?
>>>
>>> The example here is to demonstrate that we can add a shorthand version =
for the
>>> fixed register version that can write a value to register without menti=
oning its
>>> name (as a supplemental helper), and the basic write method is the two-=
argument
>>> one.
>>>
>>> For cases where the type doesn't guarantee a fixed location like FIFO r=
egister
>>> or an array register, mentioning the name twice is fine.
>>
>> It's still tedious, and a step back compared to the one-argument version
>> imho.
>>
>>>
>>> [
>>>
>>>     For array case, you *could* also do
>>>
>>>     impl IoLoc<RegisterName> for usize {
>>>         fn offset(self) -> usize {
>>>             self * stride + fixed_base
>>>         }
>>>     }
>>>
>>>
>>>     and now you can do `self.write(index, reg_value)`, although I think=
 this
>>>     might confuse some people.
>>
>> Yes, in this case the semantics of write's first argument would be
>> dependent on the second argument... I think that's a potential footgun.
>
> I mean, `bar.write(Reg::at(10, regs::MyRegArray::foo()))` in your example=
 is
> also kind of "first argument depends on the second argument" situation, j=
ust
> with a bit more boilerplate.

Not really, `at` is enough to know that you are accessing an array.

Whereas `write(index, reg_value)` doesn't give us any indication of what
type of indirection (if any) we have.

>
> If you want to make things more explicit you could also have
> `bar.write(at_array(10), ...)` or something similar.

Is it possible to generate an `IoLoc<T>` without having `T` mentioned
anywhere in the call to `at_array`?

>
> For the array case I really think trying to shove everything into a singl=
e
> argument is a footgun. The type of value in this case *doesn't* tell us t=
he
> location, and the location needs to be explicit.

    bar.write(Reg::at(10, regs::MyRegArray::foo()))

"write the constructed value at the 10th position of the `MyRegArray`
register array"

What is missing here?
