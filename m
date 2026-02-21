Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B719E32938A;
	Sat, 21 Feb 2026 02:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639868; cv=fail; b=jZpZVpj8MtgpV28z8YPLx00Ut15JtOreM8bx0aXh5f4vxF107WRLZAAwyT5+vPTPEBYNM932tm/TuXjzOF7xVvrvzR/GwT1QLzTnV4Xm+MMBhe9WhLFOgqumm/t7Z1N2Enj4iiDRfAavjDqfs1vyGI8ag9IyPBxdau8HcSDvmsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639868; c=relaxed/simple;
	bh=1eQxi486dD83xmbuhfFT3R79HJMnhsTWXATojFFgmJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pzfvX2d40SzCxcyOup6saU2vOxpxHO+7vzE3B9YFgvIlO/8MbPOT83Z8pRZf/vuCXk0piONqQ60e4e2INe0P+FtKs0LIPA6QlczUL29InCxZ9H3Yg0eUuA9x5H+N3r2TsSYr7ZOdXX8k6V2ZXhcgQ/fjR4AiFJ97luWWDJGvmig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n1h/J5J7; arc=fail smtp.client-ip=40.93.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n1h/J5J7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFbWHhIwEPX1mTu5b0qP7jc9VN8aheHilrVdgZMwY5hSxm5IvTQ1iu0EerbwiDidbBVjLDnu5bQ6NfIA/0X4xVu0EyIUk8E2HJJLuXzG3kGszOrOoHUABONuFx7aVygXAmOlFTnbpyo4d2yI1cbsjEEYE3zENUDIfo2UhLpmLPCzEw1Fm2OPy/HmZB6xOuyzhDkP1EpazVrmo/44CDLJ1rBpaC8TWFn9Eal7npKJfjkghH36eeyVXnN3lY55OCkLsQhOo6G+xF56ALnkLKTGWkzp3E84b8FipNaYdxffRZ4eo369GqIjdjeSH5V/F0JaMamm1T0sf/t1xwr7tdPlSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlropBU43v8RhzG9lU7aSK4ogvX4xvWImf70be71S+c=;
 b=miAhrO+YNuKpiKfb+GbVVMuE0SysaHcuwLfcQDfR/5Fv6aIzUiyjYk6BgptlIOnAUivmGMMdiJKoY95rzM+aUmEgbY7JMqmdYyZ7qm+cNw7ImEg4k1mQc2ounC4VD+yaOvFQBTK1CT2xdNqSTIAN6EnfcY1li0HQR2QXr74wtLFyvt1sR7KJ3qG2NiWG2GUmOY1JR0UBehmsOvtNF3aKITSJZa7oZd+Vs8bRYVF+xHdWY66BEO+7b4Q7rcCgRWk8EyZntw0kgUgjZgA7DCO1xzZlQuZkUfE4Iv92JhvBS42uBhzgIubI+TQMxVhU6fLo/GnLd13I3Xr963/YI2j/gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlropBU43v8RhzG9lU7aSK4ogvX4xvWImf70be71S+c=;
 b=n1h/J5J7b7JUwuEdLQyOGSGCox69yD5XBl+kgSLU0Fenaqn4BjfI2YdgCwhcZEqexhZKXzTOMzgadn/P/MRaU9QfuxOwV6H0G3p7OMqDY1kYLNqbsEBSd7D06JoGbG7xkMu17Nk2Bs49CJV81AMCB4nl4EwdrOXLa1kIobl1RJXbMPL74ymhGCOh+MR47/DDzzVmTJvHlRUgE+/Donn4i0Dyk7EFzeAbkYnqSIYNHn+Ph60Isc8LoOvZCq4vwjwMMMcy8h5I3XdyWsXuTmjh8Davb4nPeMTwBuiGyuWlEzfo/DgQqrhJSSAuFdkldyJkJu3WZtbuRz1fzoo8PVYEXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:10:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:29 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v5 28/38] gpu: nova-core: Hopper/Blackwell: add FspCotVersion type
