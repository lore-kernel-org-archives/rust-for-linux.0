Received: from mx-lax3-1.ucr.edu (mx-lax3-1.ucr.edu [169.235.156.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C126C35B654
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 04:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=169.235.156.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780635003; cv=none; b=UxD8eNZ/itginiBPcBwDYLCzg6Pp14Uflm0Far7f4Y//9gJ3p4BhOkHvWYjljZC8bMud0OiLgxu2fJTBPtqy44hALPIvx005dqL1paU0y1il4NMnjsM2EnDaedmBO21BGFpThkM4ROZypMJn2e0Ip9VA65RIEkRtv600FrmRvtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780635003; c=relaxed/simple;
	bh=z6Yaq3fFuQw0/vuL+BbfRwzfn9/y/k0CQ6GeM3Uvt04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d4LSyRqoz3BqfrMBWqSQb6omK2RoGF8CkX3PJb4wgSyjBwx1tSWEiILVFt/TTfFZBmnzE6ITno7aSHPFe/rLeXBnFly0MKOSR7gQ5wbqhTrDQ0Zcam3q2wHteZqxrUAR/nntETywdHpNhk1ow4OHkg0Dl1E2XvDgjt1qvOh8j00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ucr.edu; spf=pass smtp.mailfrom=ucr.edu; dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=eDqqTWDd; dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=r+3dQjtu; arc=none smtp.client-ip=169.235.156.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ucr.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucr.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="eDqqTWDd";
	dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="r+3dQjtu"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1780635002; x=1812171002;
  h=dkim-signature:x-google-dkim-signature:
   x-forwarded-encrypted:x-gm-message-state:x-gm-gg:from:to:
   cc:subject:date:message-id:x-mailer:mime-version:
   content-transfer-encoding:x-cse-connectionguid:
   x-cse-msgguid;
  bh=z6Yaq3fFuQw0/vuL+BbfRwzfn9/y/k0CQ6GeM3Uvt04=;
  b=eDqqTWDd/ckIdL1a914Pfwwp8p0oSAjI+HlOXCGjdMsWE+esBRcaFCqa
   9oMsvfAtRTkXjidfaK15AWncL+WpH/OLfqEpkwum+9yodJ6op8RNTzT0r
   Xy6V/nE8PAVNQFXwUHwevXwxWgrf5FW40nTETXiSbTwEnOCa1DsN4JCes
   gf2HGwQpCfL/ZOk6biwGq0kDCH97DBhtncYCNkzB8NPxlsIMpMpaYVbMc
   HE5NtkEAypJOBUcZrU/dh87z7bQ2IQv7X3/lKVb80AGRckUDp74dKgIjp
   gRfL3CLlByefXUj+7iHVz0RxA/4ycyejfAJVeqhXRVX1ulJW55H+EMXis
   Q==;
X-CSE-ConnectionGUID: NEQ01SiSS522LZDbN4d0gw==
X-CSE-MsgGUID: 6GPUEF2IT6WL5+iTSylyuQ==
Received: from mail-dl1-f71.google.com ([74.125.82.71])
  by smtp-lax3-1.ucr.edu with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Jun 2026 21:50:01 -0700
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-135916eefa0so2494705c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jun 2026 21:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1780635001; x=1781239801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+qXJdnxhuKYIilCUDPSysK89x/OeJb7RhI+G3V24KG8=;
        b=r+3dQjtuwEO7IB/jdTD1RfBgRlElEjBOx87Vz0ZATrbMwDpvGo/aq2oW8f2DGL058D
         2CcyKUmWmVArkqeDEOSt62Ol6TV2rn3xwzZPA7LB4/dXRNmaHUek700AW1bBWxs1DFKy
         qGv5yBBqGgzp9hN9PTjuq0qGwPmWg6kMsYUb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780635001; x=1781239801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qXJdnxhuKYIilCUDPSysK89x/OeJb7RhI+G3V24KG8=;
        b=TfD8lLDIL60wleAGQ05l2CyNZ77DoSFjsqivfUAwuJk8L+Frjeehc3Nf78D3PUd9Tr
         H6g3i9EEDizxYuV3x60Gf96AhTSBqqUJy+hW6ur4827ieuvFjq6UBuU3a/vAyalVsEaI
         SV5mXd5y12w5PZlAxS5FL/k95o89rNO0M6hOlYQz0O7VVRtNe85NAYZO4zmZUoo+MM71
         QO7dwCJqzCRUDF2Wsx2x1ZKmdtj38USj7H7gNrGVsH2WBS07ECFgJUGnmartIg1OCEt5
         fCvnL+AKvMZ1E2AdIlI6sbfMnwATVx5AXZ/Ytn+FI8S00TcNkfJ2+44RFY3a/0XxyLDh
         brPg==
X-Forwarded-Encrypted: i=1; AFNElJ9cAoocSVBEjNHpw+k+yJRJv0GYRD8/gNlBWMpE0ceqbG2l80+R7LHHat2HQkD+ldEfi016BWM/IjSgUZQiwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0zkUSy28z6SLfBRSaX1UjX+GAj3UrLbBgbrYnMcN7ewGS5IlS
	wTderA86R+pxCfsUsknrAXjJ5fk9RZTVUrah7SbpXfFLSZ9/oibT7UxzQtq1jDf/JCV/aHQutIu
	ZRPARxRDKJEximr4AYXmVeuuxphPJ/d+CtL86PMBQhXMJsxnHGa+KaUK1cAHxMHZWCvh8LQ==
X-Gm-Gg: Acq92OEStgYuRkaPt1lt8EMSbwY6O88DyENh2MQP5ou78VjFVpjI+hGOXqKDrcsXIFS
	GAb1ASaHdUPlDzDyrPrwU3j3t8WSj2mGiLGN18HVVPy6M5N0Mk1d7Q36/wvXUoMMFYsem7Ae9iC
	cjwokJPVjsOrBaOQr0MtKGE8V87hiIw7zMWbVviL9qY1QjxtRJ+2ZRd+YlUatl53MaSlCvi5JIv
	uXc2gLr26n5Eh1NtXuV1MMvO01nhLdUjwxlfWvsJKpQyaMF6E3s3KfpxDahg2ZapKn3d3oEMJU0
	5zq5NYBde53b+xR5F6PivrAG/mwAdp1yA0yiXRtwoLUXIx13Mpyys37JrqE0n/7vVqtJhUSSgGJ
	N0yg1FnXDYlWV1rB7c+YmQ5HEcbWaclvEmYXjWxrhkU1nEk6/1rrswBA9kKsrmvVaIuxSWXTK4K
	HPR+Jnf9G0nmQl9HoOFxMaavVRIM91l7nPHVaZ3SjXr8rAZqfjXBeHSKmeMruNqMYMkQh3qJY8X
	gPM2jHzog1d
X-Received: by 2002:a05:7022:43a9:b0:12d:b3f8:60e7 with SMTP id a92af1059eb24-1380672476fmr940733c88.34.1780635000617;
        Thu, 04 Jun 2026 21:50:00 -0700 (PDT)
X-Received: by 2002:a05:7022:43a9:b0:12d:b3f8:60e7 with SMTP id a92af1059eb24-1380672476fmr940710c88.34.1780635000174;
        Thu, 04 Jun 2026 21:50:00 -0700 (PDT)
Received: from ucr-secure-48-10-13-243-195.wnet.ucr.edu.net (ftd-border-nat-ucr-secure-v348.ucr.edu. [169.235.95.220])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13805ef12bbsm1056181c88.3.2026.06.04.21.49.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 04 Jun 2026 21:49:59 -0700 (PDT)
From: Yuan Tan <ytan089@ucr.edu>
To: a.hindborg@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	rust-for-linux@vger.kernel.org
Cc: zhiyunq@cs.ucr.edu,
	ardalan@uci.edu,
	pgovind2@uci.edu,
	dzueck@uci.edu,
	Yuan Tan <ytan089@ucr.edu>
Subject: [PATCH 0/1] rust: block: mq: make GenDisk Send impl sound
Date: Thu,  4 Jun 2026 21:49:55 -0700
Message-ID: <cover.1780633578.git.ytan089@ucr.edu>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linux kernel maintainers,

We are developing a tool called FerroLens to detect potential unsound
behavior in Rust code in the Linux kernel. FerroLens reported the following
bug in rust/kernel/gendisk.rs.

Gendisk is marked as Send although the fields it contains may not be.
Specifically, the QueueData held in the raw gendisk pointer may not be safe
to send across threads. Therefore, sending the Gendisk from one thread to
another and dropping on a different thread may cause unsound behavior.

Additionally, Gendisk contains an Arc<TagSet<T>>. This Arc would be Send
and Sync if the underlying TagSet<T> were Send and Sync. But this is not
explicitly derived, although it can be, since the API does not modify the
TagSet.

We're not Rust experts, so we may have gotten some things wrong. We'd greatly
appreciate any corrections.


I tried creating a PoC to trigger this bug and make our findings more
solid.

We actually hacked the kernel a bit to enable KCSAN for the Rust pieces,
and it did generate a few crashes, but they are highly unstable.

BUG: KCSAN: data-race in drop_in_place<...GenDisk...> / __srcu_check_read_flavor

Here is the PoC I used. Hopefully, sharing it here in case it can helps
anyone better understand the bug.

---
python3 guest_kcsan_inflight_teardown.py --rounds 20 --inflight-threads 2 --io-threads 2 --io-burst 8 --round-cooldown 0.02

#!/usr/bin/env python3
import os
import threading
import time
import traceback


BASE = "/sys/kernel/config/rnull"
SYS_BLOCK = "/sys/block"
DEVICE_SIZE_MIB = 64
BLOCK_SIZE = 4096
ROUNDS = 220
INFLIGHT_THREADS = 8
POWER_OFF_DELAY_SEC = 0.015
POST_POWEROFF_SPIN_SEC = 0.12


def write_file(path: str, data: str) -> None:
    with open(path, "w", encoding="ascii") as f:
        f.write(data)


def wait_for_path(path: str, timeout_sec: float) -> bool:
    deadline = time.time() + timeout_sec
    while time.time() < deadline:
        if os.path.exists(path):
            return True
        time.sleep(0.001)
    return os.path.exists(path)


def create_device(name: str) -> str:
    path = f"{BASE}/{name}"
    os.mkdir(path)
    write_file(f"{path}/size", f"{DEVICE_SIZE_MIB}\n")
    write_file(f"{path}/blocksize", f"{BLOCK_SIZE}\n")
    write_file(f"{path}/irqmode", "1\n")
    write_file(f"{path}/power", "1\n")
    return path


def inflight_path(name: str) -> str:
    return f"{SYS_BLOCK}/{name}/inflight"


def inflight_worker(name: str, running: threading.Event, errors: list[str]) -> None:
    path = inflight_path(name)
    fd = None
    try:
        if not wait_for_path(path, 1.0):
            errors.append(f"{name}: inflight path not ready")
            return

        fd = os.open(path, os.O_RDONLY)
        while running.is_set():
            try:
                os.lseek(fd, 0, os.SEEK_SET)
                os.read(fd, 128)
            except OSError:
                pass
    except Exception as exc:
        errors.append(f"inflight {name}: {exc!r}\n{traceback.format_exc()}")
    finally:
        if fd is not None:
            try:
                os.close(fd)
            except OSError:
                pass


def destroy_device(path: str, errors: list[str]) -> None:
    for _ in range(1000):
        try:
            os.rmdir(path)
            return
        except OSError:
            time.sleep(0.002)
    errors.append(f"rmdir failed for {path}")


def device_round(name: str, errors: list[str]) -> None:
    path = create_device(name)
    running = threading.Event()
    running.set()

    workers = []
    for _ in range(INFLIGHT_THREADS):
        workers.append(threading.Thread(target=inflight_worker, args=(name, running, errors)))

    for worker in workers:
        worker.start()

    time.sleep(POWER_OFF_DELAY_SEC)
    write_file(f"{path}/power", "0\n")
    time.sleep(POST_POWEROFF_SPIN_SEC)
    running.clear()

    for worker in workers:
        worker.join()

    destroy_device(path, errors)


def main() -> int:
    errors: list[str] = []
    start = time.time()

    for round_id in range(ROUNDS):
        name = f"gi{round_id}"
        try:
            device_round(name, errors)
        except Exception as exc:
            errors.append(f"round {name}: {exc!r}\n{traceback.format_exc()}")

    duration = time.time() - start
    print(f"kcsan_inflight_teardown_done rounds={ROUNDS} duration={duration:.2f}s")
    print(f"errors={len(errors)}")
    for err in errors[:20]:
        print(err)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())



Yuan Tan (1):
  rust: block: mq: make GenDisk Send impl sound

 rust/kernel/block/mq/gen_disk.rs |  8 +++++---
 rust/kernel/block/mq/tag_set.rs  | 11 +++++++++++
 2 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.43.2

