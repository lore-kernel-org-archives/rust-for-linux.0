Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093244;
	b=K5TBec7OfzQl4JZw3Y0QCUT+IQCGSso2i8A6uiK20HZosBEvUjraUz2px9e3FCbn4pqd
	 SQe0/t8jrEpvLX5yxoCV4qegeDdHOax569kOV3MyR7UteUJFSQwMxGaRZYbFMSWZUwYNv
	 YLgKZQOPRHxLJDrZszYqLG7ZZMISOWmyaeab0TJ+HWfE+IfAFKBEjcYvUv1a3GvauhtyV
	 Z0af6vlVPxaiX2nkHAhHFRkMeg1K4S6mW3fxa8igTVQcnZbzQRNmBwaNAoQg4DPhMqAoK
	 Z2a3ufel8SAyrXRondW7cCFn7HYoDU3ye/YJHQNlt8vTmmKeixBii9xE/FfOe2GHNcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=UQzd8Q57y/Ls3xxOwRqM/QyCB6vFpKuUv/0iUG5QYLw=;
	b=mx0sjbrcUXyqMYpbc4EvmjUh+v25NVG43c0XM0bPuNsUt/CGK+wibBqjQ8v3lMTZtvqI
	 ItbProzJb8gI9EwKQ+GJ5FhrQ+BBK0bEFfhpeXh14Lzk+n30ACb7W4ePyUKU1m+RacZTn
	 3dJC0Eg6SRvOV/1liGd/pWbGVX3EKnXAmxqv+foYgj1D6XxwF4ghSehMfQI1S+BXfn/XG
	 BQ4UyWdnEH8U9a+j2NH2IS+2ubt5rjZIBysn5AZ38AQ5gptcccMoPHNNlNKVsGgCY6Wgx
	 C5spqTmO8omn4nII7IrswVMHKHv8XkorkuC40M2dljD5ksUYoP1mFz5a+VaUHJhGKFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=jCVw+2jY;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04340606A31F;
	Tue, 27 Oct 2026 09:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04340606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=jCVw+2jY
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZUoI786386;
	Tue, 27 Oct 2026 02:26:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=UQzd8Q57y/Ls3xxOwRqM/QyCB6vFpKuUv/0iU
	G5QYLw=; b=jCVw+2jYnIGOR3X4YjUtl69gpgbj0j5Q3K2Vt1mFdlK2WSi371sGW
	5ee4ZpkXjfQZUzTrxDqZ4BSwC8xXBjtIENmuWH6tVGZEa3TE18PvGHx2e1bse1xA
	0Mer8qxxEH+SgHxJ15VukXW6sAJ+ty4GHe6oc72rcq758fA5rA74LJbFua1BgZ1I
	qefN3JK/9GN9aJEyoKd3vacs0VycNNUFhtpFGQ5HGSkcCR0+YZJq+YnF+P+lsdiB
	xCghKGkKddR6UyEJbGvj1ArpNJerzxGztCXX37hXdOkJ9D9qvCD5dGtSbv1J78+k
	ECVgupOozN22wBN3zqWfb0fh3KyXLdshg==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hgr03sauj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 27 Oct 2026 02:26:52 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::8e35) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 27 Oct
 2026 09:26:51 +0000
From: Ruben Hakobyan <hruben@meta.com>
To: "Michael S . Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowangio@gmail.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
        <virtualization@lists.linux.dev>,
        Alexander Duyck
	<alexander.h.duyck@linux.intel.com>,
        David Hildenbrand <david@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Boqun Feng <boqun@kernel.org>, Gary Guo
	<gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=
	<bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas
 Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>,
        Andrew Morton
	<akpm@linux-foundation.org>,
        <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] virtio_balloon: submit reported pages as individual buffers
