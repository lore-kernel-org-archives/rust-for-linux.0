Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012007.outbound.protection.outlook.com [52.101.53.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F657371062;
	Thu, 26 Feb 2026 14:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772117656; cv=fail; b=InW7MD9SWCvQzh3v2/zAPk0RUkgzYt2YpcVj6Txy2bfrL4bxuFlb+uVZmtvwgcccOKMY2hSWGzQIW3t4cMs2yEwMfhCA4fMVECOouBbBoSmZ+M4T2J7NfknBmO1E8MMJruGMBm5x/KyKoX7VR6MrNKjLfrukXTWnYKypzMNzQaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772117656; c=relaxed/simple;
	bh=t+j1wYCmty0MKJ7U0n8lcb9BZyy7B/hoNpWdU7Zb+sc=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=RDDrLp41bi5H5E3NRnR37lk/C5Ul/CPvRutF+Pydu2ueYM4K344VieQq81dxFzwerCbOO1uDjvqV5OqNzEwM1qSPPqh6GhNnqb9Wc7Z03ti8lXcAbEVIpmuo1lUtUezrOt6CSOw6+GyiFhl+iCFewsQ2webCWdHiV5tzilDLiKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BIlGKomE; arc=fail smtp.client-ip=52.101.53.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BIlGKomE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiFMDnMyg5X91rVUozstiSpyddxC7ZXMafmTOr2S4MSGs7Mz2/9E2Ft93V/lAM8q637wlgMWtNU5JD6rlzWSzzeb+lFsX5CVNcrcdyd/qW9RJLl8zkpoC0LCtYu+ULOOCciLS6+jRjAz4HXYl59ZRY6cGqguMxg/b+YxvXoqms9GWJ0iq/E4AMO3+BsD3aPIh6r1WO32VB0R6jpLtHQtQIrfMZ7ox5QyyIpdLQXXBaLIUjZLtVNp1DWBaT5Hyl+Q7w1UufCW02fK/YmPQYLt+S+pm7wL25BSB60Tmyo8UxISPX0k8vEY4nhQQ26TtymCX5e5ej6i7/gWpx8BUppeGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLAdSV9LkjiXmyDWqWtto4uQh0H20pE0IyxWZKo2euw=;
 b=KW0HroeTJp7r6GX7IelRezEXDprinbRFwPvz4DtlatCHPFrj0LJqDYpWUmSqf2of0BhacCfYhCbs9r8jmdW+Ibi4tQ9aIpqdSAl1QdsBC70UNNbH5x/iUCnNVAVG9Epm23m9NSvKwnYREPnxnwOGO7RnFXqh8xkPrC0WmkkopazkqLszafxixZ2dIGbWvJDXS+4ykZOiKcYiBwDdMiz78PjHVQsYPG2M+Y1fjuTxxdEhBm32PqbD+Yjbuk4iFKMEZKiuCnSujwSJwur2hGZjJevU2tx1jr++QNA69dLHbIeOFYXbLXhdYH/krDasbVzFJgznbysPzRVsh4+vdRBq3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLAdSV9LkjiXmyDWqWtto4uQh0H20pE0IyxWZKo2euw=;
 b=BIlGKomEGQFg0xvG2Szc+zal4/rDXZ2laHE8Ljyebj9uikUDx8L10ZxfZWTmePyZSnaeQmH9+cJ83xqhDRUuQgLBs3bo5mkXa6Xhoyca7CdQWTWVp0ATKzqho9m6frwq1XV1JUIn6aSQsf3ueM7ijwa/RddItMWPeugyyBcIQQHIsa13tVSdRk/1GuDr0bEv+BYm0FbOUWQxWuYnO7PYYV/aOUVHOj9z6zkJB4J/3qRalZsxG0SHpmDxcLJOXo9WwDi4vjuQO9ncsidVHta3xvvTtaX/4NeLyMQCYh1jqUC8BgK4obGSnmLGpSusSepy/pAJ/AhTdzOZxq0IgOEj0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BY5PR12MB4066.namprd12.prod.outlook.com (2603:10b6:a03:207::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Thu, 26 Feb
 2026 14:54:11 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 14:54:11 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH v2 0/4] gpu: nova-core: gsp: add locking to Cmdq
Date: Thu, 26 Feb 2026 23:50:22 +0900
Message-Id: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22PQW7DIBBFr2KxLhWMAYNVRblHlQXgcTJqjBvjW
 K0i373E7qKLLv9I8/77D5ZxIsysrR5swoUyjakEeKlYvPh0Rk5dyQwEGAGgeRy6G7+O8YPSmXc
 1OLAeIsSelZfPCXv62nDvpz1PeLsX6rwfWfAZeRyHgea2Ul65HqHGWjdBWas01rJHFwvTCohCK
 22ls0/0gDn7Taet3n5tzG4TxzRTuvu5uPOl5oLrBnxwTprGmGNaqCP/WkoP7Cl1oTyP0/c2eZG
 b1f/rFllQIfQmKKlNI/6i2Gld1x+YVUAOPgEAAA==
X-Change-ID: 20260225-cmdq-locking-d32928a2c2cf
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0123.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::11) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BY5PR12MB4066:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb08d57-9ad2-47a7-20f4-08de7546e69a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	GSFG7rhrzAF+AxJl9jbyo7LQpnLRSU7cvD2Yh5aT8NlUoqQlDGIH4euT+usmDGMUU3rg8+LL8lPNLjXNdlEUzdmvIeju/1V8aBHP3iVL7gHubMZA/Y+0l1/d4ojkWPpIoKO7dcjTmqFqMWIqUe507jbqwB0/l+8OevMSqK9JxEgVv3JtyWZu6Y9sOdEYOOyDWl90O2K0NciCMEKbhLVnwLKxZpep+WFfC3UmM/d06H+TnLt9rNzMifGzPSY5d4nbZLQtvW05FxVtOky11nxDHKfOwfsuuNVxuW5fB1GjgTyxcdzoK8wwyEQWQJpSzKcg3OiR+KW9EkTEOP48adbvTIeP6AdzesLo7ItVlLbTn+cBiY7liJNXrlV21gzuj9Xd9tLCaq2tN+BE4YF3fcic6bes2yfhrkMi/4DTzssMyWb5m8KCAjq+6V5ZfAETvSO+G2JKdzRfc36n5Or6oZy9/w6ifh6osG1SjStF34Z0ME9lpu0t8i6BXgkSaWgzozkcIygRkTJ8hHlpBaxmquYjDCifHlydfi8VJtj2eQxrH9D6kf8kEZyI2k+VP7N0bEPw/Kfl1rXKMyjmA1WWE7I1DRTWR+RWtSiaZ5sd+uwFHzt1xr+Oz2mr/ziuU4tY5/XQ1CXXWo5AErSyEXze3gyed0m8KmVuJTNDNP/sxi2OdvqG8rG99ngd/JcQheC+MPz+UEPOXilmZnC3KGKVU50qm6e8Cw/TJf2uRlRVMlTwOc4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmhucStRVGFIUVV5UnRGKzJMQ0pPbE9URkhBSzVHbG54VTVVU2pGUTBmT0wr?=
 =?utf-8?B?VUExVnpXcnFGYnJrbHJha1R0K2c0RmFXYUh2SGZhMnFTUEw3Ri9MWDh0R2ZL?=
 =?utf-8?B?NUcwcjNGQVNIUkVoa0d2cUZvdG1DQUlDbVBRS2VRQlNBM2JwbzJ5RDNmYmlh?=
 =?utf-8?B?My9STkw4U01rcFFWOXBheG0yb1dWUG1xZllpUlh3S0REWVY5MzdDblBEQXFh?=
 =?utf-8?B?WENVZ29GbVdUMDVzQnJVcG9LTHRJdmUyQitqcHMvNTF6YVEzbmdkblFVSEx6?=
 =?utf-8?B?UVlxdDlMZGpGWlpTcnlRdmx6MHFKeXhxYmtYSGt3K2R4eGFIM09uZUlIZFpX?=
 =?utf-8?B?MkZiTmwydU0zZEs2UW9POE5QZlozRFo3Zk4zZlRwL0dnbXFpa0puU1F6WWpu?=
 =?utf-8?B?aWJHNDQ4Y0hkVGNjaXFJenh1WGEvRjFSbWZuZ3JZYTltb1NXUUkrbGtLZU8v?=
 =?utf-8?B?TkplMTlEMFBEMXdscTBkZkl6WEd1WTRGYUI0QWVzeEhRN1ZMcjI2OE50VGtz?=
 =?utf-8?B?QnY3UGtDWGRDaHErUW1kOFA1Y3phc2VhQnlXRWJ6cEIydWVjalcvZ0dDeENi?=
 =?utf-8?B?U0dXL1g2MGRZNEF2RnNjMVltd2dxcGV6cVJudG9qQ2lxU0VCVFdOYlNTeTVh?=
 =?utf-8?B?VnJpTHhvTTlvS1RheS8yZVZpMFpyTFZ5alkya295UWMvOTVIY3E0S3ZRcW00?=
 =?utf-8?B?SlFqS29ibXF4My9mbnlmSWZUcWdWQUhjZUFQbVBIcStzb0pJZjZnVVZiMksx?=
 =?utf-8?B?WEY3U3NzSHNzRC93Wm9nMkhKcVY3MUIyaWpFcU1CNTFxdkRoV1hhUm9lSW9m?=
 =?utf-8?B?dHNKdlM0TjFsSWdjd1E0N0ZZekJ1S2xMbk1QbnIyN25TS21kbWQySkpFQU1y?=
 =?utf-8?B?QWFqalNKbXNQQ2loN3p3akI0Z0g5cjJ2cXhKNjRhWHZzUDlCYnhFcTRZek0z?=
 =?utf-8?B?Q2dibExNK3YzWUFUam9nWVp0MS84OXlab3c4N3gzZ1k3aVFydmVTcnY4ZkVF?=
 =?utf-8?B?cUpOVW9KRVRtQUNlL1Y0NFhSL2N3SlUweVg3TTFvVFFXNlFTT2NzQUpzUTFD?=
 =?utf-8?B?ZFNZeWVIeFFTbjJ3MGJzdEFzVmpPdHVka1ZMbmUvMnE1RnhpSi85UXJwUHV0?=
 =?utf-8?B?QlVrN3NDYXVQMUpzbUEzR2U1TVJoUEFPTTIzOWpsaEp3Y0Yxdk9lZjk5a2gx?=
 =?utf-8?B?NjFqRC9LeHJsNmR4WEYyUTBYbmxCeXFaWEk1eHZXcWExQ2krVUN5d1plWG9m?=
 =?utf-8?B?Yk5jOUxDbE94TGpNaFZKcmpRdi9BWm90NU1qdXdBUVpCK0VmZXBndkh1R2pJ?=
 =?utf-8?B?NGVPaXpJUGFERnlWbldnb1RtK1czVU5NRXBFTlVTcGMyWkJqL1l0RUVra2VO?=
 =?utf-8?B?TVZhS1luaUxSZ3BWaE85VmhJUUtCM2NNdUdNYmR1YUc1b2hJZG1vVktoSzNC?=
 =?utf-8?B?dys1RFBsdkIvYmhueHl6Y1R2RCtRRnkxZXVpUE9WYlA5Ukt4aWU2RGNOSGdZ?=
 =?utf-8?B?bmgvR1Y5WnB2R0pKSHlnRVlvb0FKeE04eEtTNjhrZitBNVR1Tkg1eVJGdk9Y?=
 =?utf-8?B?c3Zub0g2UDNmeHlrZ2xDNys1b3h1a3QzQXZsb0dsSWxmbTZHaFFVSTJCdk4r?=
 =?utf-8?B?N010ayt2VGVHd0VyNVBwL2FDNDZjWUxFRENXaU9zUTFIUVpCK0MvUDFHdVFK?=
 =?utf-8?B?T1g0NVlhdTcraUVsaEpZZjZpcjgxaFhBcy85M1pkdXRNRTdLZUFnNjdTYUkx?=
 =?utf-8?B?WlJyUitLUU5aZDA4MTVwWFhVeFI1RUNjM3RmaDRBK3grc3dMTzRQUGpDWXdw?=
 =?utf-8?B?TGgyNWpJY3YxQmFPY3ZMd0V5bnJLZVZ6S3dYQTBnTGxxVCtiTTJqS0QxamJi?=
 =?utf-8?B?QU9XbmU5RC84Wmk5cFlCYTZ0bjRUOTM0M2d2UWVGekZPL25YSWdnWG1hNENi?=
 =?utf-8?B?dlNuak03eGloMzl2REVvNXJmdG1ZNnlKN2s2SVpLeVJhS1hVY1MrN1luR1RH?=
 =?utf-8?B?YlMzekFNNDBZTGJGR0lkQlFTZ29MMmZINmYrNWxBR2JtTXhnRmNhT0tCdTdq?=
 =?utf-8?B?SUp2WmlkRnhwUEhGYkRxNGYrd0RpcHVJOWlWUXZ4cWhFWEJ3QUJwWmdvVVZx?=
 =?utf-8?B?RlFldTBHbWY0L0VRN1V5MnF1eFpacnB3MDF1Q0lWdERYbmJBMHRwMDBqR2Jz?=
 =?utf-8?B?b0NHS1EyWUdJV2lmdXM5cWs5bnBtZ3QwMEw3SXB6ZEhPTnZzbzJMRmovZ0Ft?=
 =?utf-8?B?QVVsdU5JaE5va0dXbnpqWmpzWG9QN1YrSG5NbU1uWG9VVmI4RGVabG1pM0Jh?=
 =?utf-8?B?R1ZxcEFZcXBOdGFIZUNQVmZTVkNuOHpEajlkTVJMbmFFZGpiVjFnNkZwNWxD?=
 =?utf-8?Q?4OzG2By6QdArGTi+8IHU84fwT3X6rO49lPL7gSS0l7HoY?=