Date: Fri, 20 Feb 2026 18:09:42 -0800
Message-ID: <20260221020952.412352-29-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 45bef685-a50a-42ce-30d7-08de70ee6267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JDLvUMl3OUudr1Yo33EpJTRowYEQdmksyLN50rNuxM90npxI+CXW7+EpZ8Hl?=
 =?us-ascii?Q?dQ0DqdIMlaj2DYtHQFqWpdG332E06UW0xamwmbkMyJ0Rqldh4aX9jpHMwERv?=
 =?us-ascii?Q?njOaxPxJSul6yGmiVCW2BSY/HUuENhTakyUA81Iqisr/gM+FuxHKiydl7CIS?=
 =?us-ascii?Q?kbgNie7NjEf6YHVBotxJiPzsjOgFBKL9TWvWIuKwD3r4/KPzeIDZsI4rGmRP?=
 =?us-ascii?Q?mrDYz3iv7yn8KKx4AlA32JH28bgnDfWfXsO7xRy3zD81JsAaE1VAWRiJCk9W?=
 =?us-ascii?Q?CMDU4bB0dE5zvcTL2UJgAMCxytwo84AzNU3QWUR5uvC6ohnwkdOC4HZMEiue?=
 =?us-ascii?Q?78wRavq83ibnjtsuyDGbv6qFr4/UpQ5xuAYfochLWqO+OUAeyWOqTDBAXJpF?=
 =?us-ascii?Q?MMLBbYMaKRQuSoNhwIjnfBP+GrIZ+ucNf7Ys+f9OpoABdnltn8IMlrJHxrH4?=
 =?us-ascii?Q?LnWDvJabEPBPHPkLmuBGXR4uaLdzUD2pBB6M3b4p82V8boscW8S1+z6TrC/q?=
 =?us-ascii?Q?kK8uezpBFj+0UD/iFVFx7AcPcVvtwGgF1cTJlW/voVIkOJm5CPiOvnNbnvXI?=
 =?us-ascii?Q?OdGwwjnUaXaeN6SokW7Dm7YayFPI8jtaDp407sP97P2+cwVIPQgGdtfImCjz?=
 =?us-ascii?Q?QZKeEEEag9bbc/AZK+TFl2H7WTiGmZYt2nVTpYEDup3KIn6asqu+pQSpoDT/?=
 =?us-ascii?Q?0vvMo+jMsWHTnCxBH2/V/hHmxMR/aaX/AfPzAgvPpi33UDHJpodLWm4cw3fg?=
 =?us-ascii?Q?+ciak6nLJ+/m3YJ4r2H5fgfPIYdnYjRcjdUA7vF5PwGY8hJHcNdQQzI5DFj+?=
 =?us-ascii?Q?Z62KHad16mlZDGgNT2esgY5KYiZt0z+wtfLn8ldb4eO/cymL5mYGPh+VhcK8?=
 =?us-ascii?Q?mola0DdRdGGCVChYnI9RVJYsZKi+PH5WWfNc7MY5CtjnezIQ4Jr0wvrQhYZc?=
 =?us-ascii?Q?Qxi9gjCF2m51ss2Z9IvRxyIhnJymH1jdQm0+m6Vb8WAnthBHW5PFdqqcZkSk?=
 =?us-ascii?Q?8ebsJ4+8wbwsLUTkRofPD4V5cqxR5ysPSpGPwJlrPyG8n8wEuLQ3SMtlg5KI?=
 =?us-ascii?Q?BpcodS1ISSIPPpesXXTqUBkLtLUWwSvmKCEOWrzrWIWddMuNTOyvw74YKlBs?=
 =?us-ascii?Q?xbTy92NJyZjwGfYpERJF8H/J2zCuuSmiMBV86GfEn6k38iF8vFmQqUHr2uAW?=
 =?us-ascii?Q?RkttVMgEe59fwVzwFAnJ6Cj0I6OxCmeBC2SmVMcV/Bx0tH9CgVPfjfSe2z00?=
 =?us-ascii?Q?IbvRIplc8fdoaOcTfuw+AWUsFvcSEtRju3aOBx91/pj7TU+1QP4m6uvaFNBv?=
 =?us-ascii?Q?NfMCd+XKiZueROYtLpdvzvY1QBYGMZrWFpnUWJVxrFqiufzLgD7T0XRRRq9a?=
 =?us-ascii?Q?mctT4VSCWlarHcOG0smtDxQuAlfvaoAaVypFrFUKlMy7vGh8iG/H7xhlc1K2?=
 =?us-ascii?Q?Wxa11ZD0iLrllg9pSjPpRn8fPkIhN/ba6MJrfOxYgcaHCGuITvdD3wLSRM7/?=
 =?us-ascii?Q?U4yQYlNsFXVhgIR863+GBRDWlU2+NyI2qKIf4e8mK5MY2JdpAtwL/MrmCBQ9?=
 =?us-ascii?Q?w43QXfCxjpctYHXTVxM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?95d7c3V6oQZRHnMrcw3txsCmLZkKDZNtnnpYtOO9+aDdavOFiUoHVRgGYjdW?=
 =?us-ascii?Q?HwtFY0h9wweU1dfyZ/KjVGUemjk3Eav2iamkuGctzXKK4ILrRnL4M40XxENq?=
 =?us-ascii?Q?2aTbwi7G9KJ1mEMJFzvwWHAQSQslP9OH8fIB7LfytIzGzORGlsoiDkq6P4Gp?=
 =?us-ascii?Q?h5AHVdizdMPvOeioNaGjGW96ugD5dpEZpgLPrGdmdfrNw1YvXF1Osn3t1/9F?=
 =?us-ascii?Q?Y/2ptAv56UgVw34tz42z+1Vo033jQIvWrDtoe2ZmCx5QqplXu2xhbSNf8GgA?=
 =?us-ascii?Q?uhp+GdtqqeGTrpvG6fp8mZeDm6skGam2O4/KA3NYUbzdYLoDzTcPYrlZ4YXV?=
 =?us-ascii?Q?f/lOJ7buEVBw1CxJedbEv9VplXNkXTh6jaAcrpA7LvO4FDLLyuXKCftCYIEJ?=
 =?us-ascii?Q?9wGQHqTOBSJkHSGTMRJ5lh8fwrBgvyj4xeZqpq56IQu6ODKsLCJAZuQhrAps?=
 =?us-ascii?Q?5BoFvq/O9d1MYZX+/1TvilA92gOsrdTlzoPnkBt+i8HGfcSJgYKy0Vfh4Bwk?=
 =?us-ascii?Q?82pbv0b834bcWGKsIEjK6R97k5sndlFL1IPqK9VKB2gDGvW+97JEuGH2zsjm?=
 =?us-ascii?Q?miJUpk5KF/Ki79ZfMpa/7ds/UvLatu9Vx4VU6FIJdP/+/agh7mXmkQGePz0G?=
 =?us-ascii?Q?eF0YbqouzvKddYhGF4e/WXzbqiDwaatu1FoNp0GKtBChlWwF1uMX2EtAQ3M/?=
 =?us-ascii?Q?HKJFsw0TWIQfd+Kla8EgKPJIG+KrpUi/fGyGrc3F+Lb0wzsqOk2tEJQljjga?=
 =?us-ascii?Q?9Ho/bPLUBlF+MAxBTGRQXkAaxAZCBR+HXLtlM2QU14Cwgcm9isFB1wZ39T5U?=
 =?us-ascii?Q?Q5AHYn/uf+/icdTf9wVrvaqr5/jqC81aqZnqX7QGgflA4jSdHtaHs6R/JKN6?=
 =?us-ascii?Q?VxrSGvrcpbmZZfzhBzv0UjBq785Kb5MZa507ZXDg8oF1cag39iZgayLU+9I3?=
 =?us-ascii?Q?htkuMUI+3x9DtQjEoGHFjrNZLops0lsDmWSKGE0TLhM9a81uK6zsz22wlU2+?=
 =?us-ascii?Q?VswdBBdNUZv35YTEQ7x9zXhaZi0ER47plDXujAG/Xi1AbPhW4mMtzuxDxT/o?=
 =?us-ascii?Q?pcnaiwqJk4qNDqrdXnrudtfhPA0y0PfjoNjWiSbXq4EPFzAx/yPZ2yNXyKA7?=
 =?us-ascii?Q?b1YxaLU0DnBrnqbwEYaV+PifaWNZm1ddVsWeE2IBUFtRhWOAi7nOZp5w/Yh2?=
 =?us-ascii?Q?bfi00Lr7g53052yrJxs6FMLzk/9ZwNybPokODK15UfrDKbJQgSFxVJIh742O?=
 =?us-ascii?Q?grOJHQVi7sma0/u//dOr3AGRvEgtIxnq9G+ZjhGF+xCdtgxWFXrerPQtPRab?=
 =?us-ascii?Q?6s3fatfKGMa5kj11ad8mS5pUrRuNQKyszU6DSoexwXtL/x6lQl501oR5YzS+?=
 =?us-ascii?Q?jOxV5pOfuQVZWO4EciAjDjL3MPByZtbSbiqsjnbb375T3sXcQDcVHmKIh8cU?=
 =?us-ascii?Q?MasixIJRXRb536NPvzpeJ35is+9uF0Zlz2Im2k4XkUDK/qlnQKRCiiYGG0oT?=
 =?us-ascii?Q?2Ffbz+bnvPBwM+4IclS8T4KLjNxC2FV1PUpkcNgHfEkNV2M4NgNr3xKDe1FI?=
 =?us-ascii?Q?uOppjniNKPfgOPKiKYW9lpp6QMyCYrTJG2MrsPRWgv7mwU9aKJ05sTPqQwuh?=
 =?us-ascii?Q?04mETGHwM97XrXVCwBvHfZFE9ut4GVQr33a+t9yWRCPDveVMhoV1ir8RB39R?=
 =?us-ascii?Q?gvEaOFOSgd1TTbcz9XOqh2ctiIIAlAkMujvnmIVGL0zZaY0CrAfXMfyuEirZ?=
 =?us-ascii?Q?SmEEnrcb2A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45bef685-a50a-42ce-30d7-08de70ee6267
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:29.0245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8brQLEn8FbI1ivOO1BBw9W6ob0SOdfjFenzeOF4a2f1TrfVJ9auKupw4OiN4brArWvS51eLN6ucNu0Ka7k90w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