Date: Tue, 27 Oct 2026 02:26:33 -0700
Message-ID: <20261027092633.3831267-1-hruben@meta.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <02257263433b001cd0a55a52486857df81dd4246.1793057483.git.mst@redhat.com>
References: <02257263433b001cd0a55a52486857df81dd4246.1793057483.git.mst@redhat.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNyBTYWx0ZWRfX2VSj950iOp7Z
 N4wUJseZMVGKZFT1K79AoxkcWplGruzFczPACN072fI56TQBcnDIR5d3z9xwOl3ajLxPsqwGObJ
 CuUSxsqdSs93tlCR/U2JAOmERKs094+by9aPY+tm/nyVw+LUFnMZaNOX75mSL+NJh8rIEh3EbcS
 KNpUXo/GeaOtMEy/VfVHasI0kCR+8CiAM2djUAsoKmiLyKWFx1Q5Pbtqhi5c+O2msbXXsl64PTp
 /cMv73qNqsmaXWRfCit/ivJAut+1eNPR1s/2JZAThlCzzs/Qhk4czc8m6c0QIGyJocnDhJH9jA8
 bdPJ/0bKd0tXyQPsRxLTknWCyjFXREV/+whDLf2sTTBT90lZ7dnovYsQItV73YXdxjtmrkQoVEN
 PeQ3J1uCX8VFKNWEUPrKmPsvb+VzTVNwunqASjg3AouK2MR0As7MS2JGjlls7F0cZywDTTLi1GF
 RaLgrPa0I/W4jynFu9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNyBTYWx0ZWRfX+f30BYpJwjLB
 LmUOyQuTOtWnX0CuEvdTxgol7vKvhY+IeCsxOfBL2GHfF3WwefRcDFX6K3DwuhULowD6Mm9VTKH
 b0VEVZVwMxBHcJQY6zA2lJT96M6mkNk=
X-Proofpoint-ORIG-GUID: -xGNlB55EHYWHVXCVtCF10g8upJUtTZI
X-Proofpoint-GUID: -xGNlB55EHYWHVXCVtCF10g8upJUtTZI
X-Authority-Analysis: v=2.4 cv=DLUacCNb c=1 sm=1 tr=0 ts=6ae06e5c cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=8elwO82fXORLTBIkMd32:22 a=20KFwNOVAAAA:8 a=VabnemYjAAAA:8 a=QyXUC8HyAAAA:8
 a=w1El1bXDMijZuEW-F6oA:9 a=zY0JdQc1-4EAyPf5TuXT:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01

On Mon, Oct 26, 2026 at 11:53 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> The virtio_balloon driver reports a scatter-gather list of free pages
> to the VMM so it may discard unused pages.
>
> For an arm64 kernel with 64 KiB pages, the default reporting and
> allocation orders allow entries ranging from 2 MiB to 512 MiB. If the
> report contains a sufficient number of large entries, we will end up
> with a descriptor chain that represents over 4 GiB of memory. This
> violates virtio spec, which says:
>         Drivers MUST NOT add a descriptor chain longer than $2^{32}$ bytes in total;
>
> Specifically, submitting $2^{32}$ or more breaks Rust-VMM.
>
> Submit each reported page as a separate virtqueue buffer instead of one
> buffer with an sg list of all pages.  This also avoids indirect
> descriptor allocation (kmalloc in the reporting path).
>
> To avoid multiple buffers causing interrupt storms, keep callbacks
> disabled while we wait for an event.
>
> TODO: as an alternative, keep using virtqueue_enable_cb_delayed
> but add buffers after there's space in the ring.
>
> Note: if the virtqueue is broken, wait_event on
> virtqueue_get_buf hangs.  This is a pre-existing issue:
> the old single-buffer code had the same hang.
>
> Reported-by: Ruben Hakobyan <hruben@meta.com>
> Cc: Ruben Hakobyan <hruben@meta.com>
> Fixes: b0c504f15471 ("virtio-balloon: add support for providing free page reports to host")
> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>
> Notes (changelog):
>     changes since v1:
>         keep callbacks disabled while draining: get_buf re-arms the used
>         event for the next buffer, reintroducing an interrupt per page.
>         Disable the reporting vq callbacks at probe, and only arm the
>         delayed callback to wait.
>

Thanks for the patches! I think sashiko-bot found some issues on broken
queues in the first patch that are worth looking into for correctness.

Other than that, I tested the "normal path" on QEMU and Cloud Hypervisor,
both on 4 KiB and 64 KiB guests, and this works correctly.