X-MS-Exchange-AntiSpam-MessageData-1: ZHClSw6BPe4eiw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb08d57-9ad2-47a7-20f4-08de7546e69a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 14:54:11.2100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTSO8wSIFZopR01pWIxoJRywcxsPU0QGSyNkAF0f5Gg31CttEDenQTH8kaki64hou3j5mQYc9rnznPBPOS0LTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4066

Add locking to Cmdq. This is required e.g. for unloading the driver,
which needs to send the UnloadingGuestDriver via the command queue
on unbind which may be on a different thread.

We have commands that need a reply ("sync") and commands that don't
("async"). For sync commands we want to make sure that they don't get
the reply of a different command back. The approach this patch series
takes is by making sync commands block until they get a response. For
now this should be ok, and we expect GSP to be fast anyway.

To do this, we need to know which commands expect a reply and which
don't. John's existing series[1] adds IS_ASYNC which solves part of the
problem, but we need to know a bit more. So instead, add an
associated type called Reply which tells us what the reply is.

An alternative would be to define traits inheriting CommandToGsp, e.g.
SyncCommand and AsyncCommand, instead of using the associated type. I
implemented the associated type version because it feels more
compositional rather than inherity so seemed a bit better to me. But
both of these approaches work and are fine, IMO.

In summary, this patch series has three steps:
1. Add the type infrastructure to know what replies are expected for a
   command and update each caller to explicitly send a sync or async
   command.
