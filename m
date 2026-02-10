Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A58C2E7162;
	Tue, 10 Feb 2026 02:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691589; cv=fail; b=XibBq+fs00XWi83Gfth62m4X8IPvgBfFN5P7ztWmz5aw5TTB/t1aYG5zErb3Vt7ipGwm7V+1Ok79XZptNj+mylpLDPUSMx20/dnmXt5S7DY3d7bC7+Td6pZRwqjRgqO9GOV8WjxUYO2hF6gvM+oGNzD8TblHuplb15mGVp6NcMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691589; c=relaxed/simple;
	bh=jzymBtfXHKIhUhdSjrBpq5EDx+jkcgiHlBLMFqn3Nds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t8apJi6zELx6/cQI192ZiVXTjlI3uyaQLevqAVkyKW70DVH0CDWrXtNT2oWwN5ClV7Kd4NIBmqNNfUnja2mKHsd8wQLGeeWN/nciMKpUtk8vt6gwZLL/9gOeY/j4QDhrsVjiUPvkcHo3rfqDz4YyLuSwlaPa6X1xLJYodTbsMxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HE8RJcOP; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HE8RJcOP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUoSKg5+ry/UmOvYd8tu0A4HAYI9a7dCGzv1jH2tI5NSHcMrKEmJUiF7/zhPrZfRUABpXQXXrc6Laodmm3sc+oPA0NA+Un4tcg/dQ+QyYYgm8LnNajgRmc+Ug5qxmWzbpy/M6N1KDOLGCcCPdzQyrYD+uwdyD7CLoB5P0F++ZPabX4sgLBG6FFKIydXCJJbOipnKaGQ/ZevoUbxHywDB3Uv547EepqP8vj2B80nXx7uhznhu/0dQp1xHfPb0U+5kPy8C6pu5xTNjxPvGR/aPa8/8BzTO9U+7zbfmyL1D865u8rIAKteaBDhq8lgtxGIQYEjIAm8QpU1RA8QJx/xLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdYM8BVmIFn6YxTO+XuFY12UyRiggdFxk7uSCVFCOnE=;
 b=eCMp899Hh1k6WUKzRsNQIZFLn9puUkmsXhDRJFRm/TCgaE7YwNxBogX/gKV7RwtFHGiw+KEvG5X14B/W2UldsH9nU4uk09UxAlJ/RDl39V7vDuLrecvfoK7OBZ5x0xreeJuoklp1LjZcCAuynmMNKIufOsisl3R9E+3koiaN9jxyYMkPVVUQ+5sDK3X3P1gyFoEnM33QJr/Im2cEF7rat58YtvJ67Rrol6YwwLRLrdhB4klG+YbK7Xp4ZcSquQuwla5eX408aQHQXaCuU77ZQ/Zbta577FuQMlm+iAYmN8x1+lPl4ozbXPGschKKza5OvhwS6nmhQaN6tpfQPgcqgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdYM8BVmIFn6YxTO+XuFY12UyRiggdFxk7uSCVFCOnE=;
 b=HE8RJcOPsnJ/4DsPH7RSjKC/1Gid7mAlSc+HcAJUZqy7qMZixwxZvmaaPbi3jVxmx6RKcRZPmhgMdbHCc4bHcYYMnU5zJIrWx0Gmcnf8r8+ICmXo+p9F674jfLPmwQ9Z4Qeq63ZQKFWQdyd4+0EZQzaEisV4u7xC9zfI88zxvKeR4m2262jprjOuUCOWACiy5hZXiA3y1IbhNWfTpq5r3EP0Jl6NU4kZgFRTKRSCyerLbszJCh08HpvSZOTySlIx5srRGDo5ykj79VKo98jI8X75QxNQc6P62EbnSCbP1W2aw5lxWsVV5Jvcs70uyb+Uq5qLP7KWYWMlk+2ZQkq1DA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH0PR12MB8797.namprd12.prod.outlook.com (2603:10b6:510:28d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:46:09 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:09 +0000
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
Subject: [PATCH v4 05/33] gpu: nova-core: factor .fwsignature* selection into a new get_gsp_sigs_section()
Date: Mon,  9 Feb 2026 18:45:32 -0800
Message-ID: <20260210024601.593248-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH0PR12MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: 082c9da5-82b7-4b0a-e230-08de684e8b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vfB9+uIhCSRhDAe1G6tVhmLEwYAWqpKUTZYATeOs/mCPxTn7yFJwjUHH0npB?=
 =?us-ascii?Q?fWgM8Jvw3iZkipErUcyzHwrwF2TMMezV5OJPxBUWQnhimYUTDLyEJSHdEtJw?=
 =?us-ascii?Q?ozOpCrT+o2jQQdNs0vjVWVg8suGfTzyhrjUWXqz1WqpMKhy7z1Hp4I+q3niT?=
 =?us-ascii?Q?1S8On47TwU6vMgtISDJI1yVP4ZydqEWGh/evIKjI/qmWzj+VNeo/h+OH1WXN?=
 =?us-ascii?Q?U2qkqf7k50yQ1q7IvXv9IECm1ChEHc4xML3OmzbSlQjFcv3LQPHHlCzfMbI/?=
 =?us-ascii?Q?MvLPMUlijIh8qSks1oKuCvMDgngp5bCZ9f/wXmQzV+KmjyusQhXOHGdeE1aN?=
 =?us-ascii?Q?fWAfvzvMKSqwRUpS/teqBs0mdnGPlGOKvv0IxlPstJgFj9WLfVyJVOqV5Saa?=
 =?us-ascii?Q?6+aEwSxOwUhf1qD9FOQ/gWaue2rbVN+G7P/WuRS67DkqysIor8CUL7TXGoF+?=
 =?us-ascii?Q?gs3U1LkuH77xAa7AHUeobDvs/gDfOiKgMxSAWcJDIAJ1stH7L2LgOKcbYyyn?=
 =?us-ascii?Q?9UWX2Bqb3RivZXk0FxldsVOGcP9xEyFM3hvvwy3pzxobqFdqgsBWkUfT3bL0?=
 =?us-ascii?Q?4gd1CGFLYmLORP959yb1OxBg3ofuR/83hj6bGVy7n2jJcNWi2mLsWU8mM5ZT?=
 =?us-ascii?Q?+7CcYLxifl1jWoFmQgt7Yu4hI9GhS83ymgx+ksminwqSf72zo3f3S+TJGoxM?=
 =?us-ascii?Q?ygPmlh+1gCf8YmSyAPMXC0PDwA9FF9bQIK0ZfxT7me1chFMCFCdBi6G1n3zM?=
 =?us-ascii?Q?+a8ylEgebi/TLTKLll//lShbkRuQiKKEZVGypt6qBeWWsqoT4M0Mtfo8m/JE?=
 =?us-ascii?Q?x6xDvSYr0CxBSe+1X12WFpBJ73cajuOC+pNSszMV8O0/mfZ/XNOx2ovBNCHD?=
 =?us-ascii?Q?IOA7abcJAUIR/DiJdWakmwVGnyfQC2F2nwtb+jBLvvmiIvBod2BLDxTUGcZB?=
 =?us-ascii?Q?ivXJYe8C6ngTzNwQoGHGy3X9zjirFGmqrmBkYTMco55Pcw/0YFKp8vADTudE?=
 =?us-ascii?Q?Z3FIN85o9/Hg/cy7t9rfyC5Kp8dvp4UJaIC0J0KK+OeREIxDX9k23eLwpcle?=
 =?us-ascii?Q?Cv3GsYyDYIVCp+wvWTXzi98oh5TIrgcOdNOnMVy8z4TAr2DdGg5uSxv1NmHM?=
 =?us-ascii?Q?fYV6wyMJr9oT4RSquYmJHhGGhnJSSjSsvZAMUW70F6+2xKS0GD8476yFTA1I?=
 =?us-ascii?Q?XPL/nH2KRuwqZPEE3XPfqdfR4oW99AAOY8MZ66gxIw+oyrTQw96sNnK3Ny0Q?=
 =?us-ascii?Q?e+gxgqBFW5YHkp0TveYzApfCobY4s+57bqPAw/rVH61Sr9Eg2RWsyXZt0T1T?=
 =?us-ascii?Q?biW/bekDJwMWH/BXY4kSOxU6poAjxxEpVhG2V4nvJSVQKeEGTN6K3KY4L39F?=
 =?us-ascii?Q?qPhxRQIGJRkIAz8RlOerNpq4emjFhq9Fw0Cj6n4xdZM5TaKd6pJXZ7Ej4RMT?=
 =?us-ascii?Q?h+4+v4Qfs0ZQ0uX7sTddo16FboK9DKZb5x5c5/i7BRhUI+5luJnCqLPlxobN?=
 =?us-ascii?Q?iDjDBQWIe43UugrZkWsammGBoLcJJrOSQsW7XK08MW4ggHCD43vfenp+NWx/?=
 =?us-ascii?Q?HisyB21ITAdmZGfvssQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?emTAhNhjspL8V9OCfSaxZTKLRmxoTDOSRJCA0sZHga72S0Y5wVXKxl6oKehG?=
 =?us-ascii?Q?QJZ9z1iVQjhQg2xqwPhX+DEWE5z/9p04WFkSxoOciAsYco4/EWnUp4+VBExk?=
 =?us-ascii?Q?RWo+LJeCWahtFW82V+czb4G4mpb+KqBkzjviu8gBjySoOoM+WrzabWK6Z2vV?=
 =?us-ascii?Q?cSsV1bT8vOL7SaCWoGdfk69eT9CHUg0fhdeP4ST6cfPva0Ek2vo5ya4JN5Cj?=
 =?us-ascii?Q?/46HqmxJRtT57Z36lWMALpxwTkihLgPRVFPluvhHVVOwXeRaQxjY2o1GCnZO?=
 =?us-ascii?Q?Yg7Sm8DM14SwD2XgKWkfXTwFqvIITCPfHpi19LJRJvXYJV9P5XTx5l+6XVjM?=
 =?us-ascii?Q?l/MSTMgqTL+KRqzlZ0rmQip59syDYWsNNyZBh9rw0lJoB+zhHFFbMwHZHNUq?=
 =?us-ascii?Q?bN095F3JNAlVsSQoCZSu3fEj1WtclZa9sNYr7ZZeBgyZKbMhsJ08PY3CZw8/?=
 =?us-ascii?Q?l5ZcvX4fW6Gng+YiPTBRNyF7Fl3YhPSccIRNYzvcMhZq1Idp0AJWWMI5UE7L?=
 =?us-ascii?Q?Txfy17P+Lty0lk71Xv29ZqeOa6bN/KiautFnq0D9QtfKxEJdY1+6OhNqUwcV?=
 =?us-ascii?Q?MKIt4wzKEyL6EKHqxKhOGtFBZFyJLhI6NuCbEnvrnSeA2ZU15OM+nSH538OF?=
 =?us-ascii?Q?j1aZWda0UwZkoonzlAcp4Ojsq4DXTnO1wITDTjcnGRgzIFQb9Z66UcKUlOHN?=
 =?us-ascii?Q?Ceo5f7rje26Ug6XhAde8zO1c5FQDHVCFN4QyxttKUZjIGSVzW+cgQc0eokns?=
 =?us-ascii?Q?k4mvRP8jRwtcGPwV3Hw2AdifgiNvvRBACoVKaoQQ7VcI06ztge5PXmaRRAgE?=
 =?us-ascii?Q?Y/gUO6V5975LrdU1PLiVgTf2bR6BDHiJHpOdRw7lLJTxONL9eKpvBYheCfxW?=
 =?us-ascii?Q?+zqVF3RMumEVQ8CWviacFlPVoJ5BCa0WKvBxdXqMzNrnXtXaG6cet8Jqrl15?=
 =?us-ascii?Q?yLOGJOb2VBFkz4f8H3rEl4OOMEUh02inNu0OYhDDg4VODjATQFlTesHiIqQI?=
 =?us-ascii?Q?+i3GzXoc+8085YWAzoYU3HTsS0k8gdFHiSseOYHu7txp6UnjZNQvLBkBhrpa?=
 =?us-ascii?Q?pP1aEcyIH4xyb5j80f1TcPCDdfJXXTXjz6Gc+WfJ+5ZVsawkRomIZEH7B9oT?=
 =?us-ascii?Q?57h3M5S4DEIiBjT3g+IYnCo6pfmH3Yv9wl7SVDSIPxUZo27dpoEwRaNrgSR+?=
 =?us-ascii?Q?sr1iMc/1m6wB1NaV18wiex8PNME/uC5X6ddytsHbExY/4Qi8Jsr8lTOHjqPP?=
 =?us-ascii?Q?P83EF68U0MFZg8SbiEq8IOf8CKC7v6XCu0A+7mkvVP8MfrUaTXA0mAKhpbSQ?=
 =?us-ascii?Q?1/Pvd8U2X9O/Fv/EikFn7rp5mSBd2x4tFYoZgW6Jq12zu3wvpuEZtkuC8QoI?=
 =?us-ascii?Q?waqlHV/wIoK32f1ig5MFUSgeoRpNzDbxg1+TfCXEqDBaFteUTGd1QrAcYZI5?=
 =?us-ascii?Q?R+NfAT2Qvcf3kbJMekAJJp3XxkvREvXrLTwS8vcRBiDYXcfquFcZWb934eIY?=
 =?us-ascii?Q?6fDW4bcglUNRzI7OlpKcMi1S+m7elNfF9CMGo5u3e1dEor4ohjbtvG3lDf+u?=
 =?us-ascii?Q?U/rn+zDcDvAP2Tm+5BUMt3svV3u6IjJfdiAwbV9ItdFLCzf0TXjRKLgmD3uE?=
 =?us-ascii?Q?nuaHqaDcNAOpoMuWxffvdLfocEbnb7JD67gVZ2I3lxdhABWk3uo/ErsCs5IW?=
 =?us-ascii?Q?lJUjkZEZAgwyWnCQEL/T11RbqbkHwgwcS4StwLKFsy83y1cBdhr7WmleDBmi?=
 =?us-ascii?Q?0CZuh2pwcw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 082c9da5-82b7-4b0a-e230-08de684e8b8c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:09.2926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0lRYG5ElfVQYn1saxeGhr+kqUrcHqLT3aJ5mEELC5cZGSzgFS5Oi/71xucsI2QERGFEbRWn4l/cz5A6WCGemg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8797

Keep Gsp::new() from getting too cluttered, by factoring out the
selection of .fwsignature* items. This will continue to grow as we add
GPUs.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 60 ++++++++++++++-------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index bc2243450989..10761716ed93 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -146,6 +146,36 @@ pub(crate) struct GspFirmware {
 }
 
 impl GspFirmware {
+    fn get_gsp_sigs_section(chipset: Chipset) -> Option<&'static str> {
+        match chipset.arch() {
+            Architecture::Turing if matches!(chipset, Chipset::TU116 | Chipset::TU117) => {
+                Some(".fwsignature_tu11x")
+            }
+            Architecture::Turing => Some(".fwsignature_tu10x"),
+            // GA100 uses the same firmware as Turing
+            Architecture::Ampere if chipset == Chipset::GA100 => Some(".fwsignature_tu10x"),
+            Architecture::Ampere => Some(".fwsignature_ga10x"),
+            Architecture::Ada => Some(".fwsignature_ad10x"),
+            Architecture::Hopper => Some(".fwsignature_gh10x"),
+            Architecture::Blackwell => {
+                // Distinguish between GB10x and GB20x series
+                match chipset {
+                    // GB10x series: GB100, GB102
+                    Chipset::GB100 | Chipset::GB102 => Some(".fwsignature_gb10x"),
+                    // GB20x series: GB202, GB203, GB205, GB206, GB207
+                    Chipset::GB202
+                    | Chipset::GB203
+                    | Chipset::GB205
+                    | Chipset::GB206
+                    | Chipset::GB207 => Some(".fwsignature_gb20x"),
+                    // It's not possible to get here with a non-Blackwell chipset, but Rust doesn't
+                    // know that.
+                    _ => None,
+                }
+            }
+        }
+    }
+
     /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
     /// tables expected by the GSP bootloader to load it.
     pub(crate) fn new<'a>(
@@ -211,35 +241,7 @@ pub(crate) fn new<'a>(
                 },
                 size,
                 signatures: {
-                    let sigs_section = match chipset.arch() {
-                        Architecture::Turing
-                            if matches!(chipset, Chipset::TU116 | Chipset::TU117) =>
-                        {
-                            ".fwsignature_tu11x"
-                        }
-                        Architecture::Turing => ".fwsignature_tu10x",
-                        // GA100 uses the same firmware as Turing
-                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
-                        Architecture::Ampere => ".fwsignature_ga10x",
-                        Architecture::Ada => ".fwsignature_ad10x",
-                        Architecture::Hopper => ".fwsignature_gh10x",
-                        Architecture::Blackwell => {
-                            // Distinguish between GB10x and GB20x series
-                            match chipset {
-                                // GB10x series: GB100, GB102
-                                Chipset::GB100 | Chipset::GB102 => ".fwsignature_gb10x",
-                                // GB20x series: GB202, GB203, GB205, GB206, GB207
-                                Chipset::GB202
-                                | Chipset::GB203
-                                | Chipset::GB205
-                                | Chipset::GB206
-                                | Chipset::GB207 => ".fwsignature_gb20x",
-                                // It's not possible to get here with a non-Blackwell chipset, but
-                                // Rust doesn't know that.
-                                _ => return Err(ENOTSUPP),
-                            }
-                        }
-                    };
+                    let sigs_section = Self::get_gsp_sigs_section(chipset).ok_or(ENOTSUPP)?;
 
                     elf::elf64_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
-- 
2.53.0

