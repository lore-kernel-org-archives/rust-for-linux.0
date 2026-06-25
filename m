Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83C53E5A0B;
	Thu, 25 Jun 2026 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782400190; cv=none; b=VG3ho9bv9Z+oH/JebzJ6DLB36o8Hu0Forazm4kRBRuWSY3HO1cJ4Gevo+U+HLaFj/zpdOVZYKOsOwy1ydzV8lADHiEtgoh0XJwldbP13JPMmjIHuGtsC+14BPaBhoILXI4hTxZuN1SmYe9d6n9E9BRxtKbLpn8QBlAFN2jRuDiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782400190; c=relaxed/simple;
	bh=Zq461+AzBg5lkGAAIQOUfeH316Azf1+QL42ecl+f7/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fR9/2P9T/vXIbD7rw9DB98hCGhAmhi/Ka3cDyfkaZp0P7vBOc775SK6Ug8sujGWNCUOVXFX8EeL705yUxHZhz/ryAvWQjwCNYpMYfI0O61zLOj6Pa7XjLzQsgq8yCc1t1p0NfxFPbaRK4M7852cTDd/wK0HRXkGvincGHwSAgeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Hs6KYbdI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Hs6KYbdI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1070A1F000E9;
	Thu, 25 Jun 2026 15:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782400188;
	bh=piaXtqFlwnh6KpYIjqaEVr8k/Hd2g3Nf3bSZL3GIo1Y=;
	h=From:To:Cc:Subject:Date;
	b=Hs6KYbdIRgxoiniFyNk59giJjNMH2JsnkumlPwo7i21LD1oo2PuB9dxJvlGkHarkb
	 rAdZ/j2vFZ1TAhKFQ5N3+abVkCmhkc/ANUQjrkYSbVdOrXKWi2hLMB+gNTaZAKm50o
	 AspnvOAVXH17St/QyPrC/l55TuR9ORcO5eRMCCgg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] MAINTAINERS: USB: add rust.rs to USB subsystem file list
Date: Thu, 25 Jun 2026 16:08:34 +0100
Message-ID: <2026062533-achiness-outsell-a93a@gregkh>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=809; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=Zq461+AzBg5lkGAAIQOUfeH316Azf1+QL42ecl+f7/E=; b=owGbwMvMwCRo6H6F97bub03G02pJDFm2LoVNTrlCCfOuGm8on7yw66HBwkcLiwxP5cz6dGvC0 sIXcv2rOmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAil1gZFqy58jVXsPoyr+CT u5uiW81Trrn2HGZYsLTuwdQ77yzOz5onkx6W2zW/osLEHAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

As was recently noted on the rust-for-linux list, the usb.rs file is not
listed as part of the USB SUBSYSTEM files, which can cause changes to it
to be not sent to the proper list and people.  Fix this up by adding it
to the USB SUBSYSTEM file list

Reported-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3eeb134cb611..f477e348ecc0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28054,6 +28054,7 @@ F:	include/dt-bindings/usb/
 F:	include/linux/usb.h
 F:	include/linux/usb/
 F:	include/uapi/linux/usb/
+F:	rust/kernel/usb.rs
 
 USB TYPEC BUS FOR ALTERNATE MODES
 M:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
-- 
2.54.0

