Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795712009;
	b=OBtzUcjsont5/eoCrKEexg8b33OgfMsG7jhU6qqGipfAwCfu+EV648VfjAw7czPi58R6
	 nzj+tfQ/VZ4sr4uvzAfa4Iu3jLTfq3NJil1WG26vIuQDagqL3hxbHyM9X7Ry8EN4ODOLV
	 4bHdrHSOMJTjZ3Rk4jJx6hwCrzpDGltP/c0MMZm/9bZMGT+y+e/RGjakORbkOrxE0eF4z
	 WSpba95LXxCINU1/ukboEnWXs8EK/0O8EltoW9WFJnfgkOSHjOZp1igwYj9qqkm47/djr
	 hUjT/hMUY1DTkT9BTaeLNT3TIheNZ8X5Cw+XMwGF1DzoaL6a9sGoeJnghJg+CMB16zA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712009;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=WMaZovrqFePOxFZHi6LrHIJhAI8Su22jubOvzidTT10=;
	b=vFOu6iOAg/KCepqjSllOUDC0DZxSvst0KbeTLx4cUxt0+exPWJOfrm1njIHWNgE+31K+
	 Odv1JGm4wZSbROrZKimIRYd/d8eR1W+09BsilsXjfFb0V8ad9afFdD/yPbyPWOT/HtUcc
	 xg93UVsJxuUm+hTqS1MZ8iE0A6Id5EdpZmJwuhAHObWM3QvhU/jl6u0DP7vJ/qkDmrNIt
	 cBOm/eXRuTl++lGbins5MeX9fEHJIxGzJX17lwyOA2yHH59bcAEGvLBHLL9+4CQp72+Iw
	 w8FHyFWq/8DdlCk8uhAAieWnG4138FtdtYRUMJc3o4eEBp09nbt/u7O668pEQ3q5MBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="muJRJI/c";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C293B606A329;
	Thu, 26 Nov 2026 16:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=muJRJI/c
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795712009;
	b=xf6gH+sv2vHGsrELHMJoDEU9kaiOGhRhFjcODuWnLz4aQNXCMTmkPecjmlZQTsQnrXgK
	 cZvvUwEXphi9H376iKuKZhVEfp5hhGZOMtEa+LF6z0c2kftKhW/3bMJepCosE+fkMJ/Zb
	 caY1ifCLMZ2qgatVt8Nu6wnBdSZxG/BHnSK7rCEenMcS0Gib4CYFf9xP2rpNCnGCVS4wF
	 vcTH40Ceqolw0UjJs6P3+T517SSZjOOBCnpRjM5eFBjRDU6o1ycVD313WwNaTJomSllqT
	 ah5SoBWkuh6a8pCvbh6Dc6p4RVz4pLlu7Nu1pcqnEvrioMIUQjIZhzQhUN7PyOCzzSw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795712009;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=WMaZovrqFePOxFZHi6LrHIJhAI8Su22jubOvzidTT10=;
	b=lM6GFaJNNVUz3pEvJokl4Hm8XxfNcwJNY15UwBzdO9/ULKK0mr1/cGMm7VTf6AuK27FM
	 5sOsAkTVR70UBn45WR38sbJol/Z/xFG/3StehWtJ87OaLZppbF2CdyaPws2JW6ZYyFQOw
	 qS3qGiFW+MsHHBXqdKa8qxUhBKPc2zZrwOW3CEkLRQ+EtIlDvSD+hrt6xinr2p188aAjX
	 8axmolemLYgYi4MJDig261oFA7zHyvoIR6/eA7cL+0D46DoFXZcgGplRFK5f7Rcn399cD
	 N3ixi6ggUDgpiyaQZx/djs5xvGP2slNknO7Orqao2rT3TBXCn3xGVi8Cp1Gxk/WDY/A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01BE81F000D3;
	Thu, 26 Nov 2026 16:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795712009;
	bh=WMaZovrqFePOxFZHi6LrHIJhAI8Su22jubOvzidTT10=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=muJRJI/cbX19ZFrGlYuwcuqOHVHJtiGvThi3DpYOqxr/GOBqBnVZ5MucxNrv6nQPr
	 nBRtLFazfQ8fdDHrpQV64Kkomwb470A/kPLBIY2ntPQZol4Q681ypixUUGAzRXOvXm
	 5OAO1EaRcDgsDxxhyio9GGHWjaM2oAUZJMzCd4KfAVFD5Gj5jKBVwz0zecQuDYZvvN
	 k4oDwoNJcOxkKULWfr6aL3Dsyo/ttLZufWdfcYSKtRQLYOTElXhav2g+AjSXTpWYl8
	 JWhGZYrp5Sm70oIAwq41dauzWkpZCdFIOW7fA+ahbFxnGGOFs1Azq8gCTGREQ0ca9R
	 NRbp+P8Dcp4cA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 856C44D725;
	Thu, 26 Nov 2026 16:53:19 +0000 (UTC)
