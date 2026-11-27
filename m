Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795804297;
	b=Y2IUkYpf3bYNaN6a+yv8xA61cEXCxSnDBSyZRRYFlN1S4FVGsGIxZFCHCDnaAvu5tOYQ
	 iW25YnPFu29EoTPQjVrlus5Zrs91qsgIUylS6TRRmoG/U7QR5EFDET3qs1DiSXLiaxbuE
	 Dd+OxxeL8GjMK3LiMcj86TCpSp2KmwdF7/YVHQXqHtHpGqKjdro+7Dsvqxnc4yNHh/6n3
	 vmqnl1vaENuH3L0zk9jBJfeXDbw19abfkxjVd3B1OM+v6wu99euUPwWuILBKybbN+ax0q
	 WvjpnnLdi+VM8AvLr9KjvCU82ryDrkPK2P+/XFZgc3W+q7HbfJmqn6Mf//77z++FHqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804297;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=u0bfrnFDiXtdQaXbtRRFrG1L6zn8mx0JhpG3f4x8zTk=;
	b=DmEPlPIw1zm+oGnMIgpeE9YtXPc701dpQ+Xhi1/moVkb1hGyC4TSP9YxRPhZdHTuzhCW
	 f7KO0QsxijerMugZ1uJg64RkpCp64JoZooifnVWN/VoSb/sBFyguoSvq8uEzwKdFd+E/z
	 Oh1eew6wlFC0bCaH/63YqWW2ZdtA7kFqjPmDBk6egD+ELJejFTvEZry8l0CAMiKb/grmC
	 cm+oUChPXJPlIodKXoTRUWC/KEqNY1SqLWibjNMmeRbcCdyWkEgNLhqBSzYPQNou5/I21
	 roHPG+VXdMwVFeq50XAD0AfND3K8yH6mMchwSYFxuRtMzIodsmZmxMwC8XdatA/lSFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=IMeccm7S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B16606A31C;
	Fri, 27 Nov 2026 18:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3B16606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=IMeccm7S
ARC-Seal: i=1; a=rsa-sha256; t=1795804251; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GcMqO73PEdVaLiJBu5duohgpHn3k4/qNb5TYimDlaV7tEq8HCBTBrLkBwDrFjHZVYvw5q1VMjaK0WEu0wbXWZG50wFJRbxGsfwci766tf7Dx7hcBVfOQWlDo9xxUE/3oI8a4TKSXY48VzD+4G/n8s1ybxPk2VRCHJnNS/TS7jv8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795804251; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=u0bfrnFDiXtdQaXbtRRFrG1L6zn8mx0JhpG3f4x8zTk=; 
	b=eOC3d2C58YVoUypwyQbfyw0Xogzt/MEb7FB3Cg64fBb0pOgbR0HQXaEznSrDhWCnMk11XRiHrhuhmkhiwMerA/kLAkr7nr4ybSumscDiJc8W2y91FPWCAJAfBcEX4TSCrAYl2LVgk1CMerJeVPkglbk2h3v6XeuBqb0X06URSH0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=IMeccm7SE7CGdiT7iDATyEoRNrVcxDsaK4EX+P0Qn2XLbAN59Ozz1WTZnmFYnP+mxBtNXseY7i8gAw6sRfUu6cSDwH6CPNVa2oP7fNUCtt+Y9iGUVO6eBHZu2D5w5CTjq2zd+KgxJ1KupcHhtQE0PvRqo91/+BsVAGPMtcGA6Io=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=u0bfrnFDiXtdQaXbtRRFrG1L6zn8mx0JhpG3f4x8zTk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795804248352169.23768707491956;
	Fri, 27 Nov 2026 10:30:48 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH 0/2] rust: dma_buf: add dma-fence signalling sections
Date: Fri, 27 Nov 2026 15:30:36 -0300
Message-Id: <20261127-dma-fence-signalling-v1-0-c44e8f4910ca@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NWw6CMBQFt0Lut02gLVDYiuGjj1u8Boq2YEwIe
 7eKn5PMmbNDwkiYoC92iPiiREvIUF0KsDcdRmTkMgMveVNVvGVu1sxjsMgSjUFPE4WRWY3Coe+
 07lrI00dET+9f9jqcnDZzR7t+W38j4nPLf+upgdEJmV3mmda+0MabRpaGi1Yibxwq71XlpFJWd
 E7xWjpTC4UwHMcHskWnM8QAAAA=
X-Change-ID: 20261127-dma-fence-signalling-cae3def9aa97
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

dma_fence_begin_signalling() and dma_fence_end_signalling() mark the
code that the completion of a dma-fence depends on, so that lockdep can
check it against the dma-fence rules. However, up until now, it was not
possible to use the signalling tokens from Rust. Thus, add support for
it.

Patch 1 adds SignallingSection, a guard that begins a section when it
is created and ends it when it is dropped. Patch 2 makes
DriverFence::signal() take a &SignallingSection, so that its callers
have to be in one.

Patch 5 of the JobQueue series [1] changes the same signature to
signal(&self, res). I will rebase on top of it once it lands and add
the section to its callers then.

A follow-up series adds a workqueue whose work items run in a
signalling section. Tyr will use both.

This is based on drm-rust-next.

[1] https://lore.kernel.org/r/20261124122951.878199-2-phasta@kernel.org

---
Daniel Almeida (2):
      rust: dma_buf: dma_fence: add SignallingSection
      rust: dma_buf: dma_fence: require a SignallingSection in signal()

 rust/kernel/dma_buf/dma_fence.rs | 77 ++++++++++++++++++++++++++++++++++++++--
 rust/kernel/dma_buf/mod.rs       |  3 +-
 2 files changed, 76 insertions(+), 4 deletions(-)
---
base-commit: abfb640b2374e26de8ff81d488c39d8254db538e
change-id: 20261127-dma-fence-signalling-cae3def9aa97

Best regards,
--  
Daniel Almeida <daniel.almeida@collabora.com>