2. Make Cmdq pinned so we can use Mutex
3. Add a Mutex to protect Cmdq by moving the relevant state to an
   inner struct.

[1]: https://lore.kernel.org/all/20260211000451.192109-1-jhubbard@nvidia.com/

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Changes in v2:
- Rebase on drm-rust-next
- Link to v1: https://lore.kernel.org/r/20260225-cmdq-locking-v1-0-bbf6b4156706@nvidia.com

---
Eliot Courtney (4):
      gpu: nova-core: gsp: fix stale doc comments on command queue methods
      gpu: nova-core: gsp: add sync and async command queue API to `Cmdq`
      gpu: nova-core: gsp: make `Cmdq` a pinned type
      gpu: nova-core: gsp: add mutex locking to Cmdq

 drivers/gpu/nova-core/gsp.rs           |   5 +-
 drivers/gpu/nova-core/gsp/boot.rs      |  13 +-
 drivers/gpu/nova-core/gsp/cmdq.rs      | 246 +++++++++++++++++++++------------
 drivers/gpu/nova-core/gsp/commands.rs  |  23 ++-
 drivers/gpu/nova-core/gsp/sequencer.rs |   2 +-
 5 files changed, 183 insertions(+), 106 deletions(-)
---
base-commit: 4a49fe23e357b48845e31fe9c28a802c05458198
change-id: 20260225-cmdq-locking-d32928a2c2cf
prerequisite-message-id: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
prerequisite-patch-id: fd45bc5b8eda5e2b54a052dddb1a1c363107f0a7
prerequisite-patch-id: d0f59ef489346e978a222755f9fb42dfe7af19e5
prerequisite-patch-id: 8844970d0e387488c70979a73732579ba174b46c
prerequisite-patch-id: e138a94ed48fa8d50d5ed1eb36524f98923ed478
prerequisite-patch-id: 4599a5e90d6665fa3acb7d4045de5d378ac28b4d
prerequisite-patch-id: 30ed64c398e541d6efbcb2e46ed9a9e6cf953f4f
prerequisite-patch-id: 9a965e9f29c8680c0b554e656ff8e9a1bfc67280
prerequisite-patch-id: d8cccc3dfb070f304805fc7e0f24121809b4b300
prerequisite-patch-id: c0a73dfd1fb630ab02486f0180b90f8fe850b4dc

Best regards,
-- 
Eliot Courtney <ecourtney@nvidia.com>