From: Peder Bergan via B4 Relay <devnull+peder.bergan.gmail.com@kernel.org>
Subject: [PATCH 0/3] drm/panic: Speed up QR code encoding
Date: Thu, 26 Nov 2026 17:53:14 +0100
Message-Id: <20261126-perf-drm-panic-qr-v1-0-51856937dc4d@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAPpjCGsC/1XMTQrCMBCG4auUWTvYBhPUq4iL/EzsCI1xUqVQe
 ncTXbl8hvneFQoJU4Fzt4LQmws/UsWw68CPNt0IOVSD6pUZBmUwk0QMMmG2iT0+BfXRmROFPh6
 0hrrLQpGXb/Ny/bm83J383ELtw9lC6MQmP7ZT4/4v2TBx8ZhomWHbPoSdYyOnAAAA
X-Change-ID: 20261126-perf-drm-panic-qr-58b69ed0f455
To: Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795711998; l=1688;
 i=peder.bergan@gmail.com; s=kernel-contributions;
 h=from:subject:message-id;
 bh=iDsLMb9aE0AlmFCf+gA2dXKbpkU/dhpl3hq2AY5ctqI=;
 b=40xnObcbPohCg/rGboSbRgdZHBAKadpaSbTlyOBgw/YCPJSPXbZ6WunLCvCJWFT1bbaIPdlLl
 qv8dqwinY1KCL/FRNXVcX6qTtgl81Iyvns5c79/Zzh/SAemijqXyg3N
X-Developer-Key: i=peder.bergan@gmail.com; a=ed25519;
 pk=39790pn1YZCulHBoUG1uiQI1Hm01EvhBEa2zVrS/yN0=
X-Endpoint-Received: by B4 Relay for
 peder.bergan@gmail.com/kernel-contributions with auth_id=1395
X-Original-From: Peder Bergan <peder.bergan@gmail.com>
Reply-To: peder.bergan@gmail.com

The DRM panic helper encodes kernel log data into a QR code. Speed up
encoding by searching alignment centers per axis, applying fixed mask 0
during data placement, and simplifying exponent reduction in
Reed-Solomon error correction.

I benchmarked the extracted encoder with Rust 1.100.0 on an x86-64
Ryzen 7 9800X3D. Across 12 paired warm runs per workload, median
version-40 encoding time fell from 1.778 ms to 0.277 ms with a
2,900-byte raw payload and from 1.782 ms to 0.284 ms with a URL and
a 2,800-byte payload encoded in numeric mode. Both workloads produced
identical QR images. The timings cover encoding only. Log collection,
compression and framebuffer drawing were outside the benchmark.

In the differential checks, each patch preserved the returned width
and all output bytes across 6,002 raw and URL test inputs. The mask
traversal check covered all 40 QR versions, including the remainder
modules.

I also ran the drm_panic_helper KUnit suite in x86-64 QEMU/KVM with
the QR URL empty and with a URL configured. Both runs passed all 45
checks, including 15 QR cases.

---
OpenAI Codex assisted with coding and testing.

---
Peder Bergan (3):
      drm/panic: Check QR alignment centers one axis at a time
      drm/panic: Apply the QR mask while drawing data modules
      drm/panic: Simplify QR error correction exponent reduction

 drivers/gpu/drm/drm_panic_helper_qr.rs | 59 +++++++++++++---------------------
 1 file changed, 23 insertions(+), 36 deletions(-)
---
base-commit: 5ce32a0c94a827ff44ee60898c28060714dcff75
change-id: 20261126-perf-drm-panic-qr-58b69ed0f455

Best regards,
--  
Peder Bergan <peder.bergan@gmail.com>