Add FspCotVersion to represent the FSP Chain of Trust protocol version,
and Chipset::fsp_cot_version() which returns the version for each
architecture. Hopper uses version 1, Blackwell uses version 2.
Non-FSP architectures return None.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 19 +++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs | 14 ++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 20c439fc7f7b..8926dd814a83 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -25,6 +25,25 @@
     NvdmType, //
 };
 
+/// FSP Chain of Trust protocol version.
+///
+/// Hopper (GH100) uses version 1, Blackwell uses version 2.
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct FspCotVersion(u16);
+
+impl FspCotVersion {
+    /// Create a new FSP COT version.
+    pub(crate) const fn new(version: u16) -> Self {
+        Self(version)
+    }
+
+    /// Return the raw protocol version number for the wire format.
+    #[expect(dead_code)]
+    pub(crate) const fn raw(self) -> u16 {
+        self.0
+    }
+}
+
 /// FSP message timeout in milliseconds.
 const FSP_MSG_TIMEOUT_MS: i64 = 2000;
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 50bf351b64cc..fc34c97a61fc 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -21,6 +21,7 @@
         Falcon, //
     },
     fb::SysmemFlush,
+    fsp::FspCotVersion,
     gfw,
     gsp::Gsp,
     regs,
@@ -127,6 +128,19 @@ pub(crate) const fn arch(&self) -> Architecture {
             | Self::GB207 => Architecture::Blackwell,
         }
     }
+
+    /// Returns the FSP Chain of Trust (COT) protocol version for this chipset.
+    ///
+    /// Hopper (GH100) uses version 1, Blackwell uses version 2.
+    /// Returns `None` for architectures that do not use FSP.
+    #[expect(dead_code)]
+    pub(crate) const fn fsp_cot_version(&self) -> Option<FspCotVersion> {
+        match self.arch() {
+            Architecture::Hopper => Some(FspCotVersion::new(1)),
+            Architecture::Blackwell => Some(FspCotVersion::new(2)),
+            _ => None,
+        }
+    }
 }
 
 // TODO
-- 
2.53.0

